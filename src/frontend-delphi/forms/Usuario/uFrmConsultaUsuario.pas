unit uFrmConsultaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmBaseConsulta, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls;

type
  TFrmConsultaUsuario = class(TFrmBaseConsulta)
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaUsuario: TFrmConsultaUsuario;

implementation

uses
  LibUtil, LibForm, uFrmCadastroUsuario;

{$R *.dfm}

procedure TFrmConsultaUsuario.btnNovoClick(Sender: TObject);
begin
  inherited;

  TLibForm.ShowModal(TFrmCadastroUsuario);
end;

end.
