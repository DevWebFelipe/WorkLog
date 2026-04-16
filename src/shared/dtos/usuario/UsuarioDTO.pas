unit UsuarioDTO;

interface

uses
  System.SysUtils;

type
  TUsuarioDTO = class
  private
    FId: Int64;
    FNome: string;
    FLogin: string;
    FSenha: string;
    FAtivo: Boolean;
  public
    property Id: Int64 read FId write FId;
    property Nome: string read FNome write FNome;
    property Login: string read FLogin write FLogin;
    property Senha: string read FSenha write FSenha;
    property Ativo: Boolean read FAtivo write FAtivo;
  end;

implementation

end.
