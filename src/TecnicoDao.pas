unit TecnicoDao;

interface

uses
  Generics.Collections, Tecnico,
  FireDAC.Comp.Client,dmDados, sysutils;

type
  TTecnicoDao= class
  private
  public
    procedure deleteTecnicos();
    procedure carregarTecnicosDefault;
    function buscarTecnicos: TList<TTecnico>;
  end;

implementation

{ TTecnicoDao }

function TTecnicoDao.buscarTecnicos: TList<TTecnico>;
var
  vQuery: TFDQuery;
  tecnicoBanco :TTecnico;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;

  try
    Result := TList<TTecnico>.create;
    vQuery.SQL.Clear;
    vQuery.SQL.Add('select cpf, numeroregistro from tecnico ');
    vquery.Open();
    vQuery.First;

    while not vQuery.Eof do
    begin
      tecnicoBanco := TTecnico.Create;
      tecnicoBanco.cpf := vquery.FieldByName('cpf').AsString;
      tecnicoBanco.numeroregistro := vquery.FieldByName('numeroregistro').AsString;
      result.Add(tecnicoBanco);
      vQuery.next;
    end;
  finally
    vquery.Free;
  end;

end;

procedure TTecnicoDao.carregarTecnicosDefault;
var
  vQuery: TFDQuery;
  listaTecnicosDefault : TList<TTecnico>;
  tecnicoDefault : TTecnico;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;
  listaTecnicosDefault := TList<TTecnico>.create;

  tecnicoDefault := TTecnico.Create;
  tecnicoDefault.cpf := '56263690070';
  tecnicoDefault.numeroRegistro :=TGUID.NewGuid.ToString();
  listaTecnicosDefault.Add(tecnicoDefault);
  tecnicoDefault := TTecnico.Create;
  tecnicoDefault.cpf := '81003858074';
  tecnicoDefault.numeroRegistro :=TGUID.NewGuid.ToString();
  listaTecnicosDefault.Add(tecnicoDefault);
  tecnicoDefault := TTecnico.Create;
  tecnicoDefault.cpf := '91775529037';
  tecnicoDefault.numeroRegistro :=TGUID.NewGuid.ToString();
  listaTecnicosDefault.Add(tecnicoDefault);

  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('insert into tecnico (cpf, numeroregistro) values (:cpf,:numeroregistro)');
    vQuery.Prepare;

    for tecnicoDefault in listaTecnicosDefault do
    begin
      vQuery.ParamByName('cpf').AsString := tecnicoDefault.cpf;
      vquery.ParamByName('numeroregistro').Asstring := tecnicoDefault.numeroRegistro;
      vQuery.ExecSQL();
    end;
  finally
    vquery.Free;
    for tecnicoDefault  in  listaTecnicosDefault do
    begin
      tecnicoDefault.Free;
    end;
    listaTecnicosDefault.Free;
  end;

end;

procedure TTecnicoDao.deleteTecnicos;
var
  vQuery: TFDQuery;
begin
  vquery := TFDQuery.Create(nil);
  vquery.Connection := dmConexao.conexao;
  try
    vQuery.SQL.Clear;
    vQuery.SQL.Add('delete from tecnico ');
    vQuery.Prepare;
    vQuery.ExecSQL();
  finally
    vquery.Free;
  end;
end;

end.
