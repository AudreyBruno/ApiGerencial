unit controller.cliente.GetAll;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, controller.principal,
  model.cliente.GetAll;

type
  TControllerClienteGetAll = class(TControllerPrincipal)
    private

    public
      procedure getAll(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TGetAll }

procedure TControllerClienteGetAll.getAll(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  cli: TModelClienteGetAll;
  arrayClientes: TJSONArray;

  order: string;
begin
  try
    try
      cli := TModelClienteGetAll.Create;

      order := Req.Query['order'];

      arrayClientes := cli.getAll(order);

      Res.Send(arrayClientes).Status(200);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    cli.Free;
  end;
end;

end.
