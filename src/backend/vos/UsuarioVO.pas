unit UsuarioVO;

interface

uses
  BaseVO,
  System.Generics.Collections;

type
  TUsuarioVO = class(TBaseVO)
  private
    FId: Int64;
    FNome: String;
    FLogin: String;
    FSenha: String;
    FAtivo: Boolean;
    FDataCriacao: TDateTime;
    FDataAtualizacao: TDateTime;
  public
    procedure Clear; override;

    property Id : Int64 read FId write FId;
    property Nome : String read FNome write FNome;
    property Login : String read FLogin write FLogin;
    property Senha : String read FSenha write FSenha;
    property Ativo : Boolean read FAtivo write FAtivo;
    property DataCriacao : TDateTime read FDataCriacao write FDataCriacao;
    property DataAtualizacao : TDateTime read FDataAtualizacao write FDataAtualizacao;
  end;

  TListaUsuarioVO = TObjectList<TUsuarioVO>;

implementation

{ TUsuarioVO }

procedure TUsuarioVO.Clear;
begin
  inherited;

  FId    := 0;
  FNome  := '';
  FLogin := '';
  FSenha := '';
  FAtivo := False;
  FDataCriacao     := 0;
  FDataAtualizacao := 0;
end;

end.
