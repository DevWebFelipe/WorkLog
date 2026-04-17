unit UsuarioService;

interface

uses
  LibSistema, FireDAC.Comp.Client, BaseService, IBaseDAO;

type
  TUsuarioService = class(TBaseService<TUsuarioVO, TUsuarioDTO>)
  private
    fConexao: TFDConnection;
  public
    constructor Create(mConnection: TFDConnection);

  protected
    function GetDAO: IBaseDAO<TUsuarioVO>; override;
    function VOToDTO(mVO: TUsuarioVO): TUsuarioDTO; override;
    function DTOToVO(mDTO: TUsuarioDTO): TUsuarioVO; override;
  end;

implementation

uses
  UsuarioMapper;

{ TUsuarioService }

constructor TUsuarioService.Create(mConnection: TFDConnection);
begin
  inherited Create(mConnection);

  fConexao := mConnection;
end;

function TUsuarioService.DTOToVO(mDTO: TUsuarioDTO): TUsuarioVO;
begin
  Result := TUsuarioMapper.DTOToVO(mDTO);
end;

function TUsuarioService.GetDAO: IBaseDAO<TUsuarioVO>;
begin
  Result := TUsuarioDAO.Create(fConexao);
end;

function TUsuarioService.VOToDTO(mVO: TUsuarioVO): TUsuarioDTO;
begin
  Result := TUsuarioMapper.VOToDTO(mVO);
end;

end.
