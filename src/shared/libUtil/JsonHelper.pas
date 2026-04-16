unit JsonHelper;

interface

uses
  System.JSON, System.SysUtils, REST.Json;

type
  TJsonHelper = class
  public
    class function ObjectToJson<T: class>(pObject: T): string;
    class function JsonToObject<T: class, constructor>(pJson: string): T;
  end;

implementation

{ TJsonHelper }

class function TJsonHelper.ObjectToJson<T>(pObject: T): string;
begin
  Result := TJson.ObjectToJsonString(pObject);
end;

class function TJsonHelper.JsonToObject<T>(pJson: string): T;
begin
  Result := TJson.JsonToObject<T>(pJson);
end;

end.
