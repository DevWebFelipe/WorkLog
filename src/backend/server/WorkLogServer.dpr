program WorkLogServer;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  Server in 'Server.pas',
  Routes in '..\routes\Routes.pas',
  uDMConexao in '..\datamodules\uDMConexao.pas' {DMConexao: TDataModule},
  UsuarioDAO in '..\daos\UsuarioDAO.pas',
  UsuarioVO in '..\vos\UsuarioVO.pas',
  UsuarioController in '..\controllers\UsuarioController.pas',
  BaseDAO in '..\daos\BaseDAO.pas',
  BaseVO in '..\vos\BaseVO.pas',
  LibSistema in '..\libs\LibSistema.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
