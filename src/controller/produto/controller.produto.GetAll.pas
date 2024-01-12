unit controller.produto.GetAll;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, controller.principal,
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
  arrayProdutos: TJSONArray;

  order: string;
begin
  try
    try
      prod := TModelProdutoGetAll.Create;

      order := Req.Query['order'];

      arrayProdutos := prod.getAll(order);

      Res.Send(arrayProdutos).Status(200);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    prod.Free;
  end;
end;

end.
