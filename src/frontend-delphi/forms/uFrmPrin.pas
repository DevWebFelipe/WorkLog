unit uFrmPrin;

interface

uses
  uFrmConsultaUsuario,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmUtil, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmPrin = class(TFrmUtil)
    Fundo: TPanel;
    btnUsuario: TButton;
    pnlMenu: TPanel;
    procedure btnUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrin: TFrmPrin;

implementation

uses
  LibUtil, LibConst, LibForm;

{$R *.dfm}

procedure TFrmPrin.btnUsuarioClick(Sender: TObject);
begin
  inherited;

  TLibForm.Show(TFrmConsultaUsuario);
end;

end.
