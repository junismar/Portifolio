unit Model.Connection;

interface

uses
  FireDAC.DApt,
  FireDAC.Stan.Option,
  FireDAC.Stan.Intf,
  FireDAC.UI.Intf,
  FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.FMXUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  System.Classes,
  System.IniFiles,
  System.SysUtils;

var
  FConnection : TFDConnection;

function SetupConnection(pConn: TFDConnection): String;
function Connect : TFDConnection;
procedure Disconect;

implementation

function SetupConnection(pConn: TFDConnection): string;
var
  vArq_ini : string;
  vIni : TIniFile;
begin
  vIni := nil;
  try
    try
      vArq_ini := GetCurrentDir + '\ServerHorse.ini';

      if not FileExists(vArq_ini) then
      begin
        Result := 'Arquivo INI não encontrado: ' + vArq_ini;
        Exit;
      end;

      vIni := TIniFile.Create(vArq_ini);


      pConn.Params.Values['DriverID']  := vIni.ReadString('Banco de Dados', 'DriverID', '');
      pConn.Params.Values['Database']  := vIni.ReadString('Banco de Dados', 'Database', '');
      pConn.Params.Values['User_name'] := vIni.ReadString('Banco de Dados', 'User_name', '');
      pConn.Params.Values['Password']  := vIni.ReadString('Banco de Dados', 'Password', '');
      pConn.Params.Add('Port='   + vIni.ReadString('Banco de Dados', 'Port', '3050'));
      pConn.Params.Add('Server=' + vIni.ReadString('Banco de Dados', 'Server', 'localhost'));

      Result := 'OK';
    except
      on ex:exception do
        Result := 'Erro ao configurar banco: ' + ex.Message;
    end;

  finally
    if Assigned(vIni) then
      vIni.DisposeOf;
  end;
end;

function Connect : TFDConnection;
begin
  FConnection := TFDConnection.Create(nil);
  SetupConnection(FConnection);
  FConnection.Connected := True;

  Result := FConnection;
end;

procedure Disconect;
begin
  if Assigned(FConnection) then
  begin
    if FConnection.Connected then
      FConnection.Connected := False;

    FConnection.Free;
  end;

end;

end.
