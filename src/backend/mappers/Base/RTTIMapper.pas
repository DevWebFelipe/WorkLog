unit RTTIMapper;

interface

uses
  System.Rtti, Data.DB, System.SysUtils;

type
  TRTTIMapper = class
  public
    class procedure DataSetToObject<T: class, constructor>(mDataSet: TDataSet; mObjeto: T);
  end;

function FieldNameToProperty(const mField: string): string;

implementation

{ TRTTIMapper }

class procedure TRTTIMapper.DataSetToObject<T>(mDataSet: TDataSet; mObjeto: T);
var
  mContext: TRttiContext;
  mTipo: TRttiType;
  mProp: TRttiProperty;
  mField: TField;
begin
  mContext := TRttiContext.Create;
  mTipo := mContext.GetType(mObjeto.ClassType);

  for mProp in mTipo.GetProperties do
    begin
      if (not mProp.IsWritable) then
        Continue;

      for var mI := 0 to Pred(mDataSet.Fields.Count) do
        begin
          mField := mDataSet.Fields[mI];

          if SameText(FieldNameToProperty(mField.FieldName), mProp.Name) then
            begin
              case mField.DataType of
                ftInteger, ftSmallint:
                  mProp.SetValue(Pointer(mObjeto), TValue.From(mField.AsInteger));

                ftLargeint:
                  mProp.SetValue(Pointer(mObjeto), TValue.From(mField.AsLargeInt));

                ftString, ftWideString:
                  mProp.SetValue(Pointer(mObjeto), TValue.From(mField.AsString));

                ftBoolean:
                  mProp.SetValue(Pointer(mObjeto), TValue.From(mField.AsBoolean));

                ftDate, ftDateTime, ftTimeStamp:
                  mProp.SetValue(Pointer(mObjeto), TValue.From(mField.AsDateTime));

                ftFloat, ftCurrency:
                  mProp.SetValue(Pointer(mObjeto), TValue.From(mField.AsFloat));
              end;

              Break;
            end;
        end;
    end;
end;

function FieldNameToProperty(const mField: string): string;
begin
  // data_criacao -> DataCriacao
  Result := '';
  var mUpper := True;

  for var mChar in mField do
    begin
      if (mChar = '_') then
        begin
          mUpper := True;
          Continue;
        end;

      if mUpper then
        begin
          Result := Result + UpperCase(mChar);
          mUpper := False;
        end
      else
        Result := Result + LowerCase(mChar);
    end;
end;

end.
