unit ProdutoDao;

interface

uses

  Generics.Collections, PRoduto,
  FireDAC.Comp.Client,dmDados, sysutils;

type
  TprodutoDao = class
  private
  public
    procedure salvarPRoduto(produto : Tproduto);
    procedure atualizarPRoduto(produto:TProduto);
    procedure excluirProduto(codigo : String);
    function listarPRodutos(codigo:String):TList<TProduto>;
  end;

implementation

{ TprodutoDao }

procedure TprodutoDao.atualizarPRoduto(produto: TProduto);
var
  vQuery: TFDQuery;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('update produto set nome = :nome, valor = :valor, controleespecial = :controleespecial where codigo = :codigo ');
    vQuery.Prepare;
    vQuery.ParamByName('nome').AsString := produto.nome;
    vquery.ParamByName('valor').AsFloat := produto.valor;
    vquery.ParamByName('controleespecial').AsString := produto.controleespecial;
    vquery.ParamByName('codigo').AsString := produto.codigo;
    vQuery.ExecSQL();
  finally
    vquery.Free;
  end;


end;

procedure TprodutoDao.excluirProduto(codigo: String);
var
  vQuery: TFDQuery;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('delete from produto where codigo = :codigo ');
    vQuery.Prepare;
    vQuery.ParamByName('codigo').AsString := codigo;
    vQuery.ExecSQL();
  finally
    vquery.Free;
  end;

end;

function TprodutoDao.listarPRodutos(codigo: String): TList<TProduto>;
var
  vQuery: TFDQuery;
  produto :TProduto;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    Result := TList<TProduto>.create;
    vQuery.SQL.Clear;
    vQuery.SQL.Add('select codigo, nome, valor, controleespecial from produto ');
    vquery.Open();
    vQuery.First;

    while not vQuery.Eof do
    begin
      produto := TProduto.Create;
      produto.codigo := vquery.FieldByName('codigo').AsString;
      produto.nome := vquery.FieldByName('nome').AsString;
      produto.valor := vquery.FieldByName('valor').AsFloat;
      produto.controleespecial := vquery.FieldByName('controleespecial').AsString;
      result.Add(produto);
      vQuery.next;
    end;
  finally
    vquery.Free;
  end;
end;

procedure TprodutoDao.salvarPRoduto(produto: Tproduto);
var
  vQuery: TFDQuery;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('insert into produto (codigo, nome, valor, controleespecial ) values (:codigo, :nome, :valor, :controleespecial)');
    vQuery.ParamByName('codigo').AsString := TGUID.NewGuid.ToString();;
    vquery.ParamByName('nome').Asstring := produto.nome;
    vquery.ParamByName('valor').AsFloat := produto.valor ;
    vquery.ParamByName('controleespecial').Asstring := produto.controleespecial;
    vQuery.ExecSQL();
  finally
    vquery.Free;
  end;

end;

end.
