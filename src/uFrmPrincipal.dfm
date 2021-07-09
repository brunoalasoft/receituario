object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Projeto Receitu'#225'rio'
  ClientHeight = 370
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 296
    Top = 192
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
    end
    object Pedidos1: TMenuItem
      Caption = 'Pedidos'
      object PedidodeVenda1: TMenuItem
        Caption = 'Pedido de Venda'
        OnClick = PedidodeVenda1Click
      end
    end
  end
end
