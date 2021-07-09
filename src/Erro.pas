unit Erro;

interface

uses generics.collections, sysutils;

type
  TErro = class
  private
    Fcodigo: string;
    Fnome: string;
    procedure Setcodigo(const Value: string);
    procedure Setnome(const Value: string);

  public
    property codigo:string read Fcodigo write Setcodigo;
    property nome:string read Fnome write Setnome;
    class function convertervalor(erros:TList<Terro>):String;
  end;

  const
    CODIGO_DEFAULT_ERRO : STRING = '400';
implementation




class function TErro.convertervalor(erros: TList<Terro>): String;
var
  erro : TErro;
begin
  Result := EmptyStr;

  for erro in erros do
  begin
    Result := Result + erro.nome;
  end;


end;

procedure TErro.Setcodigo(const Value: string);
begin
  Fcodigo := Value;
end;

procedure TErro.Setnome(const Value: string);
begin
  Fnome := Value;
end;





end.
