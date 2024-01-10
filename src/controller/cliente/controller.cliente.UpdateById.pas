unit controller.cliente.UpdateById;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
  model.cliente.doProcedure;

type
  TControllerClienteUpdateById = class(TControllerPrincipal)
    private

    public
      procedure updateById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerClienteUpdateById }

procedure TControllerClienteUpdateById.updateById(Req: THorseRequest;
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

      Res.Send(cli.doProcedure('A', body)).Status(200);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    cli.Free;
  end;
end;

end.
