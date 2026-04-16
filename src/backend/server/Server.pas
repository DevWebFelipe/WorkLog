unit Server;

interface

procedure StartServer;

implementation

uses
  Horse, Routes;

procedure StartServer;
begin
  RoutesRegister;

  THorse.Listen(9000);
end;

end.
