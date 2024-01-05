unit model.cliente.GetById;

interface

uses
  FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelClienteGetById = class(TModelPrincipal)
    private
    FID_CLIENTE: Integer;

    public
      constructor Create;
      destructor Destroy;

      property ID_CLIENTE : Integer read FID_CLIENTE write FID_CLIENTE;

      function getById(out erro: string): TFDQuery;
  end;

implementation

{ TModelGetAll }

constructor TModelClienteGetById.Create;
begin

  inherited;
end;

destructor TModelClienteGetById.Destroy;
begin

  inherited;
end;

function TModelClienteGetById.getById(out erro: string): TFDQuery;
var
  qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;

    with qry do
      begin
        Active := false;
        SQL.Clear;
        SQL.Add('SELECT c.id, c.nome, c.fantasia, ci.nome, ci.uf, c.endereco, c.bairro, c.numero, c.complemento,' +
        ' c.cep, c.celular, c.telefone, c.tipopessoa, c.cpf, c.cnpj, c.inscestadual, c.rg FROM cliente c');
        SQL.Add('INNER JOIN cidade ci ON c.cidadeid = ci.id');
        SQL.Add('WHERE c.id = :ID');
        ParamByName('ID').Value := ID_CLIENTE;
        Active := true;
      end;

    erro := '';
    Result := qry;
  except on ex:exception do
    begin
      erro := 'Erro ao consultar cliente: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

end.
