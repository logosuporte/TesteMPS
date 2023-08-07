object FormFuncionarios: TFormFuncionarios
  Left = 0
  Top = 0
  Caption = 'Cadastro de Funcionarios'
  ClientHeight = 546
  ClientWidth = 902
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 457
    Top = 41
    Width = 440
    Height = 464
    Align = alLeft
    Caption = 'Panel4'
    TabOrder = 3
    ExplicitLeft = 463
    ExplicitTop = 35
    object Label3: TLabel
      Left = 32
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 32
      Top = 104
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label5: TLabel
      Left = 32
      Top = 152
      Width = 19
      Height = 13
      Caption = 'Cep'
    end
    object Label6: TLabel
      Left = 32
      Top = 200
      Width = 38
      Height = 13
      Caption = 'Linkedin'
    end
    object Label7: TLabel
      Left = 32
      Top = 248
      Width = 32
      Height = 13
      Caption = 'GitHub'
    end
    object Labelid: TLabel
      Left = 32
      Top = 24
      Width = 6
      Height = 13
      Caption = '0'
    end
    object EditNome: TEdit
      Left = 32
      Top = 75
      Width = 361
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object Edittelefone: TEdit
      Left = 32
      Top = 120
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object Editcep: TEdit
      Left = 32
      Top = 168
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object Editlikedin: TEdit
      Left = 32
      Top = 216
      Width = 361
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 3
    end
    object Editgithub: TEdit
      Left = 32
      Top = 272
      Width = 361
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 4
    end
    object Button4: TButton
      Left = 391
      Top = 214
      Width = 42
      Height = 25
      Caption = 'Abrir'
      TabOrder = 5
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 391
      Top = 270
      Width = 42
      Height = 25
      Caption = 'Abrir'
      TabOrder = 6
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 344
      Top = 299
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 7
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 263
      Top = 299
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 8
      OnClick = Button7Click
    end
    object BitBtn1: TBitBtn
      Left = 32
      Top = 299
      Width = 193
      Height = 25
      Caption = 'Add Empresa'
      TabOrder = 9
      OnClick = BitBtn1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 902
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1107
  end
  object Panel2: TPanel
    Left = 360
    Top = 41
    Width = 97
    Height = 464
    Align = alLeft
    TabOrder = 1
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 95
      Height = 25
      Align = alTop
      Caption = 'Search'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 1
      Top = 26
      Width = 95
      Height = 25
      Align = alTop
      Caption = 'Add'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 1
      Top = 51
      Width = 95
      Height = 25
      Align = alTop
      Caption = 'Deletar'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 505
    Width = 902
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 511
  end
  object Panelsearch: TPanel
    Left = 0
    Top = 41
    Width = 360
    Height = 464
    Align = alLeft
    TabOrder = 4
    object Label1: TLabel
      Left = 6
      Top = 24
      Width = 138
      Height = 13
      Caption = 'Digite o nome do Funcionario'
    end
    object Label2: TLabel
      Left = 168
      Top = 258
      Width = 159
      Height = 13
      Caption = 'Duplo Clique apra selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid2: TDBGrid
      Left = 6
      Top = 80
      Width = 323
      Height = 177
      DataSource = DsFuncionario
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid2DblClick
    end
    object EditSearch: TEdit
      Left = 6
      Top = 43
      Width = 321
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnKeyPress = EditSearchKeyPress
    end
  end
  object funcionario: TClientDataSet
    PersistDataPacket.Data = {
      BB0000009619E0BD010000001800000007000000000003000000BB0002696404
      00010000000000046E6F6D650100490000000100055749445448020002003200
      0874656C65666F6E650100490000000100055749445448020002001400086C69
      6E6B6564696E010049000000010005574944544802000200C800066769746875
      62010049000000010005574944544802000200C8000363657001004900000001
      0005574944544802000200140007656D707265736104000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'telefone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'linkedin'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'github'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'cep'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'empresa'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 696
    Top = 16
    object funcionarioid: TIntegerField
      FieldName = 'id'
    end
    object funcionarionome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object funcionariotelefone: TStringField
      FieldName = 'telefone'
    end
    object funcionariolinkedin: TStringField
      FieldName = 'linkedin'
      Size = 200
    end
    object funcionariogithub: TStringField
      FieldName = 'github'
      Size = 200
    end
    object funcionariocep: TStringField
      FieldName = 'cep'
    end
    object funcionarioempresa: TIntegerField
      FieldName = 'empresa'
    end
  end
  object DsFuncionario: TDataSource
    DataSet = funcionario
    Left = 736
    Top = 16
  end
  object DspFuncionario: TDataSetProvider
    Left = 776
    Top = 16
  end
end
