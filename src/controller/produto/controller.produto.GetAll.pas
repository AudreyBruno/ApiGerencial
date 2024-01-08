unit controller.produto.GetAll;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
  model.produto.GetAll;

type
  TControllerProdutoGetAll = class(TControllerPrincipal)
    private

    public
      procedure getAll(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerProdutoGetAll }

procedure TControllerProdutoGetAll.getAll(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  prod: TModelProdutoGetAll;
  qry: TFDQuery;
  erro: string;
  arrayProdutos: TJSONArray;
begin
  try
    prod := TModelProdutoGetAll.Create;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    qry := prod.getAll('', erro);

    arrayProdutos := qry.ToJSONArray();

    res.Send<TJSONArray>(arrayProdutos);

  finally
    qry.Free;
    prod.Free;
  end;
end;

end.
