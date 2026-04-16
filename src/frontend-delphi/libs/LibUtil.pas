unit LibUtil;

interface

uses
  Vcl.Dialogs, Vcl.Forms, System.SysUtils;

function GetPosicaoCentral(ContainerSize, ContentSize: Integer): Integer;

// Dialogs
function Confirma(const mPergunta: String): Boolean;
procedure Alerta(const mAlerta: String);
procedure Erro(const mErro: String);
procedure Informa(const mInformacao: String);

implementation

uses
  System.UITypes;

// =========================
// Layout
// =========================
function GetPosicaoCentral(ContainerSize, ContentSize: Integer): Integer;
begin
  Result := ((ContainerSize - ContentSize) div 2);

  if (Result < 0) then
    Result := 0;
end;

// =========================
// Dialogs
// =========================
function Confirma(const mPergunta: String): Boolean;
begin
  Result := (MessageDlg(mPergunta, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
end;

procedure Alerta(const mAlerta: String);
begin
  MessageDlg(mAlerta, mtWarning, [mbOK], 0);
end;

procedure Erro(const mErro: String);
begin
  MessageDlg(mErro, mtError, [mbOK], 0);
end;

procedure Informa(const mInformacao: String);
begin
  MessageDlg(mInformacao, mtInformation, [mbOK], 0);
end;

end.
