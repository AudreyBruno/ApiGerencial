unit controller.produto.UpdateById;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, controller.principal,
  model.produto.doProcedure;

type
  TControllerProdutoUpdateById = class(TControllerPrincipal)
    private

    public
      procedure updateById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerProdutoUpdateById }

procedure TControllerProdutoUpdateById.updateById(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  prod: TModelProdutoDoProcedure;
  body: TJSONObject;
begin
  try
    try
      prod := TModelProdutoDoProcedure.Create;
      prod.ID_PRODUTO := Req.Params['id'].ToInteger;

      body := Req.Body<TJSONObject>;

      Res.Send(prod.doProcedure('A', body)).Status(200);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    prod.Free;
  end;
end;

end.
