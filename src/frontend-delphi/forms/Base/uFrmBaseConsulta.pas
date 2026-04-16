unit uFrmBaseConsulta;

interface

uses
  uDMImagem,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmUtil, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TFrmBaseConsulta = class(TFrmUtil)
    pnlFundo: TPanel;
    pnlFiltro: TPanel;
    pnlBotoes: TPanel;
    pnlGrid: TPanel;
    grdConsulta: TDBGrid;
    tlbBotoes: TToolBar;
    btnAlterar: TToolButton;
    btnNovo: TToolButton;
    btnExcluir: TToolButton;
    btnRelatorio: TToolButton;
    btnSair: TToolButton;
    edtFiltro: TEdit;
    lbl1: TLabel;
    chkAtivo: TCheckBox;
    btnConsultar: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    procedure ReposicionarComponentes; override;

  protected
    procedure ExcluirRegistro; virtual;
  end;

var
  FrmBaseConsulta: TFrmBaseConsulta;

implementation

uses
  LibUtil, LibConst;

{$R *.dfm}

procedure TFrmBaseConsulta.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if Confirma(cgMsgConfirmaExclusao) then
    ExcluirRegistro;
end;

procedure TFrmBaseConsulta.btnSairClick(Sender: TObject);
begin
  inherited;

  Close;
end;

procedure TFrmBaseConsulta.ExcluirRegistro;
begin

end;

procedure TFrmBaseConsulta.ReposicionarComponentes;
begin
  tlbBotoes.Left := GetPosicaoCentral(Width, tlbBotoes.Width);
end;

end.
