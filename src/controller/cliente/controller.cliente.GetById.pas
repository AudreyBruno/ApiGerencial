unit controller.cliente.GetById;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
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
  qry: TFDQuery;
  erro: string;
  objCliente: TJSONObject;
begin
  try
    cli := TModelClienteGetById.Create;
    cli.ID_CLIENTE := Req.Params['id'].ToInteger;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    qry := cli.getById(erro);

    if qry.RecordCount > 0 then
      begin
        objCliente := qry.ToJSONObject();
        res.Send<TJSONObject>(objCliente);
      end
    else
      Res.Send('Cliente não encontrado').Status(404);

  finally
    qry.Free;
    cli.Free;
  end;
end;

end.
