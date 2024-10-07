unit RTTI.MinMaxValue;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Rtti,
  RTTI.Components;

type
  MinMaxValue = class(TCustomAttribute)
    private
      FMinValue: Integer;
      FMaxValue: Integer;
      FMsg: string;
      function GetMsg: string;
    public
      constructor Create(const AMinValue, AMaxValue: Integer; const AMsg: string = '' );
      procedure Validar(const ARttiField: TRttiField; const AOBject: TObject);
  end;

implementation

const
  MSG_PADRAO     = 'Campo deve ter entre <min> e <max> caracteres!';
  MSG_PADRAO_MIN = 'Campo deve ter ao menos <min> caracteres!';
  MSG_PADRAO_MAX = 'Campo deve ter ao máximo <max> caracteres!';

constructor MinMaxValue.Create(
  const AMinValue,
        AMaxValue: Integer;
  const AMsg: string = '');
begin
  FMinValue := AMinValue;
  FMaxValue := AMaxValue;

  if (not AMsg.Trim.IsEmpty) then
    FMsg := AMsg.Trim
  else if (FMinValue > 0) and (FMaxValue > 0) then
    FMsg := MSG_PADRAO
  else if (FMinValue > 0) then
    FMsg := MSG_PADRAO_MIN
  else if (FMaxValue > 0) then
    FMsg := MSG_PADRAO_MAX;
end;

function MinMaxValue.GetMsg: string;
begin
  Result := FMsg
    .Replace('<min>', FMinValue.ToString, [rfReplaceAll, rfIgnoreCase])
    .Replace('<max>', FMaxValue.ToString, [rfReplaceAll, rfIgnoreCase]);
end;

procedure MinMaxValue.Validar(
  const ARttiField: TRttiField;
  const AOBject: TObject);
var
  LComponent : TComponent;
  LTexto     : string;
  LValue     : Double;
begin
  LComponent := (ARttiField.GetValue(AOBject).AsObject as TComponent);
  LTexto     := TRTTIComponents.GetTextFromComponent(LComponent);
  LValue     := StrToFloatDef(LTexto, 0);

  if (LValue < FMinValue) or ((FMaxValue > 0) and (LValue > FMaxValue)) then
    raise Exception.Create(Self.GetMsg);
end;

end.
