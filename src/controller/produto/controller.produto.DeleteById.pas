unit controller.produto.DeleteById;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
  model.produto.doProcedure;

type
  TControllerProdutoDeleteById = class(TControllerPrincipal)
    private

    public
      procedure deleteById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerProdutoDeleteById }

procedure TControllerProdutoDeleteById.deleteById(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  prod : TModelProdutoDoProcedure;
  body : TJSONValue;
  erro : string;
  objProduto : TJSONObject;
begin
  try
    prod := TModelProdutoDoProcedure.Create;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    try
      prod.ID := Req.Params['id'].ToInteger;

      prod.EMPRESAID := body.GetValue<Integer>('empresaid', 1);

      if NOT prod.doProcedure('E', 'deletar', erro) then
        raise Exception.Create(erro);

    except on ex:exception do
      begin
        res.Send(ex.Message).Status(400);
        exit;
      end;
    end;

    objProduto := TJSONObject.Create;
    objProduto.AddPair('id', prod.ID.ToString);

    res.Send<TJSONObject>(objProduto);
  finally
    prod.Free;
  end;
end;

end.

