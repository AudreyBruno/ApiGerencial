unit model.produto.doProcedure;

interface

uses
  System.JSON, DataSet.Serialize, FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelProdutoDoProcedure = class(TModelPrincipal)
    private
    FID_PRODUTO: Integer;

    public
      function doProcedure(lcOpr: string; body: TJsonObject): TJsonObject;
      function Gerador: Integer; override;

      property ID_PRODUTO : Integer read FID_PRODUTO write FID_PRODUTO;
  end;

implementation

{ TModelProdutoDoProcedure }

function TModelProdutoDoProcedure.doProcedure(lcOpr: string; body: TJsonObject): TJsonObject;
var
  qry : TFDQuery;
begin
  try
    if lcOpr = 'I' then
      ID_PRODUTO := Gerador;

    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;

    try
      model.connection.FConnection.StartTransaction;

      qry.Active := false;
      qry.SQL.Clear;
      qry.SQL.Add('EXECUTE PROCEDURE SP_PRODUTO(:POPR, :PEMPRESAID, :PID, :PGRUPOID, :PUNIDADEID, :PMARCAID,' +
      ' :PINATIVO, :PNOME, :PREFERENCIA, :PLOCALIZACAO, :PNOMEESPECIAL, :PESTOQUE, :PESTMINIMO, :PESTMINIMOPRAZO,' +
      ' :PCONSIGNADO, :PCUSTO, :PPRECOVENDA, :PPRECOMINIMO, :PMARGEMLUCRO, :PDESCMAX, :PNCM, :PINVENTARIO,' +
      ' :PPESOLIQUIDO, :PPESOBRUTO, :PCODBARRA, :PPRODACABADO, :PSERV, :PIMGPROD, :PSITE, :PPERCQUEBRA, :PTAMANHO,' +
      ' :PCOR)');
      qry.ParamByName('POPR').AsString := lcOpr;
      qry.ParamByName('PEMPRESAID').AsInteger := body.GetValue<Integer>('empresaid', 1);
      qry.ParamByName('PID').AsInteger := ID_PRODUTO;
      qry.ParamByName('PGRUPOID').AsInteger := body.GetValue<Integer>('grupoid', 1);
      qry.ParamByName('PUNIDADEID').AsInteger := body.GetValue<Integer>('unidadeid', 1);
      qry.ParamByName('PMARCAID').AsInteger := body.GetValue<Integer>('marcaid', 1);
      qry.ParamByName('PINATIVO').AsString := body.GetValue<string>('inativo', '');
      qry.ParamByName('PNOME').AsString := body.GetValue<string>('nome', '');
      qry.ParamByName('PREFERENCIA').AsString := body.GetValue<string>('referencia', '');
      qry.ParamByName('PLOCALIZACAO').AsString := body.GetValue<string>('localizacao', '');
      qry.ParamByName('PNOMEESPECIAL').AsString := body.GetValue<string>('nomeespecial', '');
      qry.ParamByName('PESTOQUE').AsFloat := body.GetValue<Real>('estoque', 0);
      qry.ParamByName('PESTMINIMO').AsFloat := body.GetValue<Real>('estminimo', 0);
      qry.ParamByName('PESTMINIMOPRAZO').AsInteger := body.GetValue<Integer>('estminimoprazo', 0);
      qry.ParamByName('PCONSIGNADO').AsFloat := body.GetValue<Real>('consignado', 0);
      qry.ParamByName('PCUSTO').AsFloat := body.GetValue<Real>('custo', 0);
      qry.ParamByName('PPRECOVENDA').AsFloat := body.GetValue<Real>('precovenda', 0);
      qry.ParamByName('PPRECOMINIMO').AsFloat := body.GetValue<Real>('precominimo', 0);
      qry.ParamByName('PMARGEMLUCRO').AsFloat := body.GetValue<Real>('margemlucro', 0);
      qry.ParamByName('PDESCMAX').AsFloat := body.GetValue<Real>('descmax', 0);
      qry.ParamByName('PNCM').AsInteger := body.GetValue<Integer>('ncm', 0);
      qry.ParamByName('PINVENTARIO').AsString := body.GetValue<string>('inventario', '');
      qry.ParamByName('PPESOLIQUIDO').AsFloat := body.GetValue<Real>('pesoliquido', 0);
      qry.ParamByName('PPESOBRUTO').AsFloat := body.GetValue<Real>('pesobruto', 0);
      qry.ParamByName('PCODBARRA').AsString := body.GetValue<string>('codbarra', '');
      qry.ParamByName('PPRODACABADO').AsString := body.GetValue<string>('prodacabado', '');
      qry.ParamByName('PSERV').AsString := body.GetValue<string>('serv', '');
      qry.ParamByName('PIMGPROD').AsString := body.GetValue<string>('imgprod', '');
      qry.ParamByName('PSITE').AsString := body.GetValue<string>('site', '');
      qry.ParamByName('PPERCQUEBRA').AsFloat := body.GetValue<Real>('percquebra', 0);
      qry.ParamByName('PTAMANHO').AsString := body.GetValue<string>('tamanho', '');
      qry.ParamByName('PCOR').AsString := body.GetValue<string>('cor', '');
      qry.ExecSQL;

      model.connection.FConnection.Commit;
    except on ex:Exception do
      begin
        model.connection.FConnection.Rollback;
        raise Exception.Create(ex.Message);
      end;
    end;
  finally
    qry.Free;
  end;
end;

function TModelProdutoDoProcedure.Gerador: Integer;
begin
  result := inherited doGerador('GEN_PRODUTO_ID');
end;

end.
