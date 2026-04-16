unit uFrmUtil;

interface

uses
  uDMImagem,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Mask;

type
  TFrmUtil = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure LimparTela(mComponente: TWinControl);
    procedure FocarPrimeiroCampo(mComponente: TWinControl);
    procedure SetControlColor(mComponente: TObject; mCor: TColor);
    procedure CampoEnter(Sender: TObject);
    procedure CampoExit(Sender: TObject);
    procedure ConfigurarEventos(mComponente: TWinControl);

  protected
    procedure ReposicionarComponentes; virtual;
  end;

var
  FrmUtil: TFrmUtil;

implementation

{$R *.dfm}

procedure TFrmUtil.CampoEnter(Sender: TObject);
begin
  SetControlColor(Sender, clAqua);
end;

procedure TFrmUtil.CampoExit(Sender: TObject);
begin
  SetControlColor(Sender, clWindow);
end;

procedure TFrmUtil.SetControlColor(mComponente: TObject; mCor: TColor);
begin
  if (mComponente is TEdit) then
    TEdit(mComponente).Color := mCor

  else if (mComponente is TMemo) then
    TMemo(mComponente).Color := mCor

  else if (mComponente is TComboBox) then
    TComboBox(mComponente).Color := mCor

  else if (mComponente is TMaskEdit) then
    TMaskEdit(mComponente).Color := mCor;
end;

procedure TFrmUtil.FocarPrimeiroCampo(mComponente: TWinControl);
begin
  for var mI := 0 to Pred(mComponente.ControlCount) do
    begin
      if (mComponente.Controls[mI] is TWinControl) and TWinControl(mComponente.Controls[mI]).CanFocus then
        begin
          TWinControl(mComponente.Controls[mI]).SetFocus;
          Break;
        end;
    end;
end;

procedure TFrmUtil.ConfigurarEventos(mComponente: TWinControl);
begin
  for var mI := 0 to Pred(mComponente.ControlCount) do
    begin
      var mControle := mComponente.Controls[mI];

      if (mControle is TEdit) then
        begin
          TEdit(mControle).OnEnter := CampoEnter;
          TEdit(mControle).OnExit  := CampoExit;
        end

      else if (mControle is TMaskEdit) then
        begin
          TMaskEdit(mControle).OnEnter := CampoEnter;
          TMaskEdit(mControle).OnExit  := CampoExit;
        end

      else if (mControle is TMemo) then
        begin
          TMemo(mControle).OnEnter := CampoEnter;
          TMemo(mControle).OnExit  := CampoExit;
        end

      else if (mControle is TComboBox) then
        begin
          TComboBox(mControle).OnEnter := CampoEnter;
          TComboBox(mControle).OnExit  := CampoExit;
        end;

      // recursivo
      if (mControle is TWinControl) then
        ConfigurarEventos(TWinControl(mControle));
    end;
end;

procedure TFrmUtil.FormCreate(Sender: TObject);
begin
  ConfigurarEventos(Self);
end;

procedure TFrmUtil.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close;
end;

procedure TFrmUtil.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
      Key := #0;
      SelectNext(Screen.ActiveControl, True, True);
    end;
end;

procedure TFrmUtil.FormResize(Sender: TObject);
begin
  ReposicionarComponentes;
end;

procedure TFrmUtil.FormShow(Sender: TObject);
begin
  ReposicionarComponentes;
end;

procedure TFrmUtil.LimparTela(mComponente: TWinControl);
begin
  for var mI := 0 to Pred(mComponente.ControlCount) do
    begin
      if mComponente.Controls[mI] is TEdit then
        TEdit(mComponente.Controls[mI]).Clear

      else if mComponente.Controls[mI] is TMemo then
        TMemo(mComponente.Controls[mI]).Clear

      else if mComponente.Controls[mI] is TComboBox then
        TComboBox(mComponente.Controls[mI]).ItemIndex := 0

      else if mComponente.Controls[mI] is TCheckBox then
        TCheckBox(mComponente.Controls[mI]).Checked := False

      else if mComponente.Controls[mI] is TWinControl then
        LimparTela(TWinControl(mComponente.Controls[mI]));
    end;
end;

procedure TFrmUtil.ReposicionarComponentes;
begin

end;

end.
