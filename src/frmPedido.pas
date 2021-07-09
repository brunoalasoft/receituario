unit frmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids,frmBuscaCLiente,frmBUscaPRoduto, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, pedido,generics.collections, frmBuscaTecnico, pedidodao;

type
  TformPedido = class(TForm)
    edtCodigoCliente: TEdit;
    Label1: TLabel;
    btnCliente: TButton;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    btnBuscarProduto: TButton;
    edtCodigoProduto: TEdit;
    Label3: TLabel;
    edtQuantidade: TEdit;
    Label4: TLabel;
    btnAdicionar: TButton;
    edtValor: TEdit;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    btnSalvar: TButton;
    memItens: TFDMemTable;
    dsItens: TDataSource;
    memItenscodigoproduto: TStringField;
    memItensquantidade: TCurrencyField;
    memItensvalorunitario: TCurrencyField;
    memItensvalortotal: TCurrencyField;
    memItenscodigopedido: TStringField;
    memItenscontroleespecial: TStringField;
    procedure btnClienteClick(Sender: TObject);
    procedure btnBuscarProdutoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    controleEspecial : string;
  public
    { Public declarations }
  end;

var
  formPedido: TformPedido;

implementation

{$R *.dfm}

procedure TformPedido.btnAdicionarClick(Sender: TObject);
begin
  memItens.Append;
  memItenscodigoproduto.AsString := edtCodigoProduto.Text;
  memItensquantidade.AsCurrency := strtofloat(edtQuantidade.Text);
  memItensvalorunitario.AsCurrency := strtofloat(edtValor.Text);
  memItensvalortotal.AsCurrency := memItensquantidade.AsCurrency  *   memItensvalorunitario.AsCurrency;
  memItenscontroleespecial.AsString := 'S';
  memItens.Post;
end;

procedure TformPedido.btnBuscarProdutoClick(Sender: TObject);
begin
  formBuscaProduto := TformBuscaProduto.create(self);
  formBuscaProduto.ShowModal;
  edtCodigoProduto.Text := formBuscaProduto.memProdutocodigo.AsString;
  controleEspecial:= formBuscaProduto.memProdutocontroleespecial.AsString;
  edtValor.Text := FloatTostr(formBuscaProduto.memProdutovalor.Value);
  formBuscaProduto.Free;
end;

procedure TformPedido.btnClienteClick(Sender: TObject);
begin
  formBuscaCliente :=  TformBuscaCliente.Create(self);
  formBuscaCLiente.ShowModal;
  edtCodigoCliente.Text := formBuscaCliente.memClientecpf.AsString;
  formBuscaCliente.Free;
end;

procedure TformPedido.btnSalvarClick(Sender: TObject);
var

  dao: TPedidoDao;
  pedido: TPedido;
  cpftecnico:String;
  existeProdutoControleEspecial: BOOLEAN;
  item : TItem;
begin
  dao := TPedidoDao.Create();


  memItens.First;
  while not memItens.Eof do
  begin
    if(memItenscontroleespecial.AsString='S')then
    begin
      ShowMEssage('Existe produto com controle especial selecione o tecnico pra assinar receituario');

      existeProdutoControleEspecial := true;
      formBUscaTecnico := TformBuscaTecnico.Create(self);
      formBuscaTecnico.ShowModal;
      cpftecnico := formBuscaTecnico.memTecnicocpf.asstring;
      formBuscaTecnico.Free;
      break;
    end;
    memItens.Next;
  end;





  try
    pedido := TPedido.create;
    pedido.cnpjCliente := edtCodigoCliente.Text;
    pedido.dataPedido := DateTimePicker1.Date;
    if(existeProdutoControleEspecial)then
    begin
      pedido.statusPedido := STATUS_AGUARDANDO_RECEITA;
    end
    else
    begin
      pedido.statusPedido := STATUS_CONCLUIDO;
    end;

    pedido.cpfTecnico := cpfTecnico;


    memItens.First;
    while not memItens.Eof do
    begin
      item := TItem.Create;
      item.codigoProduto := memItenscodigoproduto.AsString;
      item.quantidade := memItensquantidade.AsFloat;
      item.valorUnitario := memItensvalorunitario.AsFloat;
      item.valorTotal := memItensvalortotal.AsFloat;
      item.controleEspecial := memItenscontroleespecial.AsString;
      pedido.itens.Add(item);
      memItens.Next
    end;

    try
      dao.salvarPedido(pedido);
      showMessage('Sucesso ao salvar pedido');

      memItens.Active := false;

      edtCodigoCliente.Text := EmptyStr;
      edtCodigoProduto.Text := EmptyStr;
      edtValor.Text := EmptyStr;
      edtQuantidade.Text := EmptyStr;
    except
      on e : exception do
      begin
        ShowMessage('Erro ao salvar pedido' + e.Message);
      end;
    end;
  finally
    dao.free;
  end;
end;

procedure TformPedido.DBGrid1DblClick(Sender: TObject);
begin
  self.Close;
end;

procedure TformPedido.FormCreate(Sender: TObject);
begin
  memItens.Active := false;
  memItens.Active := true;
end;

end.
