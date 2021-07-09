object formBuscaProduto: TformBuscaProduto
  Left = 0
  Top = 0
  Caption = 'Busca de Produtos'
  ClientHeight = 201
  ClientWidth = 447
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 447
    Height = 201
    Align = alClient
    Caption = 'Clique duas vezes para selecionar o produto'
    TabOrder = 0
    ExplicitLeft = 32
    ExplicitTop = 40
    ExplicitWidth = 337
    ExplicitHeight = 161
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 443
      Height = 184
      Align = alClient
      DataSource = dsProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
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
  object dsProduto: TDataSource
    DataSet = memProduto
    Left = 120
    Top = 109
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
    Top = 85
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
