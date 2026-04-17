unit UsuarioDAO;

interface

uses
  BaseDAO, UsuarioVO, IBaseDAO,
  FireDAC.Comp.Client, System.Generics.Collections;

type
  TUsuarioDAO = class(TBaseDAO<TUsuarioVO>, IBaseDAO<TUsuarioVO>)
  private
    function Login(mLogin, mSenha: string): TUsuarioVO;
  protected
    function GetNomeTabela: string; override;
    function MapToVO(mQuery: TFDQuery): TUsuarioVO;
  public
    function Inserir(mUsuarioVO: TUsuarioVO): Boolean; override;
    function Alterar(mUsuarioVO: TUsuarioVO): Boolean; override;
    function Excluir(mId: Int64): Boolean; override;
    function Buscar: TObjectList<TUsuarioVO>; override;
    function BuscarPorId(mId: Int64): TUsuarioVO; override;
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
  ExecutarSQL('INSERT INTO usuario (nome, login, senha, ativo, data_criacao, data_atualizacao) ' +
              'VALUES (:nome, :login, :senha, :ativo, :data_criacao, :data_atualizacao)',
              [Param('nome', mUsuarioVO.Nome),
               Param('login', mUsuarioVO.Login),
               Param('senha', mUsuarioVO.Senha),
               Param('ativo', mUsuarioVO.Ativo),
               Param('data_criacao', Now),
               Param('data_atualizacao', Now)]);

  Result := True;
end;

function TUsuarioDAO.Alterar(mUsuarioVO: TUsuarioVO): Boolean;
begin
  ExecutarSQL('UPDATE usuario SET nome = :nome, login = :login, senha = :senha, ativo = :ativo, ' +
              'data_atualizacao = :data_atualizacao WHERE id = :id',
              [Param('nome', mUsuarioVO.Nome),
               Param('login', mUsuarioVO.Login),
               Param('senha', mUsuarioVO.Senha),
               Param('ativo', mUsuarioVO.Ativo),
               Param('data_atualizacao', Now),
               Param('Id', mUsuarioVO.Id)]);

  Result := True;
end;

function TUsuarioDAO.Buscar: TListaUsuarioVO;
begin
  var mQuery := OpenQuery('SELECT * FROM usuario ORDER BY nome', [] );
  try
    if mQuery.IsEmpty then
      Exit(nil);

    Result := TListaUsuarioVO.Create;

    while (not mQuery.Eof) do
      begin
        Result.Add(MapToVO(mQuery));
        mQuery.Next;
      end;
  finally
    mQuery.Free;
  end;
end;

function TUsuarioDAO.BuscarPorId(mId: Int64): TUsuarioVO;
begin
  var mQuery := OpenQuery('SELECT * FROM usuario WHERE (id = :mId)', [Param('mId', mId)]);
  try
    if mQuery.IsEmpty then
      Exit(nil);

    Result := MapToVO(mQuery);
  finally
    mQuery.Free;
  end;
end;

function TUsuarioDAO.Excluir(mId: Int64): Boolean;
begin
  ExecutarSQL('DELETE FROM usuario WHERE (id = :mId)', [Param('mId', mId)]);

  Result := True;
end;

function TUsuarioDAO.Login(mLogin, mSenha: string): TUsuarioVO;
begin
  var mQuery := OpenQuery('SELECT * FROM usuario WHERE (login = :mLogin)', [Param('mLogin', mLogin)]);
  try
    if (not mQuery.IsEmpty) and (mQuery.FieldByName('senha').AsString = mSenha) then
      Exit(MapToVO(mQuery));

    Result := nil;
  finally
    mQuery.Free;
  end;
end;

end.
