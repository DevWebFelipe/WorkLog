unit UsuarioDAO;

interface

uses
  BaseDAO, UsuarioVO,
  FireDAC.Comp.Client;

type
  TUsuarioDAO = class(TBaseDAO<TUsuarioVO>)
  protected
    function GetTableName: string; override;
  public
    function Alterar(mUsuarioVO: TUsuarioVO): Boolean; override;
    function Buscar: TListaUsuarioVO; override;
    function BuscarPorId(mId: Int64): TUsuarioVO; override;
    function Excluir(mId: Int64): Boolean; override;
    function Inserir(mUsuarioVO: TUsuarioVO): Boolean; override;
    function Login(mLogin, mSenha: string): TUsuarioVO;
  end;

implementation

uses
  System.SysUtils, Data.DB;

{ TUsuarioDAO }

function TUsuarioDAO.GetTableName: string;
begin
  Result := 'usuario';
end;

function TUsuarioDAO.Inserir(mUsuarioVO: TUsuarioVO): Boolean;
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConnection;

    mQuery.SQL.Add('INSERT INTO usuario (nome, login, senha, ativo, data_criacao, data_atualizacao) ');
    mQuery.SQL.Add('VALUES (:mNome, :mLogin, :mSenha, :mAtivo, :mDataCriacao, :mDataAtualizacao)');
    mQuery.ParamByName('mNome').AsString   := mUsuarioVO.Nome;
    mQuery.ParamByName('mLogin').AsString  := mUsuarioVO.Login;
    mQuery.ParamByName('mSenha').AsString  := mUsuarioVO.Senha;
    mQuery.ParamByName('mAtivo').AsBoolean := mUsuarioVO.Ativo;
    mQuery.ParamByName('mDataCriacao').AsDateTime     := Now;
    mQuery.ParamByName('mDataAtualizacao').AsDateTime := Now;

    FConnection.StartTransaction;
    try
      mQuery.ExecSQL;
      FConnection.Commit;
    except
      FConnection.Rollback;
      raise;
    end;

    Result := True;
  finally
    FreeAndNil(mQuery);
  end;
end;

function TUsuarioDAO.Alterar(mUsuarioVO: TUsuarioVO): Boolean;
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConnection;

    mQuery.SQL.Add('UPDATE usuario SET nome = :mNome, login = :mLogin, senha = :mSenha, ativo = :mAtivo,');
    mQuery.SQL.Add('data_atualizacao = :mDataAtualizacao');
    mQuery.SQL.Add('WHERE (id = :mId)');
    mQuery.ParamByName('mId').AsLargeInt := mUsuarioVO.Id;

    mQuery.ParamByName('mNome').AsString   := mUsuarioVO.Nome;
    mQuery.ParamByName('mLogin').AsString  := mUsuarioVO.Login;
    mQuery.ParamByName('mSenha').AsString  := mUsuarioVO.Senha;
    mQuery.ParamByName('mAtivo').AsBoolean := mUsuarioVO.Ativo;
    mQuery.ParamByName('mDataAtualizacao').AsDateTime := Now;

    mQuery.ExecSQL;

    Result := True;
  finally
    FreeAndNil(mQuery);
  end;
end;

function TUsuarioDAO.Buscar: TListaUsuarioVO;
begin
  Result := nil;

  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConnection;

    mQuery.SQL.Add('SELECT *');
    mQuery.SQL.Add('FROM usuario');
    mQuery.SQL.Add('ORDER BY nome');

    mQuery.Open;

    if mQuery.IsEmpty then
      Exit;

    var mListaUsuarioVO := TListaUsuarioVO.Create;
    while (not mQuery.Eof) do
      begin
        var mUsuarioVO := TUsuarioVO.Create;

        mUsuarioVO.Id    := mQuery.FieldByName('id').AsInteger;
        mUsuarioVO.Nome  := mQuery.FieldByName('nome').AsString;
        mUsuarioVO.Login := mQuery.FieldByName('login').AsString;
        mUsuarioVO.Senha := mQuery.FieldByName('senha').AsString;
        mUsuarioVO.Ativo := mQuery.FieldByName('ativo').AsBoolean;
        mUsuarioVO.DataCriacao     := mQuery.FieldByName('data_criacao').AsDateTime;
        mUsuarioVO.DataAtualizacao := mQuery.FieldByName('data_atualizacao').AsDateTime;

        mListaUsuarioVO.Add(mUsuarioVO);

        mQuery.Next;
      end;

    Result := mListaUsuarioVO;
  finally
    FreeAndNil(mQuery);
  end;
end;

function TUsuarioDAO.BuscarPorId(mId: Int64): TUsuarioVO;
begin
  Result := nil;

  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConnection;

    mQuery.SQL.Add('SELECT *');
    mQuery.SQL.Add('FROM usuario');
    mQuery.SQL.Add('WHERE (id = :mId)');
    mQuery.ParamByName('mId').AsLargeInt := mId;

    mQuery.Open;

    if mQuery.IsEmpty then
      Exit;

    var mUsuarioVO := TUsuarioVO.Create;

    mUsuarioVO.Id    := mQuery.FieldByName('id').AsInteger;
    mUsuarioVO.Nome  := mQuery.FieldByName('nome').AsString;
    mUsuarioVO.Login := mQuery.FieldByName('login').AsString;
    mUsuarioVO.Senha := mQuery.FieldByName('senha').AsString;
    mUsuarioVO.Ativo := mQuery.FieldByName('ativo').AsBoolean;
    mUsuarioVO.DataCriacao     := mQuery.FieldByName('data_criacao').AsDateTime;
    mUsuarioVO.DataAtualizacao := mQuery.FieldByName('data_atualizacao').AsDateTime;

    Result := mUsuarioVO;
  finally
    FreeAndNil(mQuery);
  end;
end;

function TUsuarioDAO.Excluir(mId: Int64): Boolean;
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConnection;

    mQuery.SQL.Add('DELETE FROM usuario');
    mQuery.SQL.Add('WHERE (id = :mId)');
    mQuery.ParamByName('mId').AsLargeInt := mId;

    FConnection.StartTransaction;
    try
      mQuery.ExecSQL;
      FConnection.Commit;
    except
      FConnection.Rollback;
      raise;
    end;

    Result := True;
  finally
    FreeAndNil(mQuery);
  end;
end;

function TUsuarioDAO.Login(mLogin, mSenha: string): TUsuarioVO;
begin
  Result := nil;

  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConnection;

    mQuery.SQL.Add('SELECT *');
    mQuery.SQL.Add('FROM usuario');
    mQuery.SQL.Add('WHERE (login = :mLogin)');
    mQuery.ParamByName('mLogin').AsString := mLogin;

    mQuery.Open;

    if (not mQuery.IsEmpty) then
      begin
        if (mQuery.FieldByName('senha').AsString = mSenha) then
          begin
            var mUsuarioVO := TUsuarioVO.Create;

            mUsuarioVO.Id    := mQuery.FieldByName('id').AsInteger;
            mUsuarioVO.Nome  := mQuery.FieldByName('nome').AsString;
            mUsuarioVO.Login := mQuery.FieldByName('login').AsString;
            mUsuarioVO.Senha := mQuery.FieldByName('senha').AsString;
            mUsuarioVO.Ativo := mQuery.FieldByName('ativo').AsBoolean;
            mUsuarioVO.DataCriacao     := mQuery.FieldByName('data_criacao').AsDateTime;
            mUsuarioVO.DataAtualizacao := mQuery.FieldByName('data_atualizacao').AsDateTime;

            Result := mUsuarioVO;
          end;
      end;
  finally
    mQuery.Free;
  end;
end;

end.
