unit UsuarioMapper;

interface

uses
  UsuarioVO, UsuarioDTO;

type
  TUsuarioMapper = class
  public
    class function VOToDTO(mVO: TUsuarioVO): TUsuarioDTO;
    class function DTOToVO(mDTO: TUsuarioDTO): TUsuarioVO;
  end;

implementation

{ TUsuarioMapper }

class function TUsuarioMapper.VOToDTO(mVO: TUsuarioVO): TUsuarioDTO;
begin
  Result := TUsuarioDTO.Create;
  Result.Id    := mVO.Id;
  Result.Nome  := mVO.Nome;
  Result.Login := mVO.Login;
  Result.Ativo := mVO.Ativo;
end;

class function TUsuarioMapper.DTOToVO(mDTO: TUsuarioDTO): TUsuarioVO;
begin
  Result := TUsuarioVO.Create;
  Result.Id    := mDTO.Id;
  Result.Nome  := mDTO.Nome;
  Result.Login := mDTO.Login;
  Result.Senha := mDTO.Senha;
  Result.Ativo := mDTO.Ativo;
end;

end.
