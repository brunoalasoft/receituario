unit Pedido;

interface

uses
  Generics.collections;

type
  TItem = class
  private
    FcontroleEspecial: string;
    FcodigoProduto: string;
    FvalorUnitario: double;
    FcodigoPedido: string;
    FvalorTotal: double;
    Fquantidade: double;
    procedure SetcodigoPedido(const Value: string);
    procedure SetcodigoProduto(const Value: string);
    procedure SetcontroleEspecial(const Value: string);
    procedure Setquantidade(const Value: double);
    procedure SetvalorTotal(const Value: double);
    procedure SetvalorUnitario(const Value: double);
  public
    property codigoProduto: string read FcodigoProduto write SetcodigoProduto;
    property quantidade: double read Fquantidade write Setquantidade;
    property valorUnitario: double read FvalorUnitario write SetvalorUnitario;
    property valorTotal:double read FvalorTotal write SetvalorTotal;
    property codigoPedido:string read FcodigoPedido write SetcodigoPedido;
    property controleEspecial:string read FcontroleEspecial write SetcontroleEspecial;
  end;

  TPEdido = class(TObject)
  private
    FdataPedido: Tdate;
    Fitens: TList<TItem>;
    Fcodigo: string;
    FcnpjCliente: string;
    FcpfTecnico: string;
    Fvalortotal: double;
    FstatusPedido: string;
    procedure SetcnpjCliente(const Value: string);
    procedure Setcodigo(const Value: string);
    procedure SetcpfTecnico(const Value: string);
    procedure SetdataPedido(const Value: Tdate);
    procedure Setitens(const Value: TList<TItem>);
    procedure SetstatusPedido(const Value: string);
    procedure Setvalortotal(const Value: double);

  public
    property codigo:string read Fcodigo write Setcodigo;
    property cnpjCliente:string read FcnpjCliente write SetcnpjCliente;
    property dataPedido:Tdate read FdataPedido write SetdataPedido;
    property statusPedido:string read FstatusPedido write SetstatusPedido;
    property cpfTecnico:string read FcpfTecnico write SetcpfTecnico;
    property valortotal:double read Fvalortotal write Setvalortotal;
    property itens:TList<TItem> read Fitens write Setitens;

    constructor create;
    destructor Destroy;override;
  end;


  CONST
    STATUS_CONCLUIDO : STRING = 'CONCLUIDO';
    STATUS_AGUARDANDO_RECEITA : STRING = 'AGUARDANDORECEITA';
implementation

{ TItem }

procedure TItem.SetcodigoPedido(const Value: string);
begin
  FcodigoPedido := Value;
end;

procedure TItem.SetcodigoProduto(const Value: string);
begin
  FcodigoProduto := Value;
end;

procedure TItem.SetcontroleEspecial(const Value: string);
begin
  FcontroleEspecial := Value;
end;

procedure TItem.Setquantidade(const Value: double);
begin
  Fquantidade := Value;
end;

procedure TItem.SetvalorTotal(const Value: double);
begin
  FvalorTotal := Value;
end;

procedure TItem.SetvalorUnitario(const Value: double);
begin
  FvalorUnitario := Value;
end;

{ TPEdido }

constructor TPEdido.create;
begin
  Fitens:=TList<TItem>.create;
end;


destructor TPEdido.Destroy;
var
 item : TItem;
begin
  for item in Fitens do
  begin
    item.Free;
  end;
  fitens.Free;
  inherited;
end;

procedure TPEdido.SetcnpjCliente(const Value: string);
begin
  FcnpjCliente := Value;
end;

procedure TPEdido.Setcodigo(const Value: string);
begin
  Fcodigo := Value;
end;

procedure TPEdido.SetcpfTecnico(const Value: string);
begin
  FcpfTecnico := Value;
end;

procedure TPEdido.SetdataPedido(const Value: Tdate);
begin
  FdataPedido := Value;
end;

procedure TPEdido.Setitens(const Value: TList<TItem>);
begin
  Fitens := Value;
end;

procedure TPEdido.SetstatusPedido(const Value: string);
begin
  FstatusPedido := Value;
end;

procedure TPEdido.Setvalortotal(const Value: double);
begin
  Fvalortotal := Value;
end;

end.
