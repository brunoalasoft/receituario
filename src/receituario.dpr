program receituario;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {Form1},
  Cliente in 'Cliente.pas',
  ClienteService in 'ClienteService.pas',
  Erro in 'Erro.pas',
  ClienteDao in 'ClienteDao.pas',
  dmDados in 'dmDados.pas' {dmConexao: TDataModule},
  Tecnico in 'Tecnico.pas',
  TecnicoDao in 'TecnicoDao.pas',
  Produto in 'Produto.pas',
  ProdutoDao in 'ProdutoDao.pas',
  Pedido in 'Pedido.pas',
  PedidoDao in 'PedidoDao.pas',
  frmCliente in 'frmCliente.pas' {formCliente},
  frmProduto in 'frmProduto.pas' {formProduto},
  frmPedido in 'frmPedido.pas' {formPedido},
  frmBuscaCLiente in 'frmBuscaCLiente.pas' {formBuscaCliente},
  frmBuscaProduto in 'frmBuscaProduto.pas' {formBuscaProduto},
  frmBuscaTecnico in 'frmBuscaTecnico.pas' {formBuscaTecnico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
