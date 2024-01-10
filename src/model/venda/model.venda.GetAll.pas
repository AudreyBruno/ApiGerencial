unit model.venda.GetAll;

interface

uses
  FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelVendaGetAll = class(TModelPrincipal)
    private

    public
      function getAll(order_by: string; out erro: string): TFDQuery;
  end;

implementation

{ TModelVendaGetAll }

function TModelVendaGetAll.getAll(order_by: string; out erro: string): TFDQuery;
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
        SQL.Add('SELECT * FROM VENDA WHERE 1 = 1');

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
      erro := 'Erro ao consultar vendas: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

end.
