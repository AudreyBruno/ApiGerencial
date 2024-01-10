unit controller.venda.GetAll;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
  model.venda.GetAll;

type
  TControllerVendaGetAll = class(TControllerPrincipal)
    private

    public
      procedure getAll(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerVendaGetAll }

procedure TControllerVendaGetAll.getAll(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  venda: TModelVendaGetAll;
  qry: TFDQuery;
  erro: string;
  arrayProdutos: TJSONArray;
begin
  try
    venda := TModelVendaGetAll.Create;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    qry := venda.getAll('', erro);

    arrayProdutos := qry.ToJSONArray();

    res.Send<TJSONArray>(arrayProdutos);

  finally
    qry.Free;
    venda.Free;
  end;
end;

end.
