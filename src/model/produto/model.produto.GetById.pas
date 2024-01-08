unit model.produto.GetById;

interface

uses
  FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelProdutoGetById = class(TModelPrincipal)
    private
    FID_PRODUTO: Integer;

    public
      property ID_PRODUTO : Integer read FID_PRODUTO write FID_PRODUTO;

      function getById(out erro: string): TFDQuery;
  end;

implementation

{ TModelProdutoGetById }

function TModelProdutoGetById.getById(out erro: string): TFDQuery;
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
        SQL.Add('SELECT * FROM produto WHERE id = :ID');
        ParamByName('ID').Value := ID_PRODUTO;
        Active := true;
      end;

    erro := '';
    Result := qry;
  except on ex:exception do
    begin
      erro := 'Erro ao consultar produto: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

end.
