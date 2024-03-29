unit controller.produto.GetById;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, controller.principal,
  model.produto.GetById;

type
  TControllerProdutoGetById = class(TControllerPrincipal)
    private

    public
      procedure getById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerClienteGetById }

procedure TControllerProdutoGetById.getById(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  prod: TModelProdutoGetById;
  objProduto: TJSONObject;
begin
  try
    try
      prod := TModelProdutoGetById.Create;
      prod.ID_PRODUTO := Req.Params['id'].ToInteger;

      objProduto := prod.getById;

      Res.Send(objProduto).Status(200);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    prod.Free;
  end;
end;

end.
