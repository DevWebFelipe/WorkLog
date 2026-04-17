unit IBaseService;

interface

uses
  System.Generics.Collections;

type
  IBaseService<TDTO: class> = interface
    ['{A1B2C3D4-1234-5678-9101-ABCDEF123456}']

    function Buscar: TObjectList<TDTO>;
    function BuscarPorId(mId: Int64): TDTO;
    function Inserir(mDTO: TDTO): Boolean;
    function Alterar(mId: Int64; mDTO: TDTO): Boolean;
    function Excluir(mId: Int64): Boolean;
  end;

implementation

end.
