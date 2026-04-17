unit RouteRegistry;

interface

uses
  Horse, BaseController, IBaseService,
  System.SysUtils, FireDAC.Comp.Client;

type
  TControllerClass = class of TObject;

  TRouteRegistry = class
  public
    class procedure RegistrarCRUD<TDTO: class, constructor>(const mCaminhoBase: string; mClasseControle: TControllerClass);
  end;

implementation

uses
  uDMConexao;

{ TRouteRegistry }

class procedure TRouteRegistry.RegistrarCRUD<TDTO>(const mCaminhoBase: string; mClasseControle: TControllerClass);
begin
  // GET LISTA
  THorse.Get(mCaminhoBase,
    procedure(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc)
    var
      mControle: TBaseController<TDTO>;
    begin
      mControle := TBaseController<TDTO>(mClasseControle.Create);
      try
        mControle.Buscar(mRequisicao, mResposta);
      finally
        FreeAndNil(mControle);
      end;
    end);

  // GET POR ID
  THorse.Get(mCaminhoBase + '/:id',
    procedure(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc)
    var
      mControle: TBaseController<TDTO>;
    begin
      mControle := TBaseController<TDTO>(mClasseControle.Create);
      try
        mControle.BuscarPorId(mRequisicao, mResposta);
      finally
        FreeAndNil(mControle);
      end;
    end);

  // POST
  THorse.Post(mCaminhoBase,
    procedure(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc)
    var
      mControle: TBaseController<TDTO>;
    begin
      mControle := TBaseController<TDTO>(mClasseControle.Create);
      try
        mControle.Inserir(mRequisicao, mResposta);
      finally
        FreeAndNil(mControle);
      end;
    end);

  // PUT
  THorse.Put(mCaminhoBase + '/:id',
    procedure(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc)
    var
      mControle: TBaseController<TDTO>;
    begin
      mControle := TBaseController<TDTO>(mClasseControle.Create);
      try
        mControle.Alterar(mRequisicao, mResposta);
      finally
        FreeAndNil(mControle);
      end;
    end);

  // DELETE
  THorse.Delete(mCaminhoBase + '/:id',
    procedure(mRequisicao: THorseRequest; mResposta: THorseResponse; Next: TProc)
    var
      mControle: TBaseController<TDTO>;
    begin
      mControle := TBaseController<TDTO>(mClasseControle.Create);
      try
        mControle.Excluir(mRequisicao, mResposta);
      finally
        FreeAndNil(mControle);
      end;
    end);
end;

end.
