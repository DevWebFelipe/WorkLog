unit Routes;

interface

uses
  Horse;

procedure RegistrarRotas;

implementation

uses
  UsuarioController, RouteRegistry, LibSistema;

procedure RegistrarRotas;
begin
  TRouteRegistry.RegistrarCRUD<TUsuarioDTO>('/usuario', TUsuarioController);

  // rota específica continua manual
//  THorse.Post('/usuario/login', TUsuarioController.Login);
end;

end.
