unit RTTI.Length;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Rtti,
  RTTI.Components;

type
  Length = class(TCustomAttribute)
    private
      FMinLength: Integer;
      FMaxLength: Integer;
      FMsg: string;
      function GetMsg: string;
    public
      constructor Create(const AMinLength, AMaxLength: Integer; const AMsg: string = '');
      procedure Validar(const ARttiField: TRttiField; const AOBject: TObject);
  end;

implementation

const
  MSG_PADRAO     = 'Campo deve ter entre <min> e <max> caracteres!';
  MSG_PADRAO_MIN = 'Campo deve ter ao menos <min> caracteres!';
  MSG_PADRAO_MAX = 'Campo deve ter ao máximo <max> caracteres!';

constructor Length.Create(
  const AMinLength,
        AMaxLength: Integer;
  const AMsg: string = '');
begin
  FMinLength := AMinLength;
  FMaxLength := AMaxLength;

  if (not AMsg.Trim.IsEmpty) then
    FMsg := AMsg.Trim
  else if (FMinLength > 0) and (FMaxLength > 0) then
    FMsg := MSG_PADRAO
  else if (FMinLength > 0) then
    FMsg := MSG_PADRAO_MIN
  else if (FMaxLength > 0) then
    FMsg := MSG_PADRAO_MAX;
end;

function Length.GetMsg: string;
begin
  Result := FMsg
    .Replace('<min>', FMinLength.ToString, [rfReplaceAll, rfIgnoreCase])
    .Replace('<max>', FMaxLength.ToString, [rfReplaceAll, rfIgnoreCase]);
end;

procedure Length.Validar(const ARttiField: TRttiField; const AOBject: TObject);
var
  LComponent : TComponent;
  LTexto     : string;
  LLength    : Integer;
begin
  LComponent := (ARttiField.GetValue(AOBject).AsObject as TComponent);
  LTexto     := TRTTIComponents.GetTextFromComponent(LComponent);
  LLength    := LTexto.Length;

  if (LLength < FMinLength) or ((FMaxLength > 0) and (LLength > FMaxLength)) then
    raise Exception.Create(Self.GetMsg);
end;

end.
