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
  UsuarioDTO in '..\..\shared\dtos\UsuarioDTO.pas',
  JsonHelper in '..\..\shared\libUtil\JsonHelper.pas',
  UsuarioMapper in '..\mappers\UsuarioMapper.pas',
  UsuarioController in '..\controllers\UsuarioController.pas',
  BaseController in '..\controllers\base\BaseController.pas',
  BaseService in '..\services\base\BaseService.pas',
  UsuarioService in '..\services\UsuarioService.pas',
  IBaseDAO in '..\daos\base\IBaseDAO.pas',
  IBaseService in '..\services\base\IBaseService.pas',
  RouteRegistry in '..\routes\RouteRegistry.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
