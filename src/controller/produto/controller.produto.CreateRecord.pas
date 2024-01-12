unit controller.produto.CreateRecord;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, controller.principal,
  model.produto.doProcedure;

type
  TControllerProdutoCreateRecord = class(TControllerPrincipal)
    private

    public
      procedure createRecord(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerProdutoCreateRecord }

procedure TControllerProdutoCreateRecord.createRecord(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  prod: TModelProdutoDoProcedure;
  body: TJSONObject;
begin
  try
    try
      prod := TModelProdutoDoProcedure.Create;

      body := Req.Body<TJSONObject>;

      Res.Send(prod.doProcedure('I', body)).Status(201);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    prod.Free;
  end;
end;

end.
