object formProduto: TformProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de produtos'
  ClientHeight = 382
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Codigo: TLabel
    Left = 32
    Top = 13
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label2: TLabel
    Left = 32
    Top = 61
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 34
    Top = 111
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object edtCodigo: TEdit
    Left = 32
    Top = 32
    Width = 121
    Height = 21
    Enabled = False
    NumbersOnly = True
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 32
    Top = 80
    Width = 305
    Height = 21
    TabOrder = 1
  end
  object btnSalvar: TButton
    Left = 262
    Top = 124
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = btnSalvarClick
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 173
    Width = 337
    Height = 161
    Caption = 'Listagem de Produtos'
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 333
      Height = 144
      Align = alClient
      DataSource = dsProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'controleespecial'
          Visible = True
        end>
    end
  end
  object edtvalor: TEdit
    Left = 34
    Top = 130
    Width = 87
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object chkControleEspecial: TCheckBox
    Left = 127
    Top = 128
    Width = 97
    Height = 17
    Caption = 'Controle Especial'
    TabOrder = 5
  end
  object dsProduto: TDataSource
    DataSet = memProduto
    Left = 120
    Top = 269
  end
  object memProduto: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 216
    Top = 269
    object memProdutocodigo: TStringField
      FieldName = 'codigo'
    end
    object memProdutonome: TStringField
      FieldName = 'nome'
    end
    object memProdutovalor: TCurrencyField
      FieldName = 'valor'
    end
    object memProdutocontroleespecial: TStringField
      FieldName = 'controleespecial'
    end
  end
end
