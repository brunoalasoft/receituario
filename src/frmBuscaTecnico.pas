unit frmBuscaTecnico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, tecnico, tecnicodao, Vcl.DBGrids, Vcl.StdCtrls;

type
  TformBuscaTecnico = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    dsTecnico: TDataSource;
    memTecnico: TFDMemTable;
    memTecnicocpf: TStringField;
    memTecniconumeroregistro: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure buscarTecnico;
  public
    { Public declarations }
  end;

var
  formBuscaTecnico: TformBuscaTecnico;

implementation

{$R *.dfm}

{ TformBuscaTecnico }

procedure TformBuscaTecnico.buscarTecnico;
var
dao : TTecnicoDao;
tecnico: Ttecnico;
begin
  dao := TTecnicoDao.Create;

  memTecnico.Active := false;
    memTecnico.Active := true;
  try
    for tecnico in dao.buscarTecnicos do
    begin
      memTecnico.Append;
      memTecnicocpf.AsString := tecnico.cpf;
      memTecniconumeroregistro.AsString := tecnico.numeroRegistro;
      memTecnico.Post;
    end;
  finally
    dao.Free;
  end;
end;

procedure TformBuscaTecnico.DBGrid1DblClick(Sender: TObject);
begin
  self.Close;
end;

procedure TformBuscaTecnico.FormCreate(Sender: TObject);
begin
  buscarTecnico;
end;

end.
