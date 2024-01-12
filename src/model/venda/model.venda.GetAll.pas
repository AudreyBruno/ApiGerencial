unit model.venda.GetAll;

interface

uses
  System.JSON, DataSet.Serialize, FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelVendaGetAll = class(TModelPrincipal)
    private

    public
      function getAll(order_by: string): TJsonArray;
  end;

implementation

{ TModelVendaGetAll }

function TModelVendaGetAll.getAll(order_by: string): TJsonArray;
var
  qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := model.connection.FConnection;

    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM venda WHERE 1 = 1');

    if order_by = '' then
      qry.SQL.Add('ORDER BY ID')
    else
      qry.SQL.Add('ORDER BY ' + order_by);

    qry.Active := true;

    Result := qry.ToJSONArray();
  finally
    qry.Free;
  end;
end;

end.
