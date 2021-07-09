unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,frmPedido, frmCliente,tecnico,tecnicodao,frmPRoduto, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Cliente1: TMenuItem;
    Produtos1: TMenuItem;
    Pedidos1: TMenuItem;
    PedidodeVenda1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure PedidodeVenda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Cliente1Click(Sender: TObject);
begin
  formCliente := Tformcliente.create(self);
  formcliente.showMOdal();
  formCliente.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  dao : TTecnicoDao;
begin

  dao := TTecnicoDao.create;

  try
    dao.deleteTecnicos;
    dao.carregarTecnicosDefault;
  finally
    dao.free;
  end;
end;

procedure TForm1.PedidodeVenda1Click(Sender: TObject);
begin
  formPedido:= TformPedido.Create(self);
  formpedido.ShowModal;
  formpedido.Free;
end;

procedure TForm1.Produtos1Click(Sender: TObject);
begin
  formProduto := TformProduto.create(self);
  formProduto.ShowModal;
  formProduto.Free;
end;

end.
