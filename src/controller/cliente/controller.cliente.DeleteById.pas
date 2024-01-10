unit controller.cliente.DeleteById;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
  model.cliente.doProcedure;

type
  TControllerClienteDeleteById = class(TControllerPrincipal)
    private

    public
      procedure deleteById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerClienteDeleteById }

procedure TControllerClienteDeleteById.deleteById(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  cli: TModelClienteDoProcedure;
  body: TJSONObject;
begin
  try
    try
      cli := TModelClienteDoProcedure.Create;
      cli.ID_CLIENTE := Req.Params['id'].ToInteger;

      body := Req.Body<TJSONObject>;

      Res.Send(cli.doProcedure('E', body)).Status(200);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    cli.Free;
  end;
end;

end.
