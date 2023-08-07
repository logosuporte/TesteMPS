object FormEmpresa: TFormEmpresa
  Left = 0
  Top = 0
  Caption = 'Cadastro de empresa'
  ClientHeight = 470
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label2: TLabel
    Left = 8
    Top = 119
    Width = 35
    Height = 13
    Caption = 'Fun'#231#227'o'
  end
  object Label3: TLabel
    Left = 320
    Top = 48
    Width = 66
    Height = 13
    Caption = 'Data de Inicio'
  end
  object Label4: TLabel
    Left = 320
    Top = 119
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object Label5: TLabel
    Left = 333
    Top = 194
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 49
    Align = alTop
    TabOrder = 0
    object Labelid: TLabel
      Left = 24
      Top = 24
      Width = 3
      Height = 13
    end
    object btncancelar: TBitBtn
      Left = 254
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Cancelar '
      Enabled = False
      TabOrder = 0
      OnClick = btncancelarClick
    end
    object btnsalvar: TBitBtn
      Left = 335
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 1
      OnClick = btnsalvarClick
    end
    object btndelete: TBitBtn
      Left = 416
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Deletar'
      TabOrder = 2
      OnClick = btndeleteClick
    end
    object btnadd: TBitBtn
      Left = 173
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 3
      OnClick = btnaddClick
    end
    object btnalterar: TButton
      Left = 92
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Alterar'
      Enabled = False
      TabOrder = 4
      OnClick = btnalterarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 213
    Width = 500
    Height = 257
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'descricao'
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'funcao'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datainicio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datafinal'
        Visible = True
      end>
  end
  object Editdescricao: TEdit
    Left = 8
    Top = 67
    Width = 249
    Height = 21
    TabOrder = 2
  end
  object DtInicio: TDatePicker
    Left = 317
    Top = 67
    Date = 45142.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 3
  end
  object DtFinal: TDatePicker
    Left = 320
    Top = 138
    Date = 45142.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
  end
  object Editfuncao: TEdit
    Left = 8
    Top = 144
    Width = 249
    Height = 21
    TabOrder = 5
  end
  object DataSource1: TDataSource
    DataSet = historicoempresas
    Left = 160
    Top = 160
  end
  object historicoempresas: TClientDataSet
    PersistDataPacket.Data = {
      990000009619E0BD010000001800000006000000000003000000990002696404
      000100000000000964657363726963616F010049000000010005574944544802
      00020064000666756E63616F0100490000000100055749445448020002001400
      0A64617461696E6963696F0400060000000000096461746166696E616C040006
      00000000000D696466756E63696F6E6172696F04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'funcao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'datainicio'
        DataType = ftDate
      end
      item
        Name = 'datafinal'
        DataType = ftDate
      end
      item
        Name = 'idfuncionario'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'id'
      end>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 160
    object historicoempresasid: TIntegerField
      FieldName = 'id'
    end
    object historicoempresasdescricao: TStringField
      DisplayLabel = 'Descric'#227'o'
      DisplayWidth = 100
      FieldName = 'descricao'
      Size = 100
    end
    object historicoempresasfuncao: TStringField
      FieldName = 'funcao'
    end
    object historicoempresasdatainicio: TDateField
      FieldName = 'datainicio'
    end
    object historicoempresasdatafinal: TDateField
      FieldName = 'datafinal'
    end
    object historicoempresasidfuncionario: TIntegerField
      FieldName = 'idfuncionario'
    end
  end
end
