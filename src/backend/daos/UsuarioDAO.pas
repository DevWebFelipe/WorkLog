unit UsuarioDAO;

interface

uses
  BaseDAO, UsuarioVO,
  FireDAC.Comp.Client;

type
  TUsuarioDAO = class(TBaseDAO<TUsuarioVO>)
  protected
    function GetNomeTabela: string; override;
    function MapToVO(mQuery: TFDQuery): TUsuarioVO;
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
  System.SysUtils;

{ TUsuarioDAO }

function TUsuarioDAO.GetNomeTabela: string;
begin
  Result := 'usuario';
end;

function TUsuarioDAO.MapToVO(mQuery: TFDQuery): TUsuarioVO;
begin
  Result := TUsuarioVO.Create;

  Result.Id    := mQuery.FieldByName('id').AsInteger;
  Result.Nome  := mQuery.FieldByName('nome').AsString;
  Result.Login := mQuery.FieldByName('login').AsString;
  Result.Senha := mQuery.FieldByName('senha').AsString;
  Result.Ativo := mQuery.FieldByName('ativo').AsBoolean;
  Result.DataCriacao     := mQuery.FieldByName('data_criacao').AsDateTime;
  Result.DataAtualizacao := mQuery.FieldByName('data_atualizacao').AsDateTime;
end;

function TUsuarioDAO.Inserir(mUsuarioVO: TUsuarioVO): Boolean;
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConexao;

    mQuery.SQL.Add('INSERT INTO usuario (nome, login, senha, ativo, data_criacao, data_atualizacao)');
    mQuery.SQL.Add('VALUES (:nome, :login, :senha, :ativo, :data_criacao, :data_atualizacao)');
    mQuery.ParamByName('nome').AsString   := mUsuarioVO.Nome;
    mQuery.ParamByName('login').AsString  := mUsuarioVO.Login;
    mQuery.ParamByName('senha').AsString  := mUsuarioVO.Senha;
    mQuery.ParamByName('ativo').AsBoolean := mUsuarioVO.Ativo;
    mQuery.ParamByName('data_criacao').AsDateTime     := Now;
    mQuery.ParamByName('data_atualizacao').AsDateTime := Now;

    mQuery.ExecSQL;

    Result := True;
  finally
    FreeAndNil(mQuery);
  end;
end;

function TUsuarioDAO.Alterar(mUsuarioVO: TUsuarioVO): Boolean;
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConexao;

    mQuery.SQL.Add('UPDATE usuario SET nome = :nome, login = :login, senha = :senha, ativo = :ativo,');
    mQuery.SQL.Add('data_atualizacao = :data_atualizacao');
    mQuery.SQL.Add('WHERE (id = :mId)');
    mQuery.ParamByName('mId').AsLargeInt := mUsuarioVO.Id;
    mQuery.ParamByName('nome').AsString := mUsuarioVO.Nome;
    mQuery.ParamByName('login').AsString := mUsuarioVO.Login;
    mQuery.ParamByName('senha').AsString := mUsuarioVO.Senha;
    mQuery.ParamByName('ativo').AsBoolean := mUsuarioVO.Ativo;
    mQuery.ParamByName('data_atualizacao').AsDateTime := Now;

    mQuery.ExecSQL;

    Result := True;
  finally
    FreeAndNil(mQuery);
  end;
end;

function TUsuarioDAO.Buscar: TListaUsuarioVO;
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConexao;
    mQuery.SQL.Add('SELECT *');
    mQuery.SQL.Add('FROM usuario');
    mQuery.SQL.Add('ORDER BY nome');
    mQuery.Open;

    if mQuery.IsEmpty then
      Exit(nil);

    var mLista := TListaUsuarioVO.Create;

    while (not mQuery.Eof) do
      begin
        mLista.Add(MapToVO(mQuery));
        mQuery.Next;
      end;

    Result := mLista;
  finally
    FreeAndNil(mQuery);
  end;
end;

function TUsuarioDAO.BuscarPorId(mId: Int64): TUsuarioVO;
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConexao;

    mQuery.SQL.Add('SELECT *');
    mQuery.SQL.Add('FROM usuario');
    mQuery.SQL.Add('WHERE (id = :mId)');
    mQuery.ParamByName('mId').AsLargeInt := mId;
    mQuery.Open;

    if mQuery.IsEmpty then
      Exit(nil);

    Result := MapToVO(mQuery);
  finally
    FreeAndNil(mQuery);
  end;
end;

function TUsuarioDAO.Excluir(mId: Int64): Boolean;
var
  mQuery: TFDQuery;
begin
  mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConexao;

    mQuery.SQL.Add('DELETE FROM usuario');
    mQuery.SQL.Add('WHERE (id = :mId)');
    mQuery.ParamByName('mId').AsLargeInt := mId;

    mQuery.ExecSQL;

    Result := True;
  finally
    FreeAndNil(mQuery);
  end;
end;

function TUsuarioDAO.Login(mLogin, mSenha: string): TUsuarioVO;
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConexao;

    mQuery.SQL.Add('SELECT *');
    mQuery.SQL.Add('FROM usuario');
    mQuery.SQL.Add('WHERE (login = :mLogin)');
    mQuery.ParamByName('mLogin').AsString := mLogin;

    mQuery.Open;

    if (not mQuery.IsEmpty) then
      begin
        if (mQuery.FieldByName('senha').AsString = mSenha) then
          Exit(MapToVO(mQuery));
      end;

    Result := nil;
  finally
    FreeAndNil(mQuery);
  end;
end;

end.
