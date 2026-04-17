unit JsonHelper;

interface

uses
  System.JSON, System.SysUtils, REST.Json;

type
  TJsonHelper = class
  public
    class function ObjectToJson<T: class>(mObjeto: T): string;
    class function JsonToObject<T: class, constructor>(mJson: string): T;
  end;

implementation

{ TJsonHelper }

class function TJsonHelper.ObjectToJson<T>(mObjeto: T): string;
begin
  Result := TJson.ObjectToJsonString(mObjeto);
end;

class function TJsonHelper.JsonToObject<T>(mJson: string): T;
begin
  Result := TJson.JsonToObject<T>(mJson);
end;

end.
