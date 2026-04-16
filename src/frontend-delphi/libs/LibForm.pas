unit LibForm;

interface

uses
  Vcl.Forms, Winapi.Windows, System.SysUtils;

type
  TLibForm = class
  public
    class function Get(mClasseForm: TFormClass): TForm;

    class function Show(mClasseForm: TFormClass): TForm;
    class function ShowModal(mClasseForm: TFormClass): Integer;
  end;

var
  gMultiTelasMDI: Boolean = False;

implementation

uses
  Vcl.Controls;

{ TLibForm }

class function TLibForm.Get(mClasseForm: TFormClass): TForm;
begin
  Result := nil;

  for var mI := 0 to Pred(Screen.FormCount) do
    begin
      if Screen.Forms[mI] is mClasseForm then
        Exit(Screen.Forms[mI]);
    end;
end;

class function TLibForm.Show(mClasseForm: TFormClass): TForm;
begin
  Result := Get(mClasseForm);

  if Assigned(Result) then
    begin
      if IsIconic(Result.Handle) then
        ShowWindow(Result.Handle, SW_RESTORE);

      Result.Show;
      Result.BringToFront;
      Exit;
    end;

  Result := mClasseForm.Create(Application);

  if gMultiTelasMDI then
    Result.FormStyle := fsMDIChild;

  Result.Show;
  Result.BringToFront;
end;

class function TLibForm.ShowModal(mClasseForm: TFormClass): Integer;
begin
  var mForm := Get(mClasseForm);

  // Se já existir um form aberto desse tipo, NÃO abre outro modal
  if Assigned(mForm) then
    begin
      if IsIconic(mForm.Handle) then
        ShowWindow(mForm.Handle, SW_RESTORE);

      mForm.BringToFront;
      Exit(mrNone);
    end;

  mForm := mClasseForm.Create(Application);
  try
    Result := mForm.ShowModal;
  finally
    FreeAndNil(mForm);
  end;
end;

end.
