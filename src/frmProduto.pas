unit frmProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, produtodao, produto, Vcl.Dialogs, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.StdCtrls, FireDAC.Comp.DataSet,erro, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids;

type
  TformProduto = class(TForm)
    edtCodigo: TEdit;
    Codigo: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    btnSalvar: TButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    dsProduto: TDataSource;
    memProduto: TFDMemTable;
    memProdutocodigo: TStringField;
    memProdutonome: TStringField;
    memProdutovalor: TCurrencyField;
    Label3: TLabel;
    edtvalor: TEdit;
    chkControleEspecial: TCheckBox;
    memProdutocontroleespecial: TStringField;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
        procedure buscarProdutos();
  public
    { Public declarations }
  end;

var
  formProduto: TformProduto;

implementation

{$R *.dfm}

procedure TformProduto.btnSalvarClick(Sender: TObject);
var
  produto : Tproduto;
  dao : TProdutoDao;
begin
  produto := Tproduto.Create;
  produto.nome := edtnome.text;
  produto.valor := StrToFloat(edtvalor.Text);

  if(chkControleEspecial.Checked) then
  begin
    produto.controleespecial := 'S';
  end
  else
  begin
    produto.controleespecial := 'N';
  end;


  dao := TprodutoDao.Create;
  try

    try
      dao.salvarPRoduto(produto);
      buscarProdutos;
    except
      on e: Exception do
      begin
              ShowMessage('Erro ao salvar produto'+e.Message);
      end;
    end;
  finally
    dao.Free;
  end;
end;

procedure TformProduto.buscarProdutos;
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

procedure TformProduto.FormCreate(Sender: TObject);
begin
  buscarProdutos;
end;

end.
