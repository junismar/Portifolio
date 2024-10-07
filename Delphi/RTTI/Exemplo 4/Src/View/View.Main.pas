unit View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.Rtti,
  RTTI.NotEmpty,
  RTTI.Length,
  RTTI.MinMaxValue,
  Vcl.ComCtrls;

type
  TViewMain = class(TForm)

    [NotEmpty]
    [Length(2, 50)]

    [NotEmpty]
    [MinMaxValue(1000, 2000)]

    [NotEmpty('O Campo sexo é de preenchimento obrigatório')]
    pnBotoes: TPanel;
    btnPegarFields: TButton;
    btnPegarMetodos: TButton;
    btnPegarPropertys: TButton;
    btnValidarCampos: TButton;
    pgcCadastro: TPageControl;
    TabSheet1: TTabSheet;
    lblCodigo: TLabel;
    Label1: TLabel;
    lblLimite: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtLimite: TEdit;
    cbTipo: TComboBox;
    cbAtivo: TCheckBox;
    rgSexo: TRadioGroup;
    lblTipo: TLabel;
    pgcLog: TPageControl;
    TabSheet2: TTabSheet;
    pnMemo: TPanel;
    btnLimparMemos: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    mmLeft: TMemo;
    mmClient: TMemo;
    mmRight: TMemo;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    procedure btnPegarFieldsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPegarMetodosClick(Sender: TObject);
    procedure btnPegarPropertysClick(Sender: TObject);
    procedure btnValidarCamposClick(Sender: TObject);
    procedure btnLimparMemosClick(Sender: TObject);
  private
    FNome: string;
    FIdade: Integer;
    procedure LimparMemos;
  public
    property Nome: string read FNome write FNome;
    property Idade: Integer read FIdade write FIdade;
  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}


procedure TViewMain.btnLimparMemosClick(Sender: TObject);
begin
  Self.LimparMemos;
end;

procedure TViewMain.btnPegarFieldsClick(Sender: TObject);
var
  LRttiContext : TRttiContext;
  LRttiType    : TRttiType;
  LRttiField   : TRttiField;
  LComponent   : TComponent;
begin
  Self.LimparMemos;
  LRttiContext := TRttiContext.Create;
  try
    LRttiType  := LRttiContext.GetType(TViewMain);

    for LRttiField in LRttiType.GetFields do
    begin
      mmLeft.lines.Add(LRttiField.Name + ' - ' + LRttiField.Parent.ToString);

      if (LRttiField.Parent <> LRttiType) then
        Continue;

      mmClient.Lines.Add(LRttiField.Name + ' - ' + LRttiField.FieldType.ToString);

      LComponent := Self.FindComponent(LRttiField.Name);

      if (LComponent is TEdit) then
        mmRight.Lines.Add(LRttiField.Name + ': ' + TEdit(LComponent).Text);

      if (LComponent is TComboBox) then
        mmRight.Lines.Add(LRttiField.Name + ': ' +
          TComboBox(LComponent).ItemIndex.ToString + ' - ' +
          TComboBox(LComponent).Text);

      if (LComponent is TCheckBox) then
        mmRight.Lines.Add(LRttiField.Name + ': ' + BoolToStr(TCheckBox(LComponent).Checked, True));

      if (LComponent is TRadioGroup) then
        mmRight.Lines.Add(LRttiField.Name + ': ' +
          TRadioGroup(LComponent).ItemIndex.ToString + ' - ' +
          TRadioGroup(LComponent).Items[TRadioGroup(LComponent).ItemIndex]);
    end;
  finally
    LRttiContext.Free;
  end;
end;

procedure TViewMain.btnPegarMetodosClick(Sender: TObject);
var
  LRttiContext : TRttiContext;
  LRttiType    : TRttiType;
  LRttiMethod  : TRttiMethod;
begin
  Self.LimparMemos;
  LRttiContext := TRttiContext.Create;
  try
    LRttiType  := LRttiContext.GetType(TViewMain);

    for LRttiMethod in LRttiType.GetMethods do
    begin
      mmLeft.lines.Add(LRttiMethod.Name + ' - ' + LRttiMethod.Parent.ToString);

      if (LRttiMethod.Parent <> LRttiType) then
        Continue;

      mmClient.Lines.Add(LRttiMethod.Name);
    end;
  finally
    LRttiContext.Free;
  end;
end;

procedure TViewMain.btnPegarPropertysClick(Sender: TObject);
var
  LRttiContext  : TRttiContext;
  LRttiType     : TRttiType;
  LRttiProperty : TRttiProperty;
begin
  Self.LimparMemos;
  LRttiContext := TRttiContext.Create;
  try
    LRttiType  := LRttiContext.GetType(TViewMain);

    for LRttiProperty in LRttiType.GetProperties do
    begin
      mmLeft.lines.Add(LRttiProperty.Name + ' - ' + LRttiProperty.Parent.ToString);

      if (LRttiProperty.Parent <> LRttiType) then
        Continue;

      mmClient.Lines.Add(LRttiProperty.Name);
    end;
  finally
    LRttiContext.Free;
  end;
end;

procedure TViewMain.btnValidarCamposClick(Sender: TObject);
var
  LRttiContext     : TRttiContext;
  LRttiType        : TRttiType;
  LRttiField       : TRttiField;
  LCustomAttribute : TCustomAttribute;
begin
  Self.LimparMemos;
  LRttiContext := TRttiContext.Create;
  try
    LRttiType  := LRttiContext.GetType(TViewMain);

    for LRttiField in LRttiType.GetFields do
    begin
      for LCustomAttribute in LRttiField.GetAttributes do
      begin
        if (LCustomAttribute is NotEmpty) then
          NotEmpty(LCustomAttribute).Validar(LRttiField, Self);

        if (LCustomAttribute is Length) then
          Length(LCustomAttribute).Validar(LRttiField, Self);

        if (LCustomAttribute is MinMaxValue) then
          MinMaxValue(LCustomAttribute).Validar(LRttiField, Self);
      end;
    end;
    ShowMessage('Validado com sucesso!');
  finally
    LRttiContext.Free;
  end;
end;

procedure TViewMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TViewMain.LimparMemos;
begin
  mmLeft.Lines.Clear;
  mmClient.Lines.Clear;
  mmRight.Lines.Clear;
end;

end.
