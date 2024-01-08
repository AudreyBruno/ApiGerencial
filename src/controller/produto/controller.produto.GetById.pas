unit controller.produto.GetById;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
  model.produto.GetById;

type
  TControllerProdutoGetById = class(TControllerPrincipal)
    private

    public
      procedure getById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerClienteGetById }

procedure TControllerProdutoGetById.getById(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  prod: TModelProdutoGetById;
  qry: TFDQuery;
  erro: string;
  objProduto: TJSONObject;
begin
  try
    prod := TModelProdutoGetById.Create;
    prod.ID_PRODUTO := Req.Params['id'].ToInteger;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    qry := prod.getById(erro);

    if qry.RecordCount > 0 then
      begin
        objProduto := qry.ToJSONObject();
        res.Send<TJSONObject>(objProduto);
      end
    else
      Res.Send('Produto não encontrado').Status(404);

  finally
    qry.Free;
    prod.Free;
  end;
end;

end.
