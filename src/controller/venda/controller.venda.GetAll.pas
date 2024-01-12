unit controller.venda.GetAll;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, controller.principal,
  model.venda.GetAll;

type
  TControllerVendaGetAll = class(TControllerPrincipal)
    private

    public
      procedure getAll(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerVendaGetAll }

procedure TControllerVendaGetAll.getAll(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  venda: TModelVendaGetAll;
  arrayVendas: TJSONArray;

  order: string;
begin
  try
    try
      venda := TModelVendaGetAll.Create;

      order := Req.Query['order'];

      arrayVendas := venda.getAll(order);

      Res.Send(arrayVendas).Status(200);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    venda.Free;
  end;
end;

end.
