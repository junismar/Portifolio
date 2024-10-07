program RTTI;

uses
  Vcl.Forms,
  View.Main in 'Src\View\View.Main.pas' {ViewMain},
  RTTI.NotEmpty in 'Src\RTTI\RTTI.NotEmpty.pas',
  RTTI.Length in 'Src\RTTI\RTTI.Length.pas',
  RTTI.MinMaxValue in 'Src\RTTI\RTTI.MinMaxValue.pas',
  RTTI.Components in 'Src\RTTI\RTTI.Components.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
