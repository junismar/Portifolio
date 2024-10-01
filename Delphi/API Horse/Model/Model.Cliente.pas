unit Model.Cliente;

interface

uses FireDAC.Comp.Client,
     Data.DB,
     System.SysUtils,
     FireDAC.Stan.Param,
     Model.Connection;

type
  TCliente = class
    private
      FID_CLIENTE : Integer;
      FNOME : string;
      FEMAIL : string;
      FFONE : string;
    public
      constructor Create;
      destructor Destroy; override;

      property ID_CLIENTE : Integer read FID_CLIENTE write FID_CLIENTE;
      property NOME       : string  read FNOME       write FNOME;
      property EMAIL      : string  read FEMAIL      write FEMAIL;
      property FONE       : string  read FFONE       write FFONE;

      function ListarCliente(pOrder_by: string; out pErro: string): TFDQuery;
      function Inserir(out pErro: string): Boolean;
      function Excluir(out pErro: string): Boolean;
      function Editar(out pErro: string): Boolean;
end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  Model.Connection.Connect;
end;

destructor TCliente.Destroy;
begin
  Model.Connection.Disconect;
end;

function TCliente.Excluir(out pErro: string): Boolean;
var
  vQry : TFDQuery;
begin
  try
    vQry := TFDQuery.Create(nil);
    vQry.Connection := Model.Connection.FConnection;

    vQry.Active := False;
    vQry.SQL.Clear;
    vQry.SQL.Add('DELETE FROM TAB_CLIENTE WHERE ID_CLIENTE=:ID_CLIENTE');
    vQry.ParamByName('ID_CLIENTE').Value := ID_CLIENTE;
    vQry.ExecSQL;

    vQry.Free;
    pErro  := '';
    Result := True;
  except
    on ex:exception do
    begin
      pErro := 'Erro ao excluir cliente: ' + ex.Message;
      Result := False;
    end;
  end;
end;

function TCliente.Editar(out pErro: string): Boolean;
var
  vQry : TFDQuery;
begin
  if ID_CLIENTE <= 0 then
  begin
    Result := false;
    pErro := 'Informe o id. cliente';
    Exit;
  end;

  try
    vQry := TFDQuery.Create(nil);
    vQry.Connection := Model.Connection.FConnection;

    vQry.Active := False;
    vQry.SQL.Clear;
    vQry.SQL.Add('UPDATE TAB_CLIENTE SET NOME=:NOME, EMAIL=:EMAIL, FONE=:FONE');
    vQry.SQL.Add('WHERE ID_CLIENTE=:ID_CLIENTE');
    vQry.ParamByName('NOME').Value       := NOME;
    vQry.ParamByName('EMAIL').Value      := EMAIL;
    vQry.ParamByName('FONE').Value       := FONE;
    vQry.ParamByName('ID_CLIENTE').Value := ID_CLIENTE;
    vQry.ExecSQL;

    vQry.Free;
    pErro  := '';
    Result := True;
  except on ex:exception do
      begin
        pErro := 'Erro ao alterar cliente: ' + ex.Message;
        Result := false;
      end;
  end;
end;

function TCliente.Inserir(out pErro: string): Boolean;
var
  vQry : TFDQuery;
begin
  if NOME.IsEmpty then
  begin
    Result := False;
    pErro := 'Informe o nome do cliente';
    Exit;
  end;

  try
    vQry := TFDQuery.Create(nil);
    vQry.Connection := Model.Connection.FConnection;

    vQry.Active := False;
    vQry.SQL.Clear;
    vQry.SQL.Add('INSERT INTO TAB_CLIENTE(NOME, EMAIL, FONE)');
    vQry.SQL.Add('VALUES(:NOME, :EMAIL, :FONE)');

    vQry.ParamByName('NOME').Value  := NOME;
    vQry.ParamByName('EMAIL').Value := EMAIL;
    vQry.ParamByName('FONE').Value  := FONE;

    vQry.ExecSQL;

    vQry.Params.Clear;
    vQry.SQL.Clear;
    vQry.SQL.Add('SELECT MAX(ID_CLIENTE) AS ID_CLIENTE FROM TAB_CLIENTE');
    vQry.SQL.Add('WHERE EMAIL=:EMAIL');
    vQry.ParamByName('EMAIL').Value := EMAIL;
    vQry.Active := True;

    ID_CLIENTE := vQry.FieldByName('ID_CLIENTE').AsInteger;

    vQry.Free;
    pErro  := '';
    Result := True;
  except
    on ex:exception do
    begin
      pErro := 'Erro ao cadastrar cliente: ' + ex.Message;
      Result := False;
    end;
  end;
end;

function TCliente.ListarCliente(pOrder_by: string;
                                out pErro: string): TFDQuery;
var
  vQry : TFDQuery;
begin
  try
    vQry := TFDQuery.Create(nil);
    vQry.Connection := Model.Connection.FConnection;

    vQry.Active := False;
    vQry.SQL.Clear;
    vQry.SQL.Add('SELECT * FROM TAB_CLIENTE WHERE 1 = 1');

    if ID_CLIENTE > 0 then
    begin
      vQry.SQL.Add('AND ID_CLIENTE = :ID_CLIENTE');
      vQry.ParamByName('ID_CLIENTE').Value := ID_CLIENTE;
    end;

    if pOrder_by = '' then
        vQry.SQL.Add('ORDER BY NOME')
    else
        vQry.SQL.Add('ORDER BY ' + pOrder_by);

    vQry.Active := True;

    pErro  := '';
    Result := vQry;
  except
    on ex:exception do
    begin
      pErro := 'Erro ao consultar clientes: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

end.
