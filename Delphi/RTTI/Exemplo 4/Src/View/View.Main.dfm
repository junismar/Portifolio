object ViewMain: TViewMain
  Left = 0
  Top = 0
  Caption = 'Estudo RTTI'
  ClientHeight = 700
  ClientWidth = 1558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnBotoes: TPanel
    Left = 433
    Top = 0
    Width = 248
    Height = 700
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object btnPegarFields: TButton
      Left = 2
      Top = 23
      Width = 240
      Height = 25
      Caption = 'Fields e Valores (Componentes)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnPegarFieldsClick
    end
    object btnPegarMetodos: TButton
      Left = 2
      Top = 48
      Width = 240
      Height = 25
      Caption = 'M'#233'todos (Procedures e Functions)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnPegarMetodosClick
    end
    object btnPegarPropertys: TButton
      Left = 2
      Top = 73
      Width = 240
      Height = 25
      Caption = 'Propertys'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnPegarPropertysClick
    end
    object btnValidarCampos: TButton
      Left = 2
      Top = 98
      Width = 240
      Height = 25
      Caption = 'Validar Campos com Custom Attributes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnValidarCamposClick
    end
    object btnLimparMemos: TButton
      Left = 2
      Top = 325
      Width = 240
      Height = 25
      Caption = 'Limpar Memos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnLimparMemosClick
    end
  end
  object pgcCadastro: TPageControl
    Left = 0
    Top = 0
    Width = 433
    Height = 700
    ActivePage = TabSheet1
    Align = alLeft
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object lblCodigo: TLabel
        Left = 10
        Top = 32
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label1: TLabel
        Left = 114
        Top = 32
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object lblLimite: TLabel
        Left = 116
        Top = 74
        Width = 43
        Height = 13
        Caption = 'Limite R$'
      end
      object lblTipo: TLabel
        Left = 10
        Top = 74
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object edtCodigo: TEdit
        Left = 10
        Top = 49
        Width = 100
        Height = 21
        TabOrder = 0
        Text = '39'
      end
      object edtNome: TEdit
        Left = 114
        Top = 49
        Width = 300
        Height = 21
        TabOrder = 1
        Text = 'Junismar Alves Miranda'
      end
      object edtLimite: TEdit
        Left = 116
        Top = 91
        Width = 89
        Height = 21
        TabOrder = 2
        Text = '1500,00'
      end
      object cbTipo: TComboBox
        Left = 10
        Top = 91
        Width = 100
        Height = 21
        ItemIndex = 0
        TabOrder = 3
        Text = 'Pessoa F'#237'sica'
        Items.Strings = (
          'Pessoa F'#237'sica'
          'Pessoa Jur'#237'dica')
      end
      object cbAtivo: TCheckBox
        Left = 367
        Top = 31
        Width = 47
        Height = 17
        Caption = 'Ativo'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object rgSexo: TRadioGroup
        Left = 269
        Top = 74
        Width = 145
        Height = 50
        Caption = ' Sexo '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 5
      end
    end
  end
  object pgcLog: TPageControl
    Left = 681
    Top = 0
    Width = 877
    Height = 700
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 2
    object TabSheet2: TTabSheet
      Caption = 'Log'
      object pnMemo: TPanel
        Left = 0
        Top = 0
        Width = 869
        Height = 672
        Align = alClient
        TabOrder = 0
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 320
          Height = 670
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object mmLeft: TMemo
            Left = 0
            Top = 46
            Width = 320
            Height = 624
            Align = alClient
            Lines.Strings = (
              '')
            ScrollBars = ssBoth
            TabOrder = 0
            ExplicitLeft = -105
            ExplicitTop = 1
            ExplicitWidth = 290
            ExplicitHeight = 39
          end
          object StaticText2: TStaticText
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 314
            Height = 40
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = 'Nome dos campos, m'#233'todos ou propriedades e sua origem.'
            Color = 15395562
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            Transparent = False
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 320
          end
        end
        object Panel2: TPanel
          Left = 321
          Top = 1
          Width = 303
          Height = 670
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 344
          ExplicitTop = 361
          ExplicitWidth = 185
          ExplicitHeight = 41
          object mmClient: TMemo
            Left = 0
            Top = 46
            Width = 303
            Height = 624
            Align = alClient
            Lines.Strings = (
              '')
            ScrollBars = ssBoth
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 2
            ExplicitWidth = 183
            ExplicitHeight = 39
          end
          object StaticText3: TStaticText
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 297
            Height = 40
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = 'Detalhes dos campos, m'#233'todos ou propriedades (tipo de dado).'
            Color = 15395562
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            Transparent = False
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 303
          end
        end
        object Panel3: TPanel
          Left = 624
          Top = 1
          Width = 244
          Height = 670
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          object mmRight: TMemo
            Left = 0
            Top = 46
            Width = 244
            Height = 624
            Align = alClient
            Lines.Strings = (
              '')
            ScrollBars = ssBoth
            TabOrder = 0
            ExplicitLeft = 5
            ExplicitTop = 15
            ExplicitWidth = 179
            ExplicitHeight = 654
          end
          object StaticText4: TStaticText
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 238
            Height = 40
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = 'Valores atuais dos componentes visuais da interface.'
            Color = 15395562
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            Transparent = False
            ExplicitLeft = 5
            ExplicitTop = 0
            ExplicitWidth = 244
          end
        end
      end
    end
  end
end
