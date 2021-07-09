unit frmBuscaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,produto, produtodao,  Vcl.Forms, Vcl.Dialogs, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TformBuscaProduto = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    dsProduto: TDataSource;
    memProduto: TFDMemTable;
    memProdutocodigo: TStringField;
    memProdutonome: TStringField;
    memProdutovalor: TCurrencyField;
    memProdutocontroleespecial: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
            procedure buscarProdutos();
  public
    { Public declarations }
  end;

var
  formBuscaProduto: TformBuscaProduto;

implementation

{$R *.dfm}

{ TformBuscaProduto }

procedure TformBuscaProduto.buscarProdutos;
var
  produto : Tproduto;
  dao : TprodutoDao;
begin
  dao := TprodutoDao.Create;

  try
    memproduto.Active := false;
    memproduto.Active := true;
    for produto in dao.listarPRodutos('') do
    begin
      memproduto.Append;
      memProdutocodigo.AsString := produto.codigo;
      memProdutonome.AsString := produto.nome;
      memProdutovalor.AsFloat := produto.valor;
      memProdutocontroleespecial.AsString := produto.controleespecial;
      memproduto.Post;
    end;
  finally
    dao.Free;
  end;


end;

procedure TformBuscaProduto.DBGrid1DblClick(Sender: TObject);
begin
  self.Close;
end;

procedure TformBuscaProduto.FormCreate(Sender: TObject);
begin
buscarProdutos();
end;

end.
