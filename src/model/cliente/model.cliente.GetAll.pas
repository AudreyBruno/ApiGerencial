unit model.cliente.GetAll;

interface

uses
  FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelClienteGetAll = class(TModelPrincipal)
    private

    public
      constructor Create;
      destructor Destroy;

      function getAll(order_by: string; out erro: string): TFDQuery;
  end;

implementation

{ TGetAll }

constructor TModelClienteGetAll.Create;
begin

  inherited;
end;

destructor TModelClienteGetAll.Destroy;
begin

  inherited;
end;

function TModelClienteGetAll.getAll(order_by: string; out erro: string): TFDQuery;
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
        SQL.Add('WHERE 1 = 1');

        if order_by = '' then
          SQL.Add('ORDER BY ID')
        else
          SQL.Add('ORDER BY ' + order_by);

        Active := true;
      end;

    erro := '';
    Result := qry;
  except on ex:exception do
    begin
      erro := 'Erro ao consultar clientes: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

end.
