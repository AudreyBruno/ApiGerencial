unit controller.cliente.CreateRecord;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize, controller.principal,
  model.cliente.doProcedure;

type
  TControllerClienteCreateRecord = class(TControllerPrincipal)
    private

    public
      procedure createRecord(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerClienteCreateRecord }

procedure TControllerClienteCreateRecord.createRecord(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  cli: TModelClienteDoProcedure;
  body: TJSONValue;
  erro: string;
begin
  try
    cli := TModelClienteDoProcedure.Create;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    try
      body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(req.Body), 0) as TJsonValue;

      cli.NOME := body.GetValue<string>('nome', '');
      cli.FANTASIA := body.GetValue<string>('fantasia', '');
      cli.DCTOOUTROS := body.GetValue<string>('dctooutros', '');
      cli.TEMPORESIDENCIA := body.GetValue<string>('temporesidencia', '');
      cli.ENDERECO := body.GetValue<string>('endereco', '');
      cli.NUMERO := body.GetValue<string>('numero', '');
      cli.BAIRRO := body.GetValue<string>('bairro', '');
      cli.COMPLEMENTO := body.GetValue<string>('complemento', '');
      cli.CEP := body.GetValue<string>('cep', '');
      cli.TELEFONE := body.GetValue<string>('telefone', '');
      cli.CELULAR := body.GetValue<string>('celular', '');
      cli.FAX := body.GetValue<string>('fax', '');
      cli.REFCOMERCIAIS := body.GetValue<string>('refcomerciais', '');
      cli.CNPJ := body.GetValue<string>('cnpj', '');
      cli.INSCESTADUAL := body.GetValue<string>('inscestadual', '');
      cli.INSCMUNICIPAL := body.GetValue<string>('inscmunicipal', '');
      cli.CONTATO := body.GetValue<string>('contato', '');
      cli.CPF := body.GetValue<string>('cpf', '');
      cli.RG := body.GetValue<string>('rg', '');
      cli.REFBANCARIAS := body.GetValue<string>('refbancarias', '');
      cli.PAINOME := body.GetValue<string>('painome', '');
      cli.PAIRG := body.GetValue<string>('pairg', '');
      cli.PAICPF := body.GetValue<string>('paicpf', '');
      cli.PAIOBS := body.GetValue<string>('paiobs', '');
      cli.MAENOME := body.GetValue<string>('maenome', '');
      cli.MAERG := body.GetValue<string>('maerg', '');
      cli.MAECPF := body.GetValue<string>('maecpf', '');
      cli.MAEOBS := body.GetValue<string>('maeobs', '');
      cli.TRABEMPRESA := body.GetValue<string>('trabempresa', '');
      cli.TRABTELEFONE := body.GetValue<string>('trabtelefone', '');
      cli.TRABCARGO := body.GetValue<string>('trabcargo', '');
      cli.TRABEND := body.GetValue<string>('trabend', '');
      cli.TRABNUMERO := body.GetValue<string>('trabnumero', '');
      cli.TRABCEP := body.GetValue<string>('trabcep', '');
      cli.TRABCIDADE := body.GetValue<string>('trabcidade', '');
      cli.TRABBAIRRO := body.GetValue<string>('trabbairro', '');
      cli.TRABUF := body.GetValue<string>('trabuf', '');
      cli.NATURALCIDADE := body.GetValue<string>('naturalcidade', '');
      cli.AUTORIZADONOME := body.GetValue<string>('autorizadonome', '');
      cli.CONJNOME := body.GetValue<string>('conjnome', '');
      cli.CONJCPF := body.GetValue<string>('conjcpf', '');
      cli.CONJRG := body.GetValue<string>('conjrg', '');
      cli.CONJEMPRESA := body.GetValue<string>('conjempresa', '');
      cli.CONJFONE := body.GetValue<string>('conjfone', '');
      cli.CONJCARGO := body.GetValue<string>('conjcargo', '');
      cli.CONJEND := body.GetValue<string>('conjend', '');
      cli.CONJNUMERO := body.GetValue<string>('conjnumero', '');
      cli.CONJBAIRRO := body.GetValue<string>('conjbairro', '');
      cli.CONJCIDADE := body.GetValue<string>('conjcidade', '');
      cli.CONJNATURAL := body.GetValue<string>('conjnatural', '');
      cli.CONJPAI := body.GetValue<string>('conjpai', '');
      cli.CONJMAE := body.GetValue<string>('conjmae', '');
      cli.EMAIL := body.GetValue<string>('email', '');
      cli.BANCO := body.GetValue<string>('banco', '');
      cli.AGENCIA := body.GetValue<string>('agencia', '');
      cli.CTACORRENTE := body.GetValue<string>('ctacorrente', '');
      cli.BANDCARTAO := body.GetValue<string>('bandcartao', '');
      cli.SOCNOME := body.GetValue<string>('socnome', '');
      cli.SOCIOEND := body.GetValue<string>('socioend', '');
      cli.SOCIOFONE := body.GetValue<string>('sociofone', '');
      cli.SOCIOEMAIL := body.GetValue<string>('socioemail', '');
      cli.SOCIORG := body.GetValue<string>('sociorg', '');
      cli.SOCIOCPF := body.GetValue<string>('sociocpf', '');
      cli.AVALISTA := body.GetValue<string>('avalista', '');
      cli.AVALCPF := body.GetValue<string>('avalcpf', '');
      cli.AVALRG := body.GetValue<string>('avalrg', '');
      cli.SPCSERASA := body.GetValue<string>('spcserasa', '');
      cli.INATIVO := body.GetValue<string>('inativo', '');
      cli.TIPOPESSOA := body.GetValue<string>('tipopessoa', '');
      cli.ESTADOCIVIL := body.GetValue<string>('estadocivil', '');
      cli.SEXO := body.GetValue<string>('sexo', '');
      cli.CASA := body.GetValue<string>('casa', '');
      cli.V_PRAZO := body.GetValue<string>('v_prazo', '');

      cli.DATAFUNDACAO := body.GetValue<TDateTime>('datafundacao', StrToDate('30/12/1899'));
      cli.TRABADMISSAO := body.GetValue<TDateTime>('trabadmissao', StrToDate('30/12/1899'));
      cli.DATANASCIMENTO := body.GetValue<TDateTime>('datanascimento', StrToDate('30/12/1899'));
      cli.DATACADASTRO := body.GetValue<TDateTime>('datacadastro', StrToDate('30/12/1899'));
      cli.CONJNASC := body.GetValue<TDateTime>('conjnasc', StrToDate('30/12/1899'));
      cli.CONJADMISSAO := body.GetValue<TDateTime>('conjadmissao', StrToDate('30/12/1899'));
      cli.SOCIODTNASC := body.GetValue<TDateTime>('sociodtnasc', StrToDate('30/12/1899'));

      cli.LIMITECREDITO := body.GetValue<Real>('limitecredito', 0);
      cli.DESCONTOMAX := body.GetValue<Real>('descontomax', 0);
      cli.ALUGUEL := body.GetValue<Real>('aluguel', 0);
      cli.TRABSALARIO := body.GetValue<Real>('trabsalario', 0);
      cli.CONJRENDA := body.GetValue<Real>('conjrenda', 0);

      cli.EMPRESAID := body.GetValue<Integer>('empresaid', 1);
      cli.CIDADEID := body.GetValue<Integer>('cidadeid');
      cli.REPRESENTANTEID := body.GetValue<Integer>('representanteid', 0);
      cli.RAMOID := body.GetValue<Integer>('ramoid', 0);
      cli.NCARTAO := body.GetValue<Integer>('ncartao', 0);

      cli.doProcedure('I', erro);

      if erro <> '' then
        raise Exception.Create(erro);

    except on ex:exception do
      begin
        res.Send(ex.Message).Status(400);
        exit;
      end;
    end;
  finally
    cli.Free;
  end;
end;

end.
