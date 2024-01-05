unit controller.cliente.GetAll;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
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
  qry: TFDQuery;
  erro: string;
  arrayClientes: TJSONArray;
begin
  try
    cli := TModelClienteGetAll.Create;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    qry := cli.getAll('', erro);

    arrayClientes := qry.ToJSONArray();

    res.Send<TJSONArray>(arrayClientes);

  finally
    qry.Free;
    cli.Free;
  end;
end;

end.
