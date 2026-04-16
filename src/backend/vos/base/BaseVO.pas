unit BaseVO;

interface

type
  TBaseVO = class
  private
    FId: Int64;
  public
    procedure Clear; virtual;

    property Id: Int64 read FId write FId;
  end;

implementation

{ TBaseVO }

procedure TBaseVO.Clear;
begin
  FId := 0;
end;

end.
