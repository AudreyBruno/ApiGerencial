unit controller.venda.GetById;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, controller.principal,
  model.venda.GetById;

type
  TControllerVendaGetById = class(TControllerPrincipal)
    private

    public
      procedure getById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerVendaGetById }

procedure TControllerVendaGetById.getById(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  venda: TModelVendaGetById;
  objProduto: TJSONObject;
begin
  try
    try
      venda := TModelVendaGetById.Create;
      venda.ID_VENDA := Req.Params['id'].ToInteger;

      objProduto := venda.getById;

      Res.Send(objProduto).Status(200);
    except on ex:exception do
      Res.Send(ex.Message).Status(500);
    end;
  finally
    venda.Free;
  end;
end;

end.
