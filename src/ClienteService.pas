unit ClienteService;

interface

uses
  cliente,clientedao, erro,Generics.collections;

type
  TClienteService=class
  private
    function validarDados(pCLiente:TCliente):TList<TErro>;
  public
    function salvarCliente(pCliente : TCLiente):TList<TERro>;
    function buscarClientes():TList<TCLiente>;
  end;

implementation

{ TClienteService }

function TClienteService.buscarClientes: TList<TCLiente>;
var
  dao : TClienteDao;
begin

  dao := TClienteDao.Create;
  try
    result := dao.listarClientes('');
  finally
    dao.Free;
  end;
end;

function TClienteService.salvarCliente(pCliente : TCLiente):TList<TERro>;
var
  dao : TClienteDao;
begin

  Result := validarDados(pCliente);

  if (result.Count <= 0)then
  begin
    try
      dao := TClientedao.Create;
      dao.salvarCLiente(pCliente);
    finally
      dao.Free;
    end;
  end;
end;

function TClienteService.validarDados(pCLiente: TCliente): TList<TErro>;
var
  erro : TErro;
begin
  Result := Tlist<TErro>.create;


  if(Length(pCLiente.cnpj) >14)then
  begin
    erro := Terro.Create;
    erro.codigo :=   CODIGO_DEFAULT_ERRO;
    erro.nome := 'Valor campo CNPJ inválido';
    result.Add(erro);
  end;

  if(Length(pCLiente.nome) <= 0)then
  begin
      erro := Terro.Create;
    erro.codigo :=   CODIGO_DEFAULT_ERRO;
    erro.nome := 'Valor campo nome não pode ser nulo';
    result.Add(erro);
  end;
end;


end.
