unit UsuarioController;

interface

uses
  Horse, JsonHelper, UsuarioDTO, UsuarioMapper;

type
  TUsuarioController = class
  public
    class procedure Alterar(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
    class procedure Buscar(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
    class procedure BuscarPorId(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
    class procedure Excluir(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
    class procedure Inserir(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);

    class procedure Login(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
  end;

implementation

uses
  LibSistema, uDMConexao,
  System.SysUtils, System.JSON, System.Generics.Collections;

{ TUsuarioController }

class procedure TUsuarioController.Alterar(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
begin
  var mId   := mRequisicao.Params['id'];
  var mJSON := (TJSONObject.ParseJSONValue(mRequisicao.Body) as TJSONObject);
  try
    if (not Assigned(mJSON)) then
      begin
        mResposta.Status(400).Send('Body inválido.');
        Exit;
      end;

    var mNome  := mJSON.GetValue<String>('nome');
    var mLogin := mJSON.GetValue<String>('login');
    var mSenha := mJSON.GetValue<String>('senha');
    var mAtivo := mJSON.GetValue<Boolean>('ativo');

    var mDM := TDMConexao.Create(nil);
    try
      var mDAO := TUsuarioDAO.Create(mDM.GetConnection);
      try
        var mUsuarioVO := mDAO.BuscarPorId(mId.ToInteger);

        mUsuarioVO.Nome  := mNome;
        mUsuarioVO.Login := mLogin;
        mUsuarioVO.Senha := mSenha;
        mUsuarioVO.Ativo := mAtivo;

        mDAO.Alterar(mUsuarioVO);

        if (mUsuarioVO.Id <= 0) then
          mResposta.Status(401).Send('Não foi possível encontrar o registro buscado.')
        else
          mResposta.Status(200).Send('Registro alterado com sucesso.');
      finally
        FreeAndNil(mDAO);
      end;
    finally
      FreeAndNil(mDM);
    end;
  finally
    if Assigned(mJSON) then
      FreeAndNil(mJSON);
  end;
end;

class procedure TUsuarioController.Buscar(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
begin
  var mDM := TDMConexao.Create(nil);
  try
    var mDAO := TUsuarioDAO.Create(mDM.GetConnection);
    try
      var mListaUsuarioVO := mDAO.Buscar;
      var mListaDTO := TObjectList<TUsuarioDTO>.Create;
      for var mVO in mListaUsuarioVO do
        mListaDTO.Add(TUsuarioMapper.VOToDTO(mVO));

      if (mListaDTO.Count <= 0) then
        mResposta.Status(401).Send('Não foi possível buscar a lista.')
      else
        mResposta.Status(200).Send(TJsonHelper.ObjectToJson<TObjectList<TUsuarioDTO>>(mListaDTO));
    finally
      FreeAndNil(mDAO);
    end;
  finally
    FreeAndNil(mDM);
  end;
end;

class procedure TUsuarioController.BuscarPorId(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
begin
  var mId := mRequisicao.Params['id'].ToInteger;
  var mDM := TDMConexao.Create(nil);
  try
    var mDAO := TUsuarioDAO.Create(mDM.GetConnection);
    try
      var mVO := mDAO.BuscarPorId(mId);
      if (not Assigned(mVO)) then
        begin
          mResposta.Status(404).Send('Não encontrado.');
          Exit;
        end;
      var mDTO := TUsuarioMapper.VOToDTO(mVO);
      mResposta
        .Status(200)
        .Send(TJsonHelper.ObjectToJson<TUsuarioDTO>(mDTO));
    finally
      mDAO.Free;
    end;
  finally
    mDM.Free;
  end;
end;

class procedure TUsuarioController.Excluir(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
begin
  var mId := mRequisicao.Params['id'];
  var mDM := TDMConexao.Create(nil);
  try
    var mDAO := TUsuarioDAO.Create(mDM.GetConnection);
    try
      var mUsuarioVO := mDAO.Excluir(mId.ToInteger);

      if (mId.ToInteger <= 0) then
        mResposta.Status(401).Send('Não foi possível encontrar o registro buscado.')
      else
        mResposta.Status(200).Send('Registro excluído com sucesso.');
    finally
      FreeAndNil(mDAO);
    end;
  finally
    FreeAndNil(mDM);
  end;
end;

class procedure TUsuarioController.Inserir(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
begin
  var mDTO := TJsonHelper.JsonToObject<TUsuarioDTO>(mRequisicao.Body);
  if not Assigned(mDTO) then
    begin
      mResposta.Status(400).Send('Body inválido.');
      Exit;
    end;
  var mDM := TDMConexao.Create(nil);
  try
    var mDAO := TUsuarioDAO.Create(mDM.GetConnection);
    try
      var mVO := TUsuarioMapper.DTOToVO(mDTO);
      if mDAO.Inserir(mVO) then
        mResposta.Status(200).Send('Registro inserido com sucesso.')
      else
        mResposta.Status(400).Send('Erro ao inserir.');
    finally
      mDAO.Free;
    end;
  finally
    mDM.Free;
  end;
end;

class procedure TUsuarioController.Login(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
begin
  var mDTO := TJsonHelper.JsonToObject<TUsuarioDTO>(mRequisicao.Body);

  if mDTO.Login.Trim.IsEmpty then
    begin
      mResposta.Status(400).Send('Campo login não informado.');
      Exit;
    end;

  if mDTO.Senha.Trim.IsEmpty then
    begin
      mResposta.Status(400).Send('Campo senha não informado.');
      Exit;
    end;

  var mDM := TDMConexao.Create(nil);
  try
    var mDAO := TUsuarioDAO.Create(mDM.GetConnection);
    try
      var mVO := mDAO.Login(mDTO.Login, mDTO.Senha);

      if Assigned(mVO) then
        begin
          mDTO := TUsuarioMapper.VOToDTO(mVO);
          mResposta.Status(200).Send(TJsonHelper.ObjectToJson<TUsuarioDTO>(mDTO));
        end
      else
        mResposta.Status(401).Send('Usuário ou senha inválidos.');
    finally
      FreeAndNil(mDAO);
    end;
  finally
    FreeAndNil(mDM);
  end;
end;

end.
