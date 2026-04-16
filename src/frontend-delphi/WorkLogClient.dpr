program WorkLogClient;

uses
  Vcl.Forms,
  uFrmUtil in 'forms\Base\uFrmUtil.pas' {FrmUtil},
  uDMImagem in 'models\uDMImagem.pas' {DMImagem: TDataModule},
  uFrmBaseCadastro in 'forms\Base\uFrmBaseCadastro.pas' {FrmBaseCadastro},
  uFrmBaseConsulta in 'forms\Base\uFrmBaseConsulta.pas' {FrmBaseConsulta},
  uFrmPrin in 'forms\uFrmPrin.pas' {FrmPrin},
  uFrmCadastroUsuario in 'forms\Usuario\uFrmCadastroUsuario.pas' {FrmCadastroUsuario},
  uFrmConsultaUsuario in 'forms\Usuario\uFrmConsultaUsuario.pas' {FrmConsultaUsuario},
  LibConst in 'libs\LibConst.pas',
  LibUtil in 'libs\LibUtil.pas',
  LibForm in 'libs\LibForm.pas',
  LibEnum in 'libs\LibEnum.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrin, FrmPrin);
  Application.CreateForm(TDMImagem, DMImagem);
  Application.Run;
end.
