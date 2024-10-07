unit RTTI.Components;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Rtti,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TRTTIComponents = class
    private
    public
      class function GetTextFromComponent(const AComponent: TComponent): string;
  end;

implementation

{ TRTTIComponents }

class function TRTTIComponents.GetTextFromComponent(
  const AComponent: TComponent): string;
begin
  Result := '';
  if (AComponent is TEdit) then
    Result := TEdit(AComponent).Text
  else if (AComponent is TComboBox) then
    Result := TComboBox(AComponent).Text
  else if (AComponent is TRadioGroup) then
    if (TRadioGroup(AComponent).ItemIndex >= 0) then
      Result := TRadioGroup(AComponent).Items[TRadioGroup(AComponent).ItemIndex];
end;

end.
