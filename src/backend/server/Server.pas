unit Server;

interface

procedure IniciarServidor;

implementation

uses
  Horse, Routes;

procedure IniciarServidor;
begin
  RegistrarRotas;

  THorse.Listen(9000);
end;

end.
