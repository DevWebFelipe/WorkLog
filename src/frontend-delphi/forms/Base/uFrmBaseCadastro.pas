unit uFrmBaseCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmUtil, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin;

type
  TFrmBaseCadastro = class(TFrmUtil)
    pnlFundo: TPanel;
    pnlBotoes: TPanel;
    pnlDados: TPanel;
    tlbBotoes: TToolBar;
    btnSalvar: TToolButton;
    btnExcluir: TToolButton;
    btnSair: TToolButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure ReposicionarComponentes; override;
    { Private declarations }
  protected
    procedure ExcluirRegistro; virtual;
    { Public declarations }
  end;

var
  FrmBaseCadastro: TFrmBaseCadastro;

implementation

uses
  uDMImagem, LibUtil, LibConst, LibForm;

{$R *.dfm}

{ TFrmBaseCadastro }

procedure TFrmBaseCadastro.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if (not Confirma(cgMsgConfirmaExclusao)) then
    Exit;

  ExcluirRegistro;
  Close;
end;

procedure TFrmBaseCadastro.btnSairClick(Sender: TObject);
begin
  inherited;

  Close;
end;

procedure TFrmBaseCadastro.btnSalvarClick(Sender: TObject);
begin
  inherited;

  Close;
end;

procedure TFrmBaseCadastro.ExcluirRegistro;
begin

end;

procedure TFrmBaseCadastro.ReposicionarComponentes;
begin
  tlbBotoes.Left := GetPosicaoCentral(Width, tlbBotoes.Width);
end;

end.
