unit model.cliente.GetById;

interface

uses
  System.JSON, DataSet.Serialize, FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelClienteGetById = class(TModelPrincipal)
    private
    FID_CLIENTE: Integer;

    public
      property ID_CLIENTE : Integer read FID_CLIENTE write FID_CLIENTE;

      function getById: TJSONObject;
  end;

implementation

{ TModelGetAll }

function TModelClienteGetById.getById: TJSONObject;
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
    qry.SQL.Add('WHERE c.id = :ID');
    qry.ParamByName('ID').Value := ID_CLIENTE;
    qry.Active := true;

    Result := qry.ToJSONObject();
  finally
    qry.Free;
  end;
end;

end.
