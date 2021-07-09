unit Cliente;

interface

type
  TCliente = class
  private
    Fcnpj: string;
    Fnome: string;
    procedure Setcnpj(const Value: string);
    procedure Setnome(const Value: string);

  public
    property cnpj:string read Fcnpj write Setcnpj;
    property nome: string read Fnome write Setnome;
  end;

implementation

{ TCliente }

{ TCliente }

procedure TCliente.Setcnpj(const Value: string);
begin
  Fcnpj := Value;
end;

procedure TCliente.Setnome(const Value: string);
begin
  Fnome := Value;
end;

end.
