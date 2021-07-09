unit ClienteDao;

interface

uses
  Cliente,FireDAC.Comp.Client,Generics.Collections, dmDados;

type
  TClienteDao=class
  private
  public
    procedure salvarCLiente(cliente : TCliente);
    procedure atualizarCliente(cliente:TCliente);
    procedure excluirCliente(cnpj : String);
    function listarClientes(cnpj:String):TList<TCliente>;
  end;

implementation

{ TClienteDao }

procedure TClienteDao.atualizarCliente(cliente: TCliente);
var
  vQuery: TFDQuery;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('    update cliente set nome = :nome where cnpj = :cnpj ');
    vQuery.Prepare;

    vQuery.ParamByName('cnpj').AsString := cliente.cnpj;
    vquery.ParamByName('nome').Asstring := cliente.nome;
    vQuery.ExecSQL();
  finally
    vquery.Free;
  end;

end;

procedure TClienteDao.excluirCliente(cnpj : String);
var
  vQuery: TFDQuery;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('delete from cliente where cnpj = :cnpj ');
    vQuery.Prepare;
    vQuery.ParamByName('cnpj').AsString := cnpj;
    vQuery.ExecSQL();
  finally
    vquery.Free;
  end;

end;



function TClienteDao.listarClientes(cnpj: String): TList<TCliente>;
var
  vQuery: TFDQuery;
  clienteBanco :TCliente;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    Result := TList<TCliente>.create;
    vQuery.SQL.Clear;
    vQuery.SQL.Add('select cnpj, nome from cliente ');


    vquery.Open();

    vQuery.First;
    while not vQuery.Eof do
    begin
      clienteBanco := TCliente.Create;
      clienteBanco.cnpj := vquery.FieldByName('cnpj').AsString;
      clienteBanco.nome := vquery.FieldByName('nome').AsString;
      result.Add(clienteBanco);
      vQuery.next;
    end;
  finally
    vquery.Free;
  end;

end;

procedure TClienteDao.salvarCLiente(cliente: TCliente);
var
  vQuery: TFDQuery;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('insert into cliente (cnpj, nome) values (:cnpj,:nome)');
    vQuery.Prepare;

    vQuery.ParamByName('cnpj').AsString := cliente.cnpj;
    vquery.ParamByName('nome').Asstring := cliente.nome;
    vQuery.ExecSQL();
  finally
    vquery.Free;
  end;
end;

end.
