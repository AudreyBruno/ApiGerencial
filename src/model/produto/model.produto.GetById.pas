unit model.produto.GetById;

interface

uses
  System.JSON, DataSet.Serialize, FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelProdutoGetById = class(TModelPrincipal)
    private
    FID_PRODUTO: Integer;

    public
      property ID_PRODUTO : Integer read FID_PRODUTO write FID_PRODUTO;

      function getById: TJSONObject;
  end;

implementation

{ TModelProdutoGetById }

function TModelProdutoGetById.getById: TJSONObject;
var
  qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := model.connection.FConnection;

    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM produto WHERE id = :ID');
    qry.ParamByName('ID').Value := ID_PRODUTO;
    qry.Active := true;

    Result := qry.ToJSONObject();
  finally
    qry.Free;
  end;
end;

end.
