unit BaseController;

interface

uses
  Horse, IBaseService,
  FireDAC.Comp.Client;

type
  TBaseController<TDTO: class, constructor> = class
  protected
    function GetServico(mConexao: TFDConnection): IBaseService<TDTO>; virtual; abstract;
  public
    procedure Buscar(mRequisicao: THorseRequest; mResposta: THorseResponse);
    procedure BuscarPorId(mRequisicao: THorseRequest; mResposta: THorseResponse);
    procedure Inserir(mRequisicao: THorseRequest; mResposta: THorseResponse);
    procedure Alterar(mRequisicao: THorseRequest; mResposta: THorseResponse);
    procedure Excluir(mRequisicao: THorseRequest; mResposta: THorseResponse);
  end;

implementation

uses
  JsonHelper, uDMConexao,
  System.SysUtils, System.Generics.Collections;

{ TBaseController }

procedure TBaseController<TDTO>.Buscar(mRequisicao: THorseRequest; mResposta: THorseResponse);
begin
  var mDMConexao := TDMConexao.Create(nil);
  try
    var mServico: IBaseService<TDTO> := GetServico(mDMConexao.GetConexao);
    var mLista := mServico.Buscar;
    mResposta.Send(TJsonHelper.ObjectToJson<TObjectList<TDTO>>(mLista));
  finally
    FreeAndNil(mDMConexao);
  end;
end;

procedure TBaseController<TDTO>.BuscarPorId(mRequisicao: THorseRequest; mResposta: THorseResponse);
begin
  var mDMConexao := TDMConexao.Create(nil);
  try
    var mService: IBaseService<TDTO> := GetServico(mDMConexao.GetConexao);
    var mDTO := mService.BuscarPorId(mRequisicao.Params['id'].ToInteger);
    if (not Assigned(mDTO)) then
      begin
        mResposta.Status(404).Send('Não encontrado');
        Exit;
      end;

    mResposta.Send(TJsonHelper.ObjectToJson<TDTO>(mDTO));
  finally
    FreeAndNil(mDMConexao);
  end;
end;

procedure TBaseController<TDTO>.Inserir(mRequisicao: THorseRequest; mResposta: THorseResponse);
begin
  var mDMConexao := TDMConexao.Create(nil);
  try
    var mService: IBaseService<TDTO> := GetServico(mDMConexao.GetConexao);
    var mDTO := TJsonHelper.JsonToObject<TDTO>(mRequisicao.Body);
    if mService.Inserir(mDTO) then
      mResposta.Send('Inserido com sucesso')
    else
      mResposta.Status(400).Send('Erro ao inserir');
  finally
    FreeAndNil(mDMConexao);
  end;
end;

procedure TBaseController<TDTO>.Alterar(mRequisicao: THorseRequest; mResposta: THorseResponse);
begin
  var mDMConexao := TDMConexao.Create(nil);
  try
    var mService: IBaseService<TDTO> := GetServico(mDMConexao.GetConexao);
    var mDTO := TJsonHelper.JsonToObject<TDTO>(mRequisicao.Body);
    if mService.Alterar(mRequisicao.Params['id'].ToInteger, mDTO) then
      mResposta.Send('Alterado com sucesso')
    else
      mResposta.Status(400).Send('Erro ao alterar');
  finally
    FreeAndNil(mDMConexao);
  end;
end;

procedure TBaseController<TDTO>.Excluir(mRequisicao: THorseRequest; mResposta: THorseResponse);
begin
  var mDMConexao := TDMConexao.Create(nil);
  try
    var mService: IBaseService<TDTO> := GetServico(mDMConexao.GetConexao);
    if mService.Excluir(mRequisicao.Params['id'].ToInteger) then
      mResposta.Send('Excluído com sucesso')
    else
      mResposta.Status(400).Send('Erro ao excluir');
  finally
    FreeAndNil(mDMConexao);
  end;
end;

end.
