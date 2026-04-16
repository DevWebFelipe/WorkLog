unit LibUtil;

interface

uses
  System.SysUtils, System.Generics.Collections, Vcl.Forms, System.Classes, Vcl.Dialogs;

type
  Form = class
    class function Get(mClasseForm: TComponentClass; mPodeFormShowModal: Boolean = False): TForm;
    class function Show(mClasseForm: TComponentClass): TForm; overload;
    class function ShowModal(mClasseForm: TComponentClass): TForm; overload;
  end;

function GetPosicaoCentral(mTamanhoBase, mTamanhoCalcular: Integer): Integer;

function Confirma(const mPergunta: String): Boolean;
procedure Alerta(const mAlerta: String);
procedure Erro(const mErro: String);
procedure Informa(const mInformacao: String);

implementation

uses
  Winapi.Windows, Vcl.Controls, LibConst;

function GetPosicaoCentral(mTamanhoBase, mTamanhoCalcular: Integer): Integer;
begin
  Result := ((mTamanhoBase - mTamanhoCalcular) div 2);

  if (Result < 0) then
    Result := 0;
end;

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
  MessageDlg('Erro:' + cgEnterEmString + mErro, mtError, [mbOK], 0);
end;

procedure Informa(const mInformacao: String);
begin
  MessageDlg(mInformacao, mtInformation, [mbOK], 0);
end;

{ Form }

class function Form.Show(mClasseForm: TComponentClass): TForm;
begin
  Result := Form.Get(mClasseForm, False);

  if Assigned(Result) then
    begin
      if IsIconic(Result.Handle) then
        ShowWindow(Result.Handle, SW_RESTORE);

      Result.Show;
      Result.BringToFront;
      Exit;
    end;

  Application.CreateForm(mClasseForm, Result);
  Result.Show;
  Result.BringToFront;
end;

class function Form.ShowModal(mClasseForm: TComponentClass): TForm;
begin
  Result := Form.Get(mClasseForm);

  if Assigned(Result) then
    begin
      if IsIconic(Result.Handle) then
        ShowWindow(Result.Handle, SW_RESTORE);

      Result.Show;
      Result.BringToFront;
      Exit;
    end;

  Application.CreateForm(mClasseForm, Result);
  Result.ShowModal;
  Result.BringToFront;
end;

class function Form.Get(mClasseForm: TComponentClass; mPodeFormShowModal: Boolean = False): TForm;
begin
  Result := nil;
  for var mI := 0 to (Screen.FormCount - 1) do
    begin
      var mFrm := Screen.Forms[mI];
      if (mFrm is mClasseForm) and
         (mPodeFormShowModal or (not (fsModal in mFrm.FormState))) then
        begin
          Result := mFrm;
          Exit;
        end;
    end;
end;

end.
