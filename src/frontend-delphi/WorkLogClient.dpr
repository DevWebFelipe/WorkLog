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
  LibForm in 'libs\LibForm.pas',
  LibUtil in '..\shared\libUtil\LibUtil.pas',
  LibEnum in '..\shared\libEnumerado\LibEnum.pas',
  LibConst in '..\shared\libConst\LibConst.pas',
  JsonHelper in '..\shared\libUtil\JsonHelper.pas',
  UsuarioDTO in '..\shared\dtos\usuario\UsuarioDTO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrin, FrmPrin);
  Application.CreateForm(TDMImagem, DMImagem);
  Application.Run;
end.
