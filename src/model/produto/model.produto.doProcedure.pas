unit model.produto.doProcedure;

interface

uses
  FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelProdutoDoProcedure = class(TModelPrincipal)
    private
    FNOMEESPECIAL: string;
    FCODBARRA: string;
    FCOR: string;
    FSITE: string;
    FINATIVO: string;
    FLOCALIZACAO: string;
    FOPR: string;
    FINVENTARIO: string;
    FIMGPROD: string;
    FSERV: string;
    FREFERENCIA: string;
    FNOME: string;
    FPRODACABADO: string;
    FTAMANHO: string;
    FPESOBRUTO: Real;
    FPRECOMINIMO: Real;
    FMARGEMLUCRO: Real;
    FPRECOVENDA: Real;
    FESTOQUE: Real;
    FCONSIGNADO: Real;
    FPERCQUEBRA: Real;
    FPESOLIQUIDO: Real;
    FESTMINIMO: Real;
    FDESCMAX: Real;
    FCUSTO: Real;
    FEMPRESAID: Integer;
    FUNIDADEID: Integer;
    FESTMINIMOPRAZO: Integer;
    FMARCAID: Integer;
    FGRUPOID: Integer;
    FID: Integer;
    FNCM: Integer;

    public
      function doProcedure(lcOpr, Opr: string; out erro: string): Boolean;
      function Gerador: Integer; override;

      property OPR: string read FOPR write FOPR;
      property NOME: string read FNOME write FNOME;
      property REFERENCIA: string read FREFERENCIA write FREFERENCIA;
      property LOCALIZACAO: string read FLOCALIZACAO write FLOCALIZACAO;
      property NOMEESPECIAL: string read FNOMEESPECIAL write FNOMEESPECIAL;
      property CODBARRA: string read FCODBARRA write FCODBARRA;
      property IMGPROD: string read FIMGPROD write FIMGPROD;
      property TAMANHO: string read FTAMANHO write FTAMANHO;
      property COR: string read FCOR write FCOR;
      property INATIVO: string read FINATIVO write FINATIVO;
      property INVENTARIO: string read FINVENTARIO write FINVENTARIO;
      property PRODACABADO: string read FPRODACABADO write FPRODACABADO;
      property SERV: string read FSERV write FSERV;
      property SITE: string read FSITE write FSITE;

      property ESTOQUE: Real read FESTOQUE write FESTOQUE;
      property ESTMINIMO: Real read FESTMINIMO write FESTMINIMO;
      property CONSIGNADO: Real read FCONSIGNADO write FCONSIGNADO;
      property CUSTO: Real read FCUSTO write FCUSTO;
      property PRECOVENDA: Real read FPRECOVENDA write FPRECOVENDA;
      property PRECOMINIMO: Real read FPRECOMINIMO write FPRECOMINIMO;
      property MARGEMLUCRO: Real read FMARGEMLUCRO write FMARGEMLUCRO;
      property DESCMAX: Real read FDESCMAX write FDESCMAX;
      property PESOLIQUIDO: Real read FPESOLIQUIDO write FPESOLIQUIDO;
      property PESOBRUTO: Real read FPESOBRUTO write FPESOBRUTO;
      property PERCQUEBRA: Real read FPERCQUEBRA write FPERCQUEBRA;

      property EMPRESAID: Integer read FEMPRESAID write FEMPRESAID;
      property ID: Integer read FID write FID;
      property GRUPOID: Integer read FGRUPOID write FGRUPOID;
      property UNIDADEID: Integer read FUNIDADEID write FUNIDADEID;
      property MARCAID: Integer read FMARCAID write FMARCAID;
      property ESTMINIMOPRAZO: Integer read FESTMINIMOPRAZO write FESTMINIMOPRAZO;
      property NCM: Integer read FNCM write FNCM;
  end;

implementation

{ TModelProdutoDoProcedure }

function TModelProdutoDoProcedure.doProcedure(lcOpr, Opr: string;
  out erro: string): Boolean;
var
  qry : TFDQuery;
begin
  try
    if lcOpr = 'I' then
      ID := Gerador;

    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;

    with qry do
      begin
        Active := false;
        SQL.Clear;
        SQL.Add('EXECUTE PROCEDURE SP_PRODUTO(:POPR, :PEMPRESAID, :PID, :PGRUPOID, :PUNIDADEID, :PMARCAID,' +
        ' :PINATIVO, :PNOME, :PREFERENCIA, :PLOCALIZACAO, :PNOMEESPECIAL, :PESTOQUE, :PESTMINIMO, :PESTMINIMOPRAZO,' +
        ' :PCONSIGNADO, :PCUSTO, :PPRECOVENDA, :PPRECOMINIMO, :PMARGEMLUCRO, :PDESCMAX, :PNCM, :PINVENTARIO,' +
        ' :PPESOLIQUIDO, :PPESOBRUTO, :PCODBARRA, :PPRODACABADO, :PSERV, :PIMGPROD, :PSITE, :PPERCQUEBRA, :PTAMANHO,' +
        ' :PCOR)');
        ParamByName('POPR').AsString := lcOpr;
        ParamByName('PEMPRESAID').AsInteger := EMPRESAID;
        ParamByName('PID').AsInteger := ID;
        ParamByName('PGRUPOID').AsInteger := GRUPOID;
        ParamByName('PUNIDADEID').AsInteger := UNIDADEID;
        ParamByName('PMARCAID').AsInteger := MARCAID;
        ParamByName('PINATIVO').AsString := INATIVO;
        ParamByName('PNOME').AsString := NOME;
        ParamByName('PREFERENCIA').AsString := REFERENCIA;
        ParamByName('PLOCALIZACAO').AsString := LOCALIZACAO;
        ParamByName('PNOMEESPECIAL').AsString := NOMEESPECIAL;
        ParamByName('PESTOQUE').AsFloat := ESTOQUE;
        ParamByName('PESTMINIMO').AsFloat := ESTMINIMO;
        ParamByName('PESTMINIMOPRAZO').AsInteger := ESTMINIMOPRAZO;
        ParamByName('PCONSIGNADO').AsFloat := CONSIGNADO;
        ParamByName('PCUSTO').AsFloat := CUSTO;
        ParamByName('PPRECOVENDA').AsFloat := PRECOVENDA;
        ParamByName('PPRECOMINIMO').AsFloat := PRECOMINIMO;
        ParamByName('PMARGEMLUCRO').AsFloat := MARGEMLUCRO;
        ParamByName('PDESCMAX').AsFloat := DESCMAX;
        ParamByName('PNCM').AsInteger := NCM;
        ParamByName('PINVENTARIO').AsString := INVENTARIO;
        ParamByName('PPESOLIQUIDO').AsFloat := PESOLIQUIDO;
        ParamByName('PPESOBRUTO').AsFloat := PESOBRUTO;
        ParamByName('PCODBARRA').AsString := CODBARRA;
        ParamByName('PPRODACABADO').AsString := PRODACABADO;
        ParamByName('PSERV').AsString := SERV;
        ParamByName('PIMGPROD').AsString := IMGPROD;
        ParamByName('PSITE').AsString := SITE;
        ParamByName('PPERCQUEBRA').AsFloat := PERCQUEBRA;
        ParamByName('PTAMANHO').AsString := TAMANHO;
        ParamByName('PCOR').AsString := COR;

        ExecSQL;
      end;

    erro := '';
    Result := true;
  except on ex:exception do
    begin
      erro := 'Erro ao ' + Opr + ' produto: ' + ex.Message;
      Result := false;
    end;
  end;
end;

function TModelProdutoDoProcedure.Gerador: Integer;
begin
  result := inherited doGerador('GEN_PRODUTO_ID');
end;

end.
