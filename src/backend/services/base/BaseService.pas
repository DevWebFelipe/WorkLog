unit BaseService;

interface

uses
  IBaseDAO, IBaseService,
  System.Generics.Collections, FireDAC.Comp.Client;

type
  TBaseService<TVO: class, constructor; TDTO: class, constructor> = class(TInterfacedObject, IBaseService<TDTO>)
  protected
    fConexao: TFDConnection;

    function GetDAO: IBaseDAO<TVO>; virtual; abstract;
    function VOToDTO(mVO: TVO): TDTO; virtual; abstract;
    function DTOToVO(mDTO: TDTO): TVO; virtual; abstract;
    procedure TransacaoStart;
    procedure TransacaoCommit;
    procedure TransacaoRollback;
  public
    constructor Create(mConexao: TFDConnection);

    function Buscar: TObjectList<TDTO>;
    function BuscarPorId(mId: Int64): TDTO;
    function Inserir(mDTO: TDTO): Boolean;
    function Alterar(mId: Int64; mDTO: TDTO): Boolean;
    function Excluir(mId: Int64): Boolean;
  end;

implementation

{ TBaseService }

function TBaseService<TVO, TDTO>.Buscar: TObjectList<TDTO>;
begin
  var mListaVO := GetDAO.Buscar;

  Result := TObjectList<TDTO>.Create;

  for var mVO in mListaVO do
    Result.Add(VOToDTO(mVO));
end;

function TBaseService<TVO, TDTO>.BuscarPorId(mId: Int64): TDTO;
begin
  var mVO := GetDAO.BuscarPorId(mId);

  if (not Assigned(mVO)) then
    Exit(nil);

  Result := VOToDTO(mVO);
end;

function TBaseService<TVO, TDTO>.Inserir(mDTO: TDTO): Boolean;
begin
  Result := False;
  var mVO := DTOToVO(mDTO);

  TransacaoStart;
  try
    Result := GetDAO.Inserir(mVO);
    TransacaoCommit;
  except
    TransacaoRollback;
    raise;
  end;
end;

function TBaseService<TVO, TDTO>.Alterar(mId: Int64; mDTO: TDTO): Boolean;
begin
  Result := False;

  var mVO := GetDAO.BuscarPorId(mId);

  if (not Assigned(mVO)) then
    Exit(False);

  var mNovoVO := DTOToVO(mDTO);
  mVO := mNovoVO;

  TransacaoStart;
  try
    Result := GetDAO.Alterar(mVO);
    TransacaoCommit;
  except
    TransacaoRollback;
    raise;
  end;
end;

function TBaseService<TVO, TDTO>.Excluir(mId: Int64): Boolean;
begin
  Result := False;

  TransacaoStart;
  try
    Result := GetDAO.Excluir(mId);
    TransacaoCommit;
  except
    TransacaoRollback;
    raise;
  end;
end;

constructor TBaseService<TVO, TDTO>.Create(mConexao: TFDConnection);
begin
  inherited Create;
  fConexao := mConexao;
end;

procedure TBaseService<TVO, TDTO>.TransacaoStart;
begin
  if (not fConexao.InTransaction) then
    fConexao.StartTransaction;
end;

procedure TBaseService<TVO, TDTO>.TransacaoCommit;
begin
  if fConexao.InTransaction then
    fConexao.StartTransaction;
end;

procedure TBaseService<TVO, TDTO>.TransacaoRollback;
begin
  if fConexao.InTransaction then
    fConexao.Rollback;
end;

end.
