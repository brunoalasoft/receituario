unit PedidoDao;

interface

uses
  pedido,FireDAC.Comp.Client,dmDados, sysutils, Generics.collections;

type
  TPedidoDao = class
  private
  public
    procedure salvarPedido(pedido:TPedido);
    procedure excluirPedido(codigoPedido:String);
    function  buscarPedidos(codigoPedido:string):TList<TPedido>;
    procedure atualizarStatusPedido(pedido:Tpedido);
  end;

implementation

{ TPedidoDao }

procedure TPedidoDao.atualizarStatusPedido(pedido:Tpedido);
var
  vQuery: TFDQuery;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('update pedido set statuspedido= :statuspedido where codigo = :codigo ');
    vQuery.Prepare;
    vQuery.ParamByName('codigo').AsString := pedido.codigo;
    vQuery.ParamByName('statuspedido').AsString := pedido.statusPedido;
    vQuery.ExecSQL();
  finally
    vquery.Free;
  end;
end;

function TPedidoDao.buscarPedidos(codigoPedido: string): TList<TPedido>;
var
  vQuery: TFDQuery;
  vQueryItem : TFDQuery;
  pedido : TPedido;
  item : TItem;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  vQueryItem := TFDQuery.Create(nil);
  vQueryItem.Connection := dmConexao.conexao;
  Result := TList<TPedido>.create;

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('select codigo, cnpjcliente, datapedido, statuspedido, cpftecnico, valortotal from pedido  ');
    vQuery.Prepare;
    vQuery.open;

    vQuery.First;

    while (not vquery.Eof) do
    begin
      pedido := TPedido.create;
      pedido.codigo := vquery.FieldByName('codigo').AsString;
      pedido.cnpjCliente := vquery.FieldByName('cnpjcliente').AsString;
      pedido.dataPedido := vquery.FieldByName('datapedido').AsDateTime;
      pedido.statusPedido := vquery.FieldByName('statuspedido').AsString;
      pedido.cpfTecnico := vquery.FieldByName('cpftecnico').AsString;
      pedido.valortotal := vquery.FieldByName('valortotal').AsFloat;

      vQueryItem.SQL.Clear;
      vQueryItem.SQL.Add('select codigoproduto, quantidade, valorunitario, valortotal, codigopedido,controleespecial from item where codigopedido = :codigopedido  ');
      vQueryItem.Prepare;
      vQueryItem.ParamByName('codigopedido').AsString := vquery.FieldByName('codigo').AsString;
      vQueryItem.open;
      vQueryItem.First;
      while(not vQueryItem.Eof) do
      begin
        item := Titem.Create;
        item.codigoProduto := vQueryItem.FieldByName('codigoproduto').AsString;
        item.quantidade := vQueryItem.FieldByName('quantidade').AsFloat;
        item.valorUnitario := vQueryItem.FieldByName('valorunitario').AsFloat;
        item.valorTotal := vQueryItem.FieldByName('valortotal').AsFloat;
        item.codigoPedido := vQueryItem.FieldByName('codigoproduto').AsString;
        item.controleEspecial := vQueryItem.FieldByName('controleespecial').AsString;
        pedido.itens.Add(item);
        vQueryItem.Next;
      end;

      result.Add(pedido);
      vQuery.Next;
    end;
  finally
    vquery.Free;
    vQueryItem.Free;
  end;
end;

procedure TPedidoDao.excluirPedido(codigoPedido: String);
var
  vQuery: TFDQuery;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('delete from pedido where codigo = :codigo ');
    vQuery.Prepare;
    vQuery.ParamByName('codigo').AsString := codigoPedido;
    vQuery.ExecSQL();
    vQuery.SQL.Clear;
    vQuery.SQL.Add('delete from item where item.codigopedido = :codigo ');
    vQuery.Prepare;
    vQuery.ParamByName('codigo').AsString := codigoPedido;
    vQuery.ExecSQL();
  finally
    vquery.Free;
  end;

end;

procedure TPedidoDao.salvarPedido(pedido: TPedido);
var
  vQuery: TFDQuery;
  item: Titem;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('insert into pedido (codigo, cnpjcliente, datapedido, statuspedido,cpftecnico, valortotal ) values (:codigo, :cnpjcliente, :datapedido, :statuspedido,:cpftecnico, :valortotal)');
    pedido.codigo := TGUID.NewGuid.ToString();
    vQuery.ParamByName('codigo').AsString := pedido.codigo;
    vquery.ParamByName('cnpjcliente').Asstring := pedido.cnpjCliente;
    vquery.ParamByName('datapedido').AsDate := pedido.dataPedido;
    vquery.ParamByName('statuspedido').Asstring := pedido.statusPedido;
    vquery.ParamByName('cpftecnico').Asstring := pedido.cpfTecnico;
    vquery.ParamByName('valortotal').AsFloat := pedido.valortotal;
    vQuery.ExecSQL();


    for item in pedido.itens do
    begin
      vQuery.SQL.Clear;
      vQuery.SQL.Add('insert into item (codigoproduto, quantidade, valorunitario, valortotal,codigopedido, controleespecial ) values (:codigoproduto, :quantidade, :valorunitario, :valortotal,:codigopedido, :controleespecial)');

      vQuery.ParamByName('codigoproduto').AsString := item.codigoProduto;
      vquery.ParamByName('quantidade').AsFloat := item.quantidade;
      vquery.ParamByName('valorunitario').AsFloat := item.valorUnitario;
      vquery.ParamByName('valortotal').AsFloat := item.valorTotal;
      vquery.ParamByName('codigopedido').Asstring := pedido.codigo;
      vquery.ParamByName('controleespecial').Asstring := item.controleEspecial;
      vQuery.ExecSQL();
    end;
  finally
    vquery.Free;
  end;
end;

end.
