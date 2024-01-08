unit model.produto.GetAll;

interface

uses
  FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelProdutoGetAll = class(TModelPrincipal)
    private

    public
      function getAll(order_by: string; out erro: string): TFDQuery;
  end;

implementation

{ TModelProdutoGetAll }

function TModelProdutoGetAll.getAll(order_by: string;
  out erro: string): TFDQuery;
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
        SQL.Add('SELECT * FROM produto WHERE 1 = 1');

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
      erro := 'Erro ao consultar produtos: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

end.
