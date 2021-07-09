unit frmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,clienteservice,generics.collections, erro, cliente,  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TformCliente = class(TForm)
    edtCpf: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    btnSalvar: TButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    dsCliente: TDataSource;
    memCliente: TFDMemTable;
    memClientecpf: TStringField;
    memClientenome: TStringField;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure buscarCLientes();
  public
    { Public declarations }
  end;

var
  formCliente: TformCliente;

implementation

{$R *.dfm}

procedure TformCliente.btnSalvarClick(Sender: TObject);
var
  cliente : TCliente;
  clienteService : TClienteService;
  erro : Tlist<Terro>;
begin
  cliente := TCliente.Create;
  cliente.cnpj := edtCpf.Text;
  cliente.nome := edtnome.text;

  clienteService := TClienteService.Create;

  try
    erro := clienteService.salvarCliente(cliente);

    if(erro.Count >0)then
    begin
       ShowMessage(Terro.convertervalor(erro));
    end
    else
    begin
      ShowMessage('Sucesso ao gravar cliente');
      buscarCLientes;
    end;

  finally
    clienteService.Free;
  end;

end;

procedure TformCliente.buscarCLientes;
var
  cliente : TCliente;
  clienteService : TClienteService;

begin
  clienteService := TClienteService.Create;

  try
    memCliente.Active := false;
    memCliente.Active := true;
    for cliente in clienteService.buscarClientes() do
    begin
      memCliente.Append;
      memClientecpf.AsString := cliente.cnpj;
      memClientenome.AsString := cliente.nome;
      memCliente.Post;
    end;
  finally
    clienteService.Free;
  end;
end;

procedure TformCliente.FormCreate(Sender: TObject);
begin
  buscarCLientes;
end;

end.
