unit controller.cliente.CreateRecord;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
  model.cliente.doProcedure;

type
  TControllerClienteCreateRecord = class(TControllerPrincipal)
    private

    public
      procedure createRecord(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerClienteCreateRecord }

procedure TControllerClienteCreateRecord.createRecord(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  cli: TModelClienteDoProcedure;
  body: TJSONObject;
begin
  try
    try
      cli := TModelClienteDoProcedure.Create;

      body := Req.Body<TJSONObject>;

      Res.Send(cli.doProcedure('I', body)).Status(201);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    cli.Free;
  end;
end;

end.
