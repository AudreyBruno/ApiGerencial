unit model.venda.GetById;

interface

uses
  System.JSON, DataSet.Serialize, FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelVendaGetById = class(TModelPrincipal)
    private
    FID_VENDA: Integer;

    public
      property ID_VENDA : Integer read FID_VENDA write FID_VENDA;

      function getById: TJSONObject;
  end;

implementation

{ TModelVendaGetById }

function TModelVendaGetById.getById: TJSONObject;
var
  qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := model.connection.FConnection;

    qry.Active := false;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM venda WHERE id = :ID');
    qry.ParamByName('ID').Value := ID_VENDA;
    qry.Active := true;

    Result := qry.ToJSONObject();

    if qry.RecordCount > 0 then
      begin
        qry.Active := false;
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM vendaitem WHERE vendaid = :ID');
        qry.ParamByName('ID').Value := ID_VENDA;
        qry.Active := true;
      end;

    Result.AddPair('itens', qry.ToJSONArray);
  finally
    qry.Free;
  end;
end;

end.
