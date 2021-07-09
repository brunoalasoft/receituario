unit Tecnico;

interface

type
  TTecnico= class
  private
    Fcpf: string;
    FnumeroRegistro: string;
    procedure Setcpf(const Value: string);
    procedure SetnumeroRegistro(const Value: string);
  public
    property  cpf : string read Fcpf write Setcpf;
    property  numeroRegistro : string read FnumeroRegistro write SetnumeroRegistro;
  end;

implementation

{ TTecnico }

procedure TTecnico.Setcpf(const Value: string);
begin
  Fcpf := Value;
end;

procedure TTecnico.SetnumeroRegistro(const Value: string);
begin
  FnumeroRegistro := Value;
end;

end.
