unit model.principal;

interface

uses
  FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection;

type
  TModelPrincipal = class
    private

    public
      constructor Create;
      destructor Destroy;

      function doGerador(lcGerador: String): Integer; virtual;
      function Gerador: Integer; virtual; abstract;
  end;

implementation

{ TPrincipal }

constructor TModelPrincipal.Create;
begin
  model.connection.Connect;
end;

destructor TModelPrincipal.Destroy;
begin
  model.connection.Disconect;
end;

function TModelPrincipal.doGerador(lcGerador: String): Integer;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);

    qry.Active := False;
    qry.Connection := Model.Connection.FConnection;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM SP_GET_GERADOR('+ QuotedStr(lcGerador) +')');
    qry.Active := True;

    result := qry.Fields[0].asInteger;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

end.
