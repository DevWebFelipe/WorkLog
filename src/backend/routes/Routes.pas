unit Routes;

interface

uses
  Horse;

procedure RoutesRegister;

implementation

uses
  PingController, UsuarioController;

procedure RoutesRegister;
begin
  THorse.Post('/Usuario/login', TUsuarioController.Login);
  THorse.Post('/Usuario', TUsuarioController.Inserir);
  THorse.Get('/Usuario', TUsuarioController.Buscar);
  THorse.Get('/Usuario/:id', TUsuarioController.BuscarPorId);
  THorse.Put('/Usuario/:id', TUsuarioController.Alterar);
  THorse.Delete('/Usuario/:id', TUsuarioController.Excluir);
end;

end.
