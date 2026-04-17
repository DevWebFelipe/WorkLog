unit uFrmMain;

interface

uses
  Horse,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.DateUtils;

type
  TFrmMain = class(TForm)
    pnlFundo: TPanel;
    btnIniciarServer: TButton;
    mmoLog: TMemo;
    procedure btnIniciarServerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.Threading, Server;

{$R *.dfm}

procedure TFrmMain.btnIniciarServerClick(Sender: TObject);
begin
  TTask.Run(
    procedure
    begin
      IniciarServidor;

      TThread.Queue(nil,
        procedure
        begin
          mmoLog.Clear;
          mmoLog.Lines.Add('Servidor iniciado com sucesso!');
          mmoLog.Lines.Add('Rodando em: http://localhost:9000');
          mmoLog.Lines.Add('Testar: http://localhost:9000/ping');
          mmoLog.Lines.Add('--------------------------------------');
        end
      );
    end
  );
end;

end.
