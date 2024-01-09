unit controller.produto.CreateRecord;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
  model.produto.doProcedure;

type
  TControllerProdutoCreateRecord = class(TControllerPrincipal)
    private

    public
      procedure createRecord(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerProdutoCreateRecord }

procedure TControllerProdutoCreateRecord.createRecord(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  prod: TModelProdutoDoProcedure;
  body: TJSONValue;
  erro: string;
begin
  try
    prod := TModelProdutoDoProcedure.Create;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    try
      body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(req.Body), 0) as TJsonValue;

      prod.NOMEESPECIAL := body.GetValue<string>('nomeespecial', '');
      prod.CODBARRA := body.GetValue<string>('codbarra', '');
      prod.COR := body.GetValue<string>('cor', '');
      prod.SITE := body.GetValue<string>('site', '');
      prod.INATIVO := body.GetValue<string>('inativo', '');
      prod.LOCALIZACAO := body.GetValue<string>('localizacao', '');
      prod.OPR := body.GetValue<string>('opr', '');
      prod.INVENTARIO := body.GetValue<string>('inventario', '');
      prod.IMGPROD := body.GetValue<string>('imgprod', '');
      prod.SERV := body.GetValue<string>('serv', '');
      prod.REFERENCIA := body.GetValue<string>('referencia', '');
      prod.NOME := body.GetValue<string>('nome', '');
      prod.PRODACABADO := body.GetValue<string>('prodacabado', '');
      prod.TAMANHO := body.GetValue<string>('tamanho', '');

      prod.PESOBRUTO := body.GetValue<Real>('pesobruto', 0);
      prod.PRECOMINIMO := body.GetValue<Real>('precominimo', 0);
      prod.MARGEMLUCRO := body.GetValue<Real>('margemlucro', 0);
      prod.PRECOVENDA := body.GetValue<Real>('precovenda', 0);
      prod.ESTOQUE := body.GetValue<Real>('estoque', 0);
      prod.CONSIGNADO := body.GetValue<Real>('consignado', 0);
      prod.PERCQUEBRA := body.GetValue<Real>('percquebra', 0);
      prod.PESOLIQUIDO := body.GetValue<Real>('pesoliquido', 0);
      prod.ESTMINIMO := body.GetValue<Real>('estminimo', 0);
      prod.DESCMAX := body.GetValue<Real>('descmax', 0);
      prod.CUSTO := body.GetValue<Real>('custo', 0);

      prod.EMPRESAID := body.GetValue<Integer>('empresaid', 1);
      prod.UNIDADEID := body.GetValue<Integer>('unidadeid', 1);
      prod.ESTMINIMOPRAZO := body.GetValue<Integer>('estminimoprazo', 0);
      prod.MARCAID := body.GetValue<Integer>('marcaid', 1);
      prod.GRUPOID := body.GetValue<Integer>('grupoid', 1);
      prod.NCM := body.GetValue<Integer>('ncm', 0);

      prod.doProcedure('I', 'criar' ,erro);

      if erro <> '' then
        raise Exception.Create(erro);

    except on ex:exception do
      begin
        res.Send(ex.Message).Status(400);
        exit;
      end;
    end;
  finally
    prod.Free;
  end;
end;

end.
