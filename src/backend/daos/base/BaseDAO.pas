unit BaseDAO;

interface

uses
  FireDAC.Comp.Client, System.Generics.Collections;

type
  TBaseDAO<T: class, constructor> = class
  protected
    FConnection: TFDConnection;

    function GetTableName: string; virtual; abstract;
  public
    constructor Create(mConnection: TFDConnection);

    function Inserir(mObj: T): Boolean; virtual;
    function Alterar(mObj: T): Boolean; virtual;
    function Excluir(mId: Int64): Boolean; virtual;
    function BuscarPorId(mId: Int64): T; virtual;
    function Buscar: TObjectList<T>; virtual;
  end;

implementation

uses
  System.SysUtils;

{ TBaseDAO<T> }

constructor TBaseDAO<T>.Create(mConnection: TFDConnection);
begin
  FConnection := mConnection;
end;

function TBaseDAO<T>.Inserir(mObj: T): Boolean;
begin
  Result := False;
end;

function TBaseDAO<T>.Alterar(mObj: T): Boolean;
begin
  Result := False;
end;

function TBaseDAO<T>.Excluir(mId: Int64): Boolean;
var
  mQuery: TFDQuery;
begin
  mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConnection;
    mQuery.SQL.Text := 'DELETE FROM ' + GetTableName + ' WHERE id = :id';
    mQuery.ParamByName('id').AsLargeInt := mId;
    mQuery.ExecSQL;

    Result := True;
  finally
    FreeAndNil(mQuery);
  end;
end;

function TBaseDAO<T>.Buscar: TObjectList<T>;
begin
  Result := nil;
end;

function TBaseDAO<T>.BuscarPorId(mId: Int64): T;
begin
  Result := nil;
end;

end.
