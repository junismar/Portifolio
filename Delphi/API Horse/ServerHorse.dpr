//program ServerHorse;
//
//{$APPTYPE CONSOLE}
//
//{$R *.res}
//
//uses
//  System.SysUtils,
//  Horse,
//  Horse.Jhonson,
//  Model.Connection in 'Model\Model.Connection.pas',
//  Model.Cliente in 'Model\Model.Cliente.pas',
//  Controller.Cliente in 'Controller\Controller.Cliente.pas';
//
//begin
//  THorse.Use(Jhonson());
//
//  Controller.Cliente.Registry;
//
//  THorse.Listen(9000);
//end.
program ServerHorse;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  Model.Connection in 'Model\Model.Connection.pas',
  Model.Cliente in 'Model\Model.Cliente.pas',
  Controller.Cliente in 'Controller\Controller.Cliente.pas';

procedure IniciarServidor;
begin
  try
    // Inicializando middleware e rotas
    THorse.Use(Jhonson());
    Controller.Cliente.Registry;

    Writeln('Iniciando o servidor na porta 9000...');

    // Iniciando o servidor na porta 9000
    THorse.Listen(9000);

    Writeln('Servidor iniciado com sucesso!');
  except
    on E: Exception do
    begin
      Writeln('Erro ao iniciar o servidor: ' + E.Message);
      Halt(1);  // Finaliza o programa em caso de erro cr�tico
    end;
  end;
end;

procedure FinalizarServidor;
begin
  try
    Writeln('Finalizando o servidor...');
    // Voc� pode adicionar l�gica de finaliza��o ou limpeza de recursos aqui
  except
    on E: Exception do
    begin
      Writeln('Erro ao finalizar o servidor: ' + E.Message);
    end;
  end;

  Writeln('Servidor finalizado.');
end;

begin
  try
    // Chama a fun��o de inicializar o servidor
    IniciarServidor;
  except
    on E: Exception do
    begin
      Writeln('Erro inesperado: ' + E.Message);
    end;
  end;

  // Procedimento de finaliza��o ao encerrar o programa
  AddExitProc(@FinalizarServidor);
end.

