unit UsuarioController;

interface

uses
  Horse, JsonHelper, UsuarioDTO, UsuarioMapper, LibSistema, BaseController, IBaseService,
  FireDAC.Comp.Client;

type
  TUsuarioController = class(TBaseController<TUsuarioDTO>)
  protected
    function GetServico(mConexao: TFDConnection): IBaseService<TUsuarioDTO>; override;
  end;

implementation

uses
  UsuarioService,
  System.SysUtils, System.JSON, System.Generics.Collections;

{ TUsuarioController }

function TUsuarioController.GetServico(mConexao: TFDConnection): IBaseService<TUsuarioDTO>;
begin
  Result := TUsuarioService.Create(mConexao);
end;

end.
