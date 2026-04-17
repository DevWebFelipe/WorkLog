unit BaseDAO;

interface

uses
  IBaseDAO,
  FireDAC.Comp.Client, System.Generics.Collections;

type
  TBaseDAO<T: class, constructor> = class(TInterfacedObject, IBaseDAO<T>)
  protected
    fConexao: TFDConnection;

    function GetNomeTabela: string; virtual; abstract;
  public
    constructor Create(mConexao: TFDConnection);

    function Buscar: TObjectList<T>; virtual; abstract;
    function BuscarPorId(mId: Int64): T; virtual; abstract;
    function Inserir(mVO: T): Boolean; virtual; abstract;
    function Alterar(mVO: T): Boolean; virtual; abstract;
    function Excluir(mId: Int64): Boolean; virtual; abstract;
  end;

implementation

uses
  System.SysUtils;

{ TBaseDAO<T> }

{ TBaseDAO<T> }

constructor TBaseDAO<T>.Create(mConexao: TFDConnection);
begin
  inherited Create;

  fConexao := mConexao;
end;

end.
