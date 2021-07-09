unit frmBuscaCLiente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,cliente, clienteservice,  Vcl.Dialogs, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TformBuscaCliente = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    memCliente: TFDMemTable;
    memClientecpf: TStringField;
    memClientenome: TStringField;
    dsCliente: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
        procedure buscarCLientes();
  public
    { Public declarations }
  end;

var
  formBuscaCliente: TformBuscaCliente;

implementation

{$R *.dfm}

procedure TformBuscaCliente.buscarCLientes;
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

procedure TformBuscaCliente.DBGrid1DblClick(Sender: TObject);
begin
  self.Close;
end;

procedure TformBuscaCliente.FormCreate(Sender: TObject);
begin
buscarCLientes();
end;

end.
