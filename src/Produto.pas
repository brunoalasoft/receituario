unit Produto;

interface

type
  TProduto = class
  private
    Fcontroleespecial: string;
    Fvalor: double;
    Fcodigo: String;
    Fnome: string;
    procedure Setcodigo(const Value: String);
    procedure Setcontroleespecial(const Value: string);
    procedure Setnome(const Value: string);
    procedure Setvalor(const Value: double);
  public
    property codigo:String read Fcodigo write Setcodigo;
    property nome : string read Fnome write Setnome;
    property valor:double read Fvalor write Setvalor;
    property controleespecial  :string read Fcontroleespecial write Setcontroleespecial;
  end;

implementation

{ TProduto }

procedure TProduto.Setcodigo(const Value: String);
begin
  Fcodigo := Value;
end;

procedure TProduto.Setcontroleespecial(const Value: string);
begin
  Fcontroleespecial := Value;
end;

procedure TProduto.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TProduto.Setvalor(const Value: double);
begin
  Fvalor := Value;
end;

end.
