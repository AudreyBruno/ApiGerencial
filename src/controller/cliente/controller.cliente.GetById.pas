unit controller.cliente.GetById;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, controller.principal,
  model.cliente.GetById;

type
  TControllerClienteGetById = class(TControllerPrincipal)
    private

    public
      procedure getById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerGetById }

procedure TControllerClienteGetById.getById(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  cli: TModelClienteGetById;
  objCliente: TJSONObject;
begin
  try
    try
      cli := TModelClienteGetById.Create;
      cli.ID_CLIENTE := Req.Params['id'].ToInteger;

      objCliente := cli.getById;

      Res.Send(objCliente).Status(200);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    cli.Free;
  end;
end;

end.
