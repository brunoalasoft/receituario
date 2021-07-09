object formCliente: TformCliente
  Left = 0
  Top = 0
  Caption = 'Cadatro de CLientes'
  ClientHeight = 347
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 13
    Width = 17
    Height = 13
    Caption = 'Cpf'
  end
  object Label2: TLabel
    Left = 32
    Top = 61
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object edtCpf: TEdit
    Left = 32
    Top = 32
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 32
    Top = 80
    Width = 345
    Height = 21
    TabOrder = 1
  end
  object btnSalvar: TButton
    Left = 302
    Top = 128
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = btnSalvarClick
  end
  object GroupBox1: TGroupBox
    Left = 40
    Top = 168
    Width = 337
    Height = 161
    Caption = 'Listagem de CLientes'
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 333
      Height = 144
      Align = alClient
      DataSource = dsCliente
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
          FieldName = 'cpf'
          Title.Caption = 'Cpf'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Visible = True
        end>
    end
  end
  object dsCliente: TDataSource
    DataSet = memCliente
    Left = 104
    Top = 232
  end
  object memCliente: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 168
    Top = 232
    object memClientecpf: TStringField
      FieldName = 'cpf'
    end
    object memClientenome: TStringField
      FieldName = 'nome'
    end
  end
end
