unit IBaseDAO;

interface

uses
  System.Generics.Collections;

type
  IBaseDAO<T: class> = interface
    ['{D2A6B6D2-8F7C-4F2A-9C5B-123456789ABC}']

    function Inserir(mEntidade: T): Boolean;
    function Alterar(mEntidade: T): Boolean;
    function Excluir(mId: Int64): Boolean;
    function Buscar: TObjectList<T>;
    function BuscarPorId(mId: Int64): T;
  end;

implementation

end.
