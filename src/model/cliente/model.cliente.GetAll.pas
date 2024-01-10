unit model.cliente.GetAll;

interface

uses
  System.JSON, DataSet.Serialize, FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelClienteGetAll = class(TModelPrincipal)
    private

    public
      function getAll(order_by: string): TJsonArray;
  end;

implementation

{ TGetAll }

function TModelClienteGetAll.getAll(order_by: string): TJsonArray;
var
  qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := model.connection.FConnection;

    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT c.id, c.nome, c.fantasia, ci.nome, ci.uf, c.endereco, c.bairro, c.numero, c.complemento,' +
    ' c.cep, c.celular, c.telefone, c.tipopessoa, c.cpf, c.cnpj, c.inscestadual, c.rg FROM cliente c');
    qry.SQL.Add('INNER JOIN cidade ci ON c.cidadeid = ci.id');
    qry.SQL.Add('WHERE 1 = 1');

    if order_by = '' then
      qry.SQL.Add('ORDER BY c.ID')
    else
      qry.SQL.Add('ORDER BY c.' + order_by);

    qry.Active := true;

    Result := qry.ToJSONArray();
  finally
    qry.Free;
  end;
end;

end.
