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
    fConexao: TFDConnection;
    procedure ConfigurarConexao;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetConexao: TFDConnection;
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMConexao }

procedure TDMConexao.ConfigurarConexao;
begin
  fConexao.Close;

  fConexao.Params.Clear;
  fConexao.Params.Add('DriverID=PG');
  fConexao.Params.Add('Database=WORKLOG_DB');
  fConexao.Params.Add('User_Name=postgres');
  fConexao.Params.Add('Password=postgres');
  fConexao.Params.Add('Server=localhost');
  fConexao.Params.Add('Port=5432');

  fConexao.LoginPrompt := False;
  fConexao.Connected   := True;
end;

constructor TDMConexao.Create(AOwner: TComponent);
begin
  inherited;

  fConexao := TFDConnection.Create(nil);
  ConfigurarConexao;
end;

destructor TDMConexao.Destroy;
begin
  FreeAndNil(fConexao);

  inherited;
end;

function TDMConexao.GetConexao: TFDConnection;
begin
  Result := fConexao;
end;

end.
