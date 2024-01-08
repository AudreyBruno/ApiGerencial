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
  cli : TModelClienteDoProcedure;
  body : TJSONValue;
  erro : string;
  objCliente : TJSONObject;
begin
  try
    cli := TModelClienteDoProcedure.Create;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    try
      cli.ID := Req.Params['id'].ToInteger;

      cli.EMPRESAID := body.GetValue<Integer>('empresaid', 1);

      if NOT cli.doProcedure('E', 'deletar', erro) then
        raise Exception.Create(erro);

    except on ex:exception do
      begin
        res.Send(ex.Message).Status(400);
        exit;
      end;
    end;

    objCliente := TJSONObject.Create;
    objCliente.AddPair('id', cli.ID.ToString);

    res.Send<TJSONObject>(objCliente);
  finally
    cli.Free;
  end;
end;

end.
