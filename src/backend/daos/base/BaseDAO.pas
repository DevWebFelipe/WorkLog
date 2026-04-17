unit BaseDAO;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, System.Generics.Collections;

type
  TSQLParam = record
    Nome: string;
    Valor: Variant;
  end;

  TBaseDAO<T: class, constructor> = class(TInterfacedObject)
  protected
    fConexao: TFDConnection;

    function CreateQuery: TFDQuery;

    procedure ExecutarSQL(const mSQL: string; const mParams: array of TSQLParam);
    function OpenQuery(const mSQL: string; const mParams: array of TSQLParam): TFDQuery;

    function GetNomeTabela: string; virtual; abstract;

  public
    constructor Create(mConexao: TFDConnection);

    function Inserir(mEntidade: T): Boolean; virtual; abstract;
    function Alterar(mEntidade: T): Boolean; virtual; abstract;
    function Excluir(mId: Int64): Boolean; virtual; abstract;
    function Buscar: TObjectList<T>; virtual; abstract;
    function BuscarPorId(mId: Int64): T; virtual; abstract;
  end;

function Param(const mNome: string; const mValor: Variant): TSQLParam;

implementation

function Param(const mNome: string; const mValor: Variant): TSQLParam;
begin
  Result.Nome  := mNome;
  Result.Valor := mValor;
end;

{ TBaseDAO<T> }

constructor TBaseDAO<T>.Create(mConexao: TFDConnection);
begin
  inherited Create;

  fConexao := mConexao;
end;

function TBaseDAO<T>.CreateQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := fConexao;
end;

procedure TBaseDAO<T>.ExecutarSQL(const mSQL: string; const mParams: array of TSQLParam);
begin
  var mQuery := CreateQuery;
  try
    mQuery.SQL.Add(mSQL);

    for var mParam in mParams do
      mQuery.ParamByName(mParam.Nome).Value := mParam.Valor;

    mQuery.ExecSQL;
  finally
    mQuery.Free;
  end;
end;

function TBaseDAO<T>.OpenQuery(const mSQL: string; const mParams: array of TSQLParam): TFDQuery;
begin
  Result := CreateQuery;
  Result.SQL.Add(mSQL);

  for var mParam in mParams do
    Result.ParamByName(mParam.Nome).Value := mParam.Valor;

  Result.Open;
end;

end.
