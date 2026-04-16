unit UsuarioMapper;

interface

uses
  UsuarioVO, UsuarioDTO;

type
  TUsuarioMapper = class
  public
    class function VOToDTO(pVO: TUsuarioVO): TUsuarioDTO;
    class function DTOToVO(pDTO: TUsuarioDTO): TUsuarioVO;
  end;

implementation

{ TUsuarioMapper }

class function TUsuarioMapper.VOToDTO(pVO: TUsuarioVO): TUsuarioDTO;
begin
  Result := TUsuarioDTO.Create;
  Result.Id    := pVO.Id;
  Result.Nome  := pVO.Nome;
  Result.Login := pVO.Login;
  Result.Ativo := pVO.Ativo;
end;

class function TUsuarioMapper.DTOToVO(pDTO: TUsuarioDTO): TUsuarioVO;
begin
  Result := TUsuarioVO.Create;
  Result.Id    := pDTO.Id;
  Result.Nome  := pDTO.Nome;
  Result.Login := pDTO.Login;
  Result.Senha := pDTO.Senha;
  Result.Ativo := pDTO.Ativo;
end;

end.
