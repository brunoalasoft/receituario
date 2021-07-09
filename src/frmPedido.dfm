object formPedido: TformPedido
  Left = 0
  Top = 0
  Caption = 'Cadastro de pedidos'
  ClientHeight = 378
  ClientWidth = 478
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
  object Label1: TLabel
    Left = 24
    Top = 13
    Width = 72
    Height = 13
    Caption = 'C'#243'digo CLiente'
  end
  object Label2: TLabel
    Left = 24
    Top = 69
    Width = 58
    Height = 13
    Caption = 'Data Pedido'
  end
  object Label3: TLabel
    Left = 24
    Top = 133
    Width = 74
    Height = 13
    Caption = 'C'#243'digo Produto'
  end
  object Label4: TLabel
    Left = 329
    Top = 134
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label5: TLabel
    Left = 257
    Top = 133
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object edtCodigoCliente: TEdit
    Left = 24
    Top = 32
    Width = 257
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object btnCliente: TButton
    Left = 287
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnClienteClick
  end
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 88
    Width = 137
    Height = 21
    Date = 44386.000000000000000000
    Time = 0.452811597220716100
    Enabled = False
    TabOrder = 2
  end
  object btnBuscarProduto: TButton
    Left = 167
    Top = 150
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 3
    OnClick = btnBuscarProdutoClick
  end
  object edtCodigoProduto: TEdit
    Left = 24
    Top = 152
    Width = 137
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object edtQuantidade: TEdit
    Left = 329
    Top = 153
    Width = 56
    Height = 21
    NumbersOnly = True
    TabOrder = 5
  end
  object btnAdicionar: TButton
    Left = 391
    Top = 150
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 6
    OnClick = btnAdicionarClick
  end
  object edtValor: TEdit
    Left = 257
    Top = 152
    Width = 56
    Height = 21
    Enabled = False
    NumbersOnly = True
    TabOrder = 7
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 179
    Width = 442
    Height = 142
    Caption = 'Itens'
    TabOrder = 8
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 438
      Height = 125
      Align = alClient
      DataSource = dsItens
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
          FieldName = 'codigoproduto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorunitario'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valortotal'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigopedido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'controleespecial'
          Visible = True
        end>
    end
  end
  object btnSalvar: TButton
    Left = 389
    Top = 334
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 9
    OnClick = btnSalvarClick
  end
  object memItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 232
    Top = 240
    object memItenscodigoproduto: TStringField
      FieldName = 'codigoproduto'
    end
    object memItensquantidade: TCurrencyField
      FieldName = 'quantidade'
    end
    object memItensvalorunitario: TCurrencyField
      FieldName = 'valorunitario'
    end
    object memItensvalortotal: TCurrencyField
      FieldName = 'valortotal'
    end
    object memItenscodigopedido: TStringField
      FieldName = 'codigopedido'
    end
    object memItenscontroleespecial: TStringField
      FieldName = 'controleespecial'
      Size = 100
    end
  end
  object dsItens: TDataSource
    DataSet = memItens
    Left = 80
    Top = 224
  end
end
