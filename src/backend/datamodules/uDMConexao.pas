unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.DatS, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.DApt, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Stan.Param;

type
  TDMConexao = class(TDataModule)
    conConnection: TFDConnection;
  private
    fConnection: TFDConnection;
    procedure ConfigurarConexao;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetConnection: TFDConnection;
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMConexao }

procedure TDMConexao.ConfigurarConexao;
begin
  fConnection.Close;

  fConnection.Params.Clear;
  fConnection.Params.Add('DriverID=PG');
  fConnection.Params.Add('Database=WORKLOG_DB');
  fConnection.Params.Add('User_Name=postgres');
  fConnection.Params.Add('Password=postgres');
  fConnection.Params.Add('Server=localhost');
  fConnection.Params.Add('Port=5432');

  fConnection.LoginPrompt := False;
  fConnection.Connected   := True;
end;

constructor TDMConexao.Create(AOwner: TComponent);
begin
  inherited;

  fConnection := TFDConnection.Create(nil);
  ConfigurarConexao;
end;

destructor TDMConexao.Destroy;
begin
  fConnection.Free;

  inherited;
end;

function TDMConexao.GetConnection: TFDConnection;
begin
  Result := fConnection;
end;

end.
