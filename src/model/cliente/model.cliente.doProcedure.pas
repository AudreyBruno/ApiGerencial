unit model.cliente.doProcedure;

interface

uses
  System.JSON, DataSet.Serialize, FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelClienteDoProcedure = class(TModelPrincipal)
    private
    FID_CLIENTE: Integer;

    public
      function doProcedure(lcOpr: string; body: TJsonObject): TJsonObject;
      function Gerador: Integer; override;

      property ID_CLIENTE : Integer read FID_CLIENTE write FID_CLIENTE;
  end;

implementation

{ TModelClienteCreateRecord }

function TModelClienteDoProcedure.Gerador: Integer;
begin
  result := inherited doGerador('GEN_CLIENTE_ID');
end;

function TModelClienteDoProcedure.doProcedure(lcOpr: string; body: TJsonObject): TJsonObject;
var
  qry : TFDQuery;
  REPRESENTANTEID, RAMOID: string;
begin
  try
    if lcOpr = 'I' then
      ID_CLIENTE := Gerador;

    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;

    try
      model.connection.FConnection.StartTransaction;

      qry.Active := false;
      qry.SQL.Clear;
      qry.SQL.Add('EXECUTE PROCEDURE SP_CLIENTE(:POPR, :PEMPRESAID, :PID, :PCIDADEID, :PREPRESENTANTEID,' +
      ' :PRAMOID, :PNOME, :PFANTASIA, :PINATIVO, :PTIPOPESSOA, :PESTADOCIVIL, :PDCTOOUTROS,' +
      ' :PTEMPORESIDENCIA, :PENDERECO, :PNUMERO, :PBAIRRO, :PCOMPLEMENTO, :PCEP, :PTELEFONE, :PCELULAR,' +
      ' :PFAX, :PLIMITECREDITO, :PDESCONTOMAX, :PREFCOMERCIAIS, :PCNPJ, :PINSCESTADUAL, :PINSCMUNICIPAL,' +
      ' :PDATAFUNDACAO, :PCONTATO, :PCPF, :PRG, :PSEXO, :PREFBANCARIAS, :PCASA, :PALUGUEL, :PPAINOME, :PPAIRG,' +
      ' :PPAICPF, :PPAIOBS, :PMAENOME, :PMAERG, :PMAECPF, :PMAEOBS, :PTRABEMPRESA, :PTRABTELEFONE, :PTRABCARGO,' +
      ' :PTRABADMISSAO, :PTRABSALARIO, :PTRABEND, :PTRABNUMERO, :PTRABCEP, :PTRABCIDADE, :PTRABBAIRRO, :PTRABUF,' +
      ' :PDATANASCIMENTO, :PNATURALCIDADE, :PDATACADASTRO, :PAUTORIZADONOME, :PCONJNOME, :PCONJNASC, :PCONJCPF,' +
      ' :PCONJRG, :PCONJEMPRESA, :PCONJFONE, :PCONJCARGO, :PCONJADMISSAO, :PCONJRENDA, :PCONJEND, :PCONJNUMERO,' +
      ' :PCONJBAIRRO, :PCONJCIDADE, :PCONJNATURAL, :PCONJPAI, :PCONJMAE, :PEMAIL, :PBANCO, :PAGENCIA,' +
      ' :PCTACORRENTE, :PNCARTAO, :PBANDCARTAO, :PSOCNOME, :PSOCIOEND, :PSOCIOFONE, :PSOCIOEMAIL, :PSOCIORG,' +
      ' :PSOCIOCPF, :PSOCIODTNASC, :PAVALISTA, :PAVALCPF, :PAVALRG, :PV_PRAZO, :PSPCSERASA)');
      qry.ParamByName('POPR').AsString := lcOpr;
      qry.ParamByName('PEMPRESAID').AsInteger := body.GetValue<Integer>('empresaid', 1);
      qry.ParamByName('PID').AsInteger := ID_CLIENTE;
      qry.ParamByName('PCIDADEID').AsInteger := body.GetValue<Integer>('cidadeid', 0);
      qry.ParamByName('PREPRESENTANTEID').AsInteger := body.GetValue<Integer>('representanteid', 0);
      qry.ParamByName('PRAMOID').AsInteger := body.GetValue<Integer>('ramoid', 0);
      qry.ParamByName('PNOME').AsString := body.GetValue<string>('nome', '');
      qry.ParamByName('PFANTASIA').AsString := body.GetValue<string>('fantasia', '');
      qry.ParamByName('PINATIVO').AsString := body.GetValue<string>('inativo', '');
      qry.ParamByName('PTIPOPESSOA').AsString := body.GetValue<string>('tipopessoa', '');
      qry.ParamByName('PESTADOCIVIL').AsString := body.GetValue<string>('estadocivil', '');
      qry.ParamByName('PDCTOOUTROS').AsString := body.GetValue<string>('dctooutros', '');
      qry.ParamByName('PTEMPORESIDENCIA').AsString := body.GetValue<string>('temporesidencia', '');
      qry.ParamByName('PENDERECO').AsString := body.GetValue<string>('endereco', '');
      qry.ParamByName('PNUMERO').AsString := body.GetValue<string>('numero', '');
      qry.ParamByName('PBAIRRO').AsString := body.GetValue<string>('bairro', '');
      qry.ParamByName('PCOMPLEMENTO').AsString := body.GetValue<string>('complemento', '');
      qry.ParamByName('PCEP').AsString := body.GetValue<string>('cep', '');
      qry.ParamByName('PTELEFONE').AsString := body.GetValue<string>('telefone', '');
      qry.ParamByName('PCELULAR').AsString := body.GetValue<string>('celular', '');
      qry.ParamByName('PFAX').AsString := body.GetValue<string>('fax', '');
      qry.ParamByName('PLIMITECREDITO').AsFloat := body.GetValue<Real>('limitecredito', 0);
      qry.ParamByName('PDESCONTOMAX').AsFloat := body.GetValue<Real>('descontomax', 0);
      qry.ParamByName('PREFCOMERCIAIS').AsString := body.GetValue<string>('refcomerciais', '');
      qry.ParamByName('PCNPJ').AsString := body.GetValue<string>('cnpj', '');
      qry.ParamByName('PINSCESTADUAL').AsString := body.GetValue<string>('inscestadual', '');
      qry.ParamByName('PINSCMUNICIPAL').AsString := body.GetValue<string>('inscmunicipal', '');
      qry.ParamByName('PDATAFUNDACAO').AsDateTime := body.GetValue<TDateTime>('datafundacao', StrToDate('30/12/1899'));
      qry.ParamByName('PCONTATO').AsString := body.GetValue<string>('contato', '');
      qry.ParamByName('PCPF').AsString := body.GetValue<string>('cpf', '');
      qry.ParamByName('PRG').AsString := body.GetValue<string>('rg', '');
      qry.ParamByName('PSEXO').AsString := body.GetValue<string>('sexo', '');
      qry.ParamByName('PREFBANCARIAS').AsString := body.GetValue<string>('refbancarias', '');
      qry.ParamByName('PCASA').AsString := body.GetValue<string>('casa', '');
      qry.ParamByName('PALUGUEL').AsFloat := body.GetValue<Real>('aluguel', 0);
      qry.ParamByName('PPAINOME').AsString := body.GetValue<string>('painome', '');
      qry.ParamByName('PPAIRG').AsString := body.GetValue<string>('pairg', '');
      qry.ParamByName('PPAICPF').AsString := body.GetValue<string>('paicpf', '');
      qry.ParamByName('PPAIOBS').AsString := body.GetValue<string>('paiobs', '');
      qry.ParamByName('PMAENOME').AsString := body.GetValue<string>('maenome', '');
      qry.ParamByName('PMAERG').AsString := body.GetValue<string>('maerg', '');
      qry.ParamByName('PMAECPF').AsString := body.GetValue<string>('maecpf', '');
      qry.ParamByName('PMAEOBS').AsString := body.GetValue<string>('maeobs', '');
      qry.ParamByName('PTRABEMPRESA').AsString := body.GetValue<string>('trabempresa', '');
      qry.ParamByName('PTRABTELEFONE').AsString := body.GetValue<string>('trabtelefone', '');
      qry.ParamByName('PTRABCARGO').AsString := body.GetValue<string>('trabcargo', '');
      qry.ParamByName('PTRABADMISSAO').AsDateTime := body.GetValue<TDateTime>('trabadmissao', StrToDate('30/12/1899'));
      qry.ParamByName('PTRABSALARIO').AsFloat := body.GetValue<Real>('trabsalario', 0);
      qry.ParamByName('PTRABEND').AsString := body.GetValue<string>('trabend', '');
      qry.ParamByName('PTRABNUMERO').AsString := body.GetValue<string>('trabnumero', '');
      qry.ParamByName('PTRABCEP').AsString := body.GetValue<string>('trabcep', '');
      qry.ParamByName('PTRABCIDADE').AsString := body.GetValue<string>('trabcidade', '');
      qry.ParamByName('PTRABBAIRRO').AsString := body.GetValue<string>('trabbairro', '');
      qry.ParamByName('PTRABUF').AsString := body.GetValue<string>('trabuf', '');
      qry.ParamByName('PDATANASCIMENTO').AsDateTime := body.GetValue<TDateTime>('datanascimento', StrToDate('30/12/1899'));
      qry.ParamByName('PNATURALCIDADE').AsString := body.GetValue<string>('naturalcidade', '');
      qry.ParamByName('PDATACADASTRO').AsDateTime := body.GetValue<TDateTime>('datacadastro', StrToDate('30/12/1899'));
      qry.ParamByName('PAUTORIZADONOME').AsString := body.GetValue<string>('autorizadonome', '');
      qry.ParamByName('PCONJNOME').AsString := body.GetValue<string>('conjnome', '');
      qry.ParamByName('PCONJNASC').AsDateTime := body.GetValue<TDateTime>('conjnasc', StrToDate('30/12/1899'));
      qry.ParamByName('PCONJCPF').AsString := body.GetValue<string>('conjcpf', '');
      qry.ParamByName('PCONJRG').AsString := body.GetValue<string>('conjrg', '');
      qry.ParamByName('PCONJEMPRESA').AsString := body.GetValue<string>('conjempresa', '');
      qry.ParamByName('PCONJFONE').AsString := body.GetValue<string>('conjfone', '');
      qry.ParamByName('PCONJCARGO').AsString := body.GetValue<string>('conjcargo', '');
      qry.ParamByName('PCONJADMISSAO').AsDateTime := body.GetValue<TDateTime>('conjadmissao', StrToDate('30/12/1899'));
      qry.ParamByName('PCONJRENDA').AsFloat := body.GetValue<Real>('conjrenda', 0);
      qry.ParamByName('PCONJEND').AsString := body.GetValue<string>('conjend', '');
      qry.ParamByName('PCONJNUMERO').AsString := body.GetValue<string>('conjnumero', '');
      qry.ParamByName('PCONJBAIRRO').AsString := body.GetValue<string>('conjbairro', '');
      qry.ParamByName('PCONJCIDADE').AsString := body.GetValue<string>('conjcidade', '');
      qry.ParamByName('PCONJNATURAL').AsString := body.GetValue<string>('conjnatural', '');
      qry.ParamByName('PCONJPAI').AsString := body.GetValue<string>('conjpai', '');
      qry.ParamByName('PCONJMAE').AsString := body.GetValue<string>('conjmae', '');
      qry.ParamByName('PEMAIL').AsString := body.GetValue<string>('email', '');
      qry.ParamByName('PBANCO').AsString := body.GetValue<string>('banco', '');
      qry.ParamByName('PAGENCIA').AsString := body.GetValue<string>('agencia', '');
      qry.ParamByName('PCTACORRENTE').AsString := body.GetValue<string>('ctacorrente', '');
      qry.ParamByName('PNCARTAO').AsInteger := body.GetValue<Integer>('ncartao', 0);
      qry.ParamByName('PBANDCARTAO').AsString := body.GetValue<string>('bandcartao', '');
      qry.ParamByName('PSOCNOME').AsString := body.GetValue<string>('socnome', '');
      qry.ParamByName('PSOCIOEND').AsString := body.GetValue<string>('socioend', '');
      qry.ParamByName('PSOCIOFONE').AsString := body.GetValue<string>('sociofone', '');
      qry.ParamByName('PSOCIOEMAIL').AsString := body.GetValue<string>('socioemail', '');
      qry.ParamByName('PSOCIORG').AsString := body.GetValue<string>('sociorg', '');
      qry.ParamByName('PSOCIOCPF').AsString := body.GetValue<string>('sociocpf', '');
      qry.ParamByName('PSOCIODTNASC').AsDateTime := body.GetValue<TDateTime>('sociodtnasc', StrToDate('30/12/1899'));
      qry.ParamByName('PAVALISTA').AsString := body.GetValue<string>('avalista', '');
      qry.ParamByName('PAVALCPF').AsString := body.GetValue<string>('avalcpf', '');
      qry.ParamByName('PAVALRG').AsString := body.GetValue<string>('avalrg', '');
      qry.ParamByName('PV_PRAZO').AsString := body.GetValue<string>('v_prazo', '');
      qry.ParamByName('PSPCSERASA').AsString := body.GetValue<string>('spcserasa', '');
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

end.
