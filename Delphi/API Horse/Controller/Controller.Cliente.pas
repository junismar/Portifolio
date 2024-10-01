unit Controller.Cliente;

interface

uses Horse,
     System.JSON,
     System.SysUtils,
     Model.Cliente,
     FireDAC.Comp.Client,
     Data.DB,
     DataSet.Serialize;

procedure Registry;

implementation

procedure ListarClientes(pReq: THorseRequest; pRes: THorseResponse; pNext: TProc);
var
  vCli : TCliente;
  vQry : TFDQuery;
  vErro : string;
  vArrayClientes : TJSONArray;
begin
  try
    vCli := TCliente.Create;
  except
    pRes.Send('Erro ao conectar com o banco').Status(500);
    Exit;
  end;

  vQry := vCli.ListarCliente('', vErro);
  try
    vArrayClientes := vQry.ToJSONArray();

    pRes.Send<TJSONArray>(vArrayClientes);
  finally
    vQry.Free;
    vCli.Free;
  end;
end;

procedure ListarClienteID(pReq: THorseRequest; pRes: THorseResponse; pNext: TProc);
var
  vCli : TCliente;
  vObjClientes : TJSONObject;
  vQry : TFDQuery;
  vErro : string;
begin
  try
    vCli := TCliente.Create;
    vCli.ID_CLIENTE := pReq.Params['id'].ToInteger;
  except
    pRes.Send('Erro ao conectar com o banco').Status(500);
    Exit;
  end;

  vQry := vCli.ListarCliente('', vErro);
  try

    if vQry.RecordCount > 0 then
    begin
      vObjClientes := vQry.ToJSONObject;
      pRes.Send<TJSONObject>(vObjClientes)
    end
    else
      pRes.Send('Cliente não encontrado').Status(404);
  finally
    vQry.Free;
    vCli.Free;
  end;
end;

procedure AddCliente(pReq: THorseRequest; pRes: THorseResponse; pNext: TProc);
var
  vCli : TCliente;
  vObjCliente : TJSONObject;
  vErro : string;
  vBody : TJsonValue;
begin
  try
    vCli := TCliente.Create;
  except
    pRes.Send('Erro ao conectar com o banco').Status(500);
    Exit;
  end;

  try
    try
      vBody := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(pReq.Body), 0) as TJsonValue;

      vCli.NOME  := vBody.GetValue<string>('nome', '');
      vCli.EMAIL := vBody.GetValue<string>('email', '');
      vCli.FONE  := vBody.GetValue<string>('fone', '');
      vCli.Inserir(vErro);

      vBody.Free;

      if vErro <> '' then
        raise Exception.Create(vErro);
    except
      on ex:exception do
      begin
        pRes.Send(ex.Message).Status(400);
        Exit;
      end;
    end;
            
    vObjCliente := TJSONObject.Create;
    vObjCliente.AddPair('id_cliente', vCli.ID_CLIENTE.ToString);

    pRes.Send<TJSONObject>(vObjCliente).Status(201);
  finally
    vCli.Free;
  end;
end;

procedure DeleteCliente(pReq: THorseRequest; pRes: THorseResponse; pNext: TProc);
var
  vCli : TCliente;
  vObjCliente : TJSONObject;
  vErro : string;
begin
  try
    vCli := TCliente.Create;
  except
    pRes.Send('Erro ao conectar com o banco').Status(500);
    Exit;
  end;

  try
    try
      vCli.ID_CLIENTE := pReq.Params['id'].ToInteger;

      if NOT vCli.Excluir(vErro) then
          raise Exception.Create(vErro);
    except
      on ex:exception do
      begin
        pRes.Send(ex.Message).Status(400);
        Exit;
      end;
    end;

    vObjCliente := TJSONObject.Create;
    vObjCliente.AddPair('id_cliente', vCli.ID_CLIENTE.ToString);

    pRes.Send<TJSONObject>(vObjCliente);
  finally
    vCli.Free;
  end;
end;

procedure EditarCliente(pReq: THorseRequest; pRes: THorseResponse; pNext: TProc);
var
  vCli : TCliente;
  vObjCliente : TJSONObject;
  vErro : string;
  vBody : TJsonValue;
begin
  try
    vCli := TCliente.Create;
  except
    pRes.Send('Erro ao conectar com o banco').Status(500);
    Exit;
  end;

  try
    try
      vBody := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(pReq.Body), 0) as TJsonValue;

      vCli.ID_CLIENTE := vBody.GetValue<integer>('id_cliente', 0);
      vCli.NOME       := vBody.GetValue<string>('nome', '');
      vCli.EMAIL      := vBody.GetValue<string>('email', '');
      vCli.FONE       := vBody.GetValue<string>('fone', '');
      vCli.Editar(vErro);

      vBody.Free;

      if vErro <> '' then
          raise Exception.Create(vErro);
    except 
      on ex:exception do
      begin
        pRes.Send(ex.Message).Status(400);
        Exit;
      end;
    end;
 
    vObjCliente := TJSONObject.Create;
    vObjCliente.AddPair('id_cliente', vCli.ID_CLIENTE.ToString);

    pRes.Send<TJSONObject>(vObjCliente).Status(200);
  finally
    vCli.Free;
  end;
end;

procedure Registry;
begin
    THorse.Get('/cliente', ListarClientes);
    THorse.Get('/cliente/:id', ListarClienteID);
    THorse.Post('/cliente', AddCliente);
    THorse.Put('/cliente', EditarCliente);
    THorse.Delete('/cliente/:id', DeleteCliente);
end;

end.
