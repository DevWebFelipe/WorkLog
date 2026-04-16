unit UsuarioController;

interface

uses
  Horse;

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
  System.SysUtils, System.JSON;

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
      var mJSONList := TJSONArray.Create;
      var mListaUsuarioVO := mDAO.Buscar;
      for var mUsuarioVO in mListaUsuarioVO  do
        begin
          var mJSONResponse := TJSONObject.Create;
          mJSONResponse.AddPair('id', TJSONNumber.Create(mUsuarioVO.Id));
          mJSONResponse.AddPair('nome', mUsuarioVO.Nome);
          mJSONResponse.AddPair('login', mUsuarioVO.Login);

          mJSONList.AddElement(mJSONResponse);
        end;

      if (mJSONList.Count <= 0) then
        mResposta.Status(401).Send('Não foi possível buscar a lista.')
      else
        mResposta.Status(200).Send(mJSONList.ToJSON);
    finally
      FreeAndNil(mDAO);
    end;
  finally
    FreeAndNil(mDM);
  end;
end;

class procedure TUsuarioController.BuscarPorId(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
begin
  var mId := mRequisicao.Params['id'];
  var mDM := TDMConexao.Create(nil);
  try
    var mDAO := TUsuarioDAO.Create(mDM.GetConnection);
    try
      var mUsuarioVO := mDAO.BuscarPorId(mId.ToInteger);
      if (not Assigned(mUsuarioVO)) or (mUsuarioVO.Id <= 0) then
        begin
          mResposta.Status(401).Send('Não foi possível encontrar o registro buscado.');
          Exit;
        end;

      var mJSONResponse := TJSONObject.Create;
      mJSONResponse.AddPair('id', TJSONNumber.Create(mUsuarioVO.Id));
      mJSONResponse.AddPair('nome', mUsuarioVO.Nome);
      mJSONResponse.AddPair('login', mUsuarioVO.Login);

      mResposta.Status(200).Send(mJSONResponse.ToJson);
    finally
      FreeAndNil(mDAO);
    end;
  finally
    FreeAndNil(mDM);
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
        var mUsuarioVO   := TUsuarioVO.Create;
        mUsuarioVO.Nome  := mNome;
        mUsuarioVO.Login := mLogin;
        mUsuarioVO.Senha := mSenha;
        mUsuarioVO.Ativo := mAtivo;

        if mDAO.Inserir(mUsuarioVO) then
          mResposta.Status(200).Send('Registro inserido com sucesso.')
        else
          mResposta.Status(401).Send('Não foi possível inserir o usuário.');
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

class procedure TUsuarioController.Login(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc);
begin
  var mJSON := (TJSONObject.ParseJSONValue(mRequisicao.Body) as TJSONObject);
  try
    if (not Assigned(mJSON)) then
      begin
        mResposta.Status(400).Send('Body inválido.');
        Exit;
      end;

    var mLogin := mJSON.GetValue<String>('login');
    var mSenha := mJSON.GetValue<String>('senha');

    if mLogin.Trim.IsEmpty then
      begin
        mResposta.Status(400).Send('Campo login não informado.');
        Exit;
      end;

    if mSenha.Trim.IsEmpty then
      begin
        mResposta.Status(400).Send('Campo senha não informado.');
        Exit;
      end;

    var mDM := TDMConexao.Create(nil);
    try
      var mDAO := TUsuarioDAO.Create(mDM.GetConnection);
      try
        var mUsuario := mDAO.Login(mLogin, mSenha);

        if Assigned(mUsuario) then
          begin
            var mJSONResponse := TJSONObject.Create;
            mJSONResponse.AddPair('id', TJSONNumber.Create(mUsuario.Id));
            mJSONResponse.AddPair('nome', mUsuario.Nome);
            mJSONResponse.AddPair('login', mUsuario.Login);

            mResposta.Status(200).Send(mJSONResponse);
          end
        else
          mResposta.Status(401).Send('Usuário ou senha inválidos.');
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

end.
