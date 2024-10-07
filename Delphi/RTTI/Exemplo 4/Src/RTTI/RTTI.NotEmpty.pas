unit RTTI.NotEmpty;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Rtti,
  RTTI.Components;

type
  NotEmpty = class(TCustomAttribute)
    private
      FMsg: string;
    public
      constructor Create; overload;
      constructor Create(const AMsg: string); overload;

      procedure Validar(const ARttiField: TRttiField; const AOBject: TObject);
  end;

implementation

const
  MSG_PADRAO = 'Campo obrigatório sem preenchimento!';

constructor NotEmpty.Create;
begin
  FMsg := MSG_PADRAO;
end;

constructor NotEmpty.Create(const AMsg: string);
begin
  FMsg := AMsg;
end;

procedure NotEmpty.Validar(
  const ARttiField: TRttiField;
  const AOBject: TObject);
var
  LComponent : TComponent;
  LText      : string;
begin
  LComponent := (ARttiField.GetValue(AOBject).AsObject as TComponent);
  LText      := TRTTIComponents.GetTextFromComponent(LComponent);

  if (LText.Trim.IsEmpty) then
    raise Exception.Create(FMsg);
end;

end.
