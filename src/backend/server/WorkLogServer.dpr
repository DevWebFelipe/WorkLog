program WorkLogServer;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  Server in 'Server.pas',
  Routes in '..\routes\Routes.pas',
  uDMConexao in '..\datamodules\uDMConexao.pas' {DMConexao: TDataModule},
  UsuarioDAO in '..\daos\UsuarioDAO.pas',
  UsuarioVO in '..\vos\UsuarioVO.pas',
  BaseDAO in '..\daos\base\BaseDAO.pas',
  BaseVO in '..\vos\base\BaseVO.pas',
  LibSistema in '..\libs\LibSistema.pas',
  UsuarioDTO in '..\..\shared\dtos\usuario\UsuarioDTO.pas',
  JsonHelper in '..\..\shared\libUtil\JsonHelper.pas',
  UsuarioMapper in '..\mappers\UsuarioMapper.pas',
  UsuarioController in '..\controllers\UsuarioController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
