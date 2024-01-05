unit model.cliente.doProcedure;

interface

uses
  FireDAC.Comp.Client, Data.DB, System.SysUtils, model.connection, model.principal;

type
  TModelClienteDoProcedure = class(TModelPrincipal)
    private
    FAVALCPF: string;
    FBANCO: string;
    FPAINOME: string;
    FINSCMUNICIPAL: string;
    FTIPOPESSOA: string;
    FTRABCIDADE: string;
    FMAEOBS: string;
    FMAERG: string;
    FSPCSERASA: string;
    FCONJEMPRESA: string;
    FTRABEND: string;
    FTRABTELEFONE: string;
    FRG: string;
    FCNPJ: string;
    FFANTASIA: string;
    FCTACORRENTE: string;
    FEMAIL: string;
    FBAIRRO: string;
    FFAX: string;
    FCONJCARGO: string;
    FAUTORIZADONOME: string;
    FSOCIOEND: string;
    FPAIOBS: string;
    FPAIRG: string;
    FDCTOOUTROS: string;
    FCONJNOME: string;
    FESTADOCIVIL: string;
    FSOCIOFONE: string;
    FCONJCIDADE: string;
    FNATURALCIDADE: string;
    FTRABBAIRRO: string;
    FMAECPF: string;
    FCONJMAE: string;
    FCONJEND: string;
    FCPF: string;
    FINSCESTADUAL: string;
    FINATIVO: string;
    FSOCIORG: string;
    FCONJFONE: string;
    FTRABUF: string;
    FSOCIOEMAIL: string;
    FCEP: string;
    FNUMERO: string;
    FCONJRG: string;
    FPAICPF: string;
    FREFBANCARIAS: string;
    FCONJPAI: string;
    FCONJBAIRRO: string;
    FCASA: string;
    FTRABCEP: string;
    FAVALISTA: string;
    FBANDCARTAO: string;
    FTRABNUMERO: string;
    FREFCOMERCIAIS: string;
    FSOCIOCPF: string;
    FCOMPLEMENTO: string;
    FAVALRG: string;
    FCONTATO: string;
    FTRABEMPRESA: string;
    FMAENOME: string;
    FCONJCPF: string;
    FSEXO: string;
    FAGENCIA: string;
    FNOME: string;
    FV_PRAZO: string;
    FCONJNATURAL: string;
    FENDERECO: string;
    FCONJNUMERO: string;
    FTRABCARGO: string;
    FTELEFONE: string;
    FSOCNOME: string;
    FCELULAR: string;
    FTEMPORESIDENCIA: string;
    FSOCIODTNASC: TDateTime;
    FTRABADMISSAO: TDateTime;
    FDATANASCIMENTO: TDateTime;
    FCONJADMISSAO: TDateTime;
    FDATACADASTRO: TDateTime;
    FDATAFUNDACAO: TDateTime;
    FCONJNASC: TDateTime;
    FDESCONTOMAX: Real;
    FALUGUEL: Real;
    FCONJRENDA: Real;
    FTRABSALARIO: Real;
    FLIMITECREDITO: Real;
    FEMPRESAID: Integer;
    FCIDADEID: Integer;
    FREPRESENTANTEID: Integer;
    FNCARTAO: Integer;
    FRAMOID: Integer;
    FID: Integer;

    public
      constructor Create;
      destructor Destroy;

      function doProcedure(lcOpr: string; out erro: string): Boolean;
      function Gerador: Integer; override;

      property NOME: string read FNOME write FNOME;
      property FANTASIA: string read FFANTASIA write FFANTASIA;
      property DCTOOUTROS: string read FDCTOOUTROS write FDCTOOUTROS;
      property TEMPORESIDENCIA: string read FTEMPORESIDENCIA write FTEMPORESIDENCIA;
      property ENDERECO: string read FENDERECO write FENDERECO;
      property NUMERO: string read FNUMERO write FNUMERO;
      property BAIRRO: string read FBAIRRO write FBAIRRO;
      property COMPLEMENTO: string read FCOMPLEMENTO write FCOMPLEMENTO;
      property CEP: string read FCEP write FCEP;
      property TELEFONE: string read FTELEFONE write FTELEFONE;
      property CELULAR: string read FCELULAR write FCELULAR;
      property FAX: string read FFAX write FFAX;
      property REFCOMERCIAIS: string read FREFCOMERCIAIS write FREFCOMERCIAIS;
      property CNPJ: string read FCNPJ write FCNPJ;
      property INSCESTADUAL: string read FINSCESTADUAL write FINSCESTADUAL;
      property INSCMUNICIPAL: string read FINSCMUNICIPAL write FINSCMUNICIPAL;
      property CONTATO: string read FCONTATO write FCONTATO;
      property CPF: string read FCPF write FCPF;
      property RG: string read FRG write FRG;
      property REFBANCARIAS: string read FREFBANCARIAS write FREFBANCARIAS;
      property PAINOME: string read FPAINOME write FPAINOME;
      property PAIRG: string read FPAIRG write FPAIRG;
      property PAICPF: string read FPAICPF write FPAICPF;
      property PAIOBS: string read FPAIOBS write FPAIOBS;
      property MAENOME: string read FMAENOME write FMAENOME;
      property MAERG: string read FMAERG write FMAERG;
      property MAECPF: string read FMAECPF write FMAECPF;
      property MAEOBS: string read FMAEOBS write FMAEOBS;
      property TRABEMPRESA: string read FTRABEMPRESA write FTRABEMPRESA;
      property TRABTELEFONE: string read FTRABTELEFONE write FTRABTELEFONE;
      property TRABCARGO: string read FTRABCARGO write FTRABCARGO;
      property TRABEND: string read FTRABEND write FTRABEND;
      property TRABNUMERO: string read FTRABNUMERO write FTRABNUMERO;
      property TRABCEP: string read FTRABCEP write FTRABCEP;
      property TRABCIDADE: string read FTRABCIDADE write FTRABCIDADE;
      property TRABBAIRRO: string read FTRABBAIRRO write FTRABBAIRRO;
      property TRABUF: string read FTRABUF write FTRABUF;
      property NATURALCIDADE: string read FNATURALCIDADE write FNATURALCIDADE;
      property AUTORIZADONOME: string read FAUTORIZADONOME write FAUTORIZADONOME;
      property CONJNOME: string read FCONJNOME write FCONJNOME;
      property CONJCPF: string read FCONJCPF write FCONJCPF;
      property CONJRG: string read FCONJRG write FCONJRG;
      property CONJEMPRESA: string read FCONJEMPRESA write FCONJEMPRESA;
      property CONJFONE: string read FCONJFONE write FCONJFONE;
      property CONJCARGO: string read FCONJCARGO write FCONJCARGO;
      property CONJEND: string read FCONJEND write FCONJEND;
      property CONJNUMERO: string read FCONJNUMERO write FCONJNUMERO;
      property CONJBAIRRO: string read FCONJBAIRRO write FCONJBAIRRO;
      property CONJCIDADE: string read FCONJCIDADE write FCONJCIDADE;
      property CONJNATURAL: string read FCONJNATURAL write FCONJNATURAL;
      property CONJPAI: string read FCONJPAI write FCONJPAI;
      property CONJMAE: string read FCONJMAE write FCONJMAE;
      property EMAIL: string read FEMAIL write FEMAIL;
      property BANCO: string read FBANCO write FBANCO;
      property AGENCIA: string read FAGENCIA write FAGENCIA;
      property CTACORRENTE: string read FCTACORRENTE write FCTACORRENTE;
      property BANDCARTAO: string read FBANDCARTAO write FBANDCARTAO;
      property SOCNOME: string read FSOCNOME write FSOCNOME;
      property SOCIOEND: string read FSOCIOEND write FSOCIOEND;
      property SOCIOFONE: string read FSOCIOFONE write FSOCIOFONE;
      property SOCIOEMAIL: string read FSOCIOEMAIL write FSOCIOEMAIL;
      property SOCIORG: string read FSOCIORG write FSOCIORG;
      property SOCIOCPF: string read FSOCIOCPF write FSOCIOCPF;
      property AVALISTA: string read FAVALISTA write FAVALISTA;
      property AVALCPF: string read FAVALCPF write FAVALCPF;
      property AVALRG: string read FAVALRG write FAVALRG;
      property SPCSERASA: string read FSPCSERASA write FSPCSERASA;
      property INATIVO: string read FINATIVO write FINATIVO;
      property TIPOPESSOA: string read FTIPOPESSOA write FTIPOPESSOA;
      property ESTADOCIVIL: string read FESTADOCIVIL write FESTADOCIVIL;
      property SEXO: string read FSEXO write FSEXO;
      property CASA: string read FCASA write FCASA;
      property V_PRAZO: string read FV_PRAZO write FV_PRAZO;

      property DATAFUNDACAO: TDateTime read FDATAFUNDACAO write FDATAFUNDACAO;
      property TRABADMISSAO: TDateTime read FTRABADMISSAO write FTRABADMISSAO;
      property DATANASCIMENTO: TDateTime read FDATANASCIMENTO write FDATANASCIMENTO;
      property DATACADASTRO: TDateTime read FDATACADASTRO write FDATACADASTRO;
      property CONJNASC: TDateTime read FCONJNASC write FCONJNASC;
      property CONJADMISSAO: TDateTime read FCONJADMISSAO write FCONJADMISSAO;
      property SOCIODTNASC: TDateTime read FSOCIODTNASC write FSOCIODTNASC;

      property LIMITECREDITO: Real read FLIMITECREDITO write FLIMITECREDITO;
      property DESCONTOMAX: Real read FDESCONTOMAX write FDESCONTOMAX;
      property ALUGUEL: Real read FALUGUEL write FALUGUEL;
      property TRABSALARIO: Real read FTRABSALARIO write FTRABSALARIO;
      property CONJRENDA: Real read FCONJRENDA write FCONJRENDA;

      property EMPRESAID: Integer read FEMPRESAID write FEMPRESAID;
      property ID: Integer read FID write FID;
      property CIDADEID: Integer read FCIDADEID write FCIDADEID;
      property REPRESENTANTEID: Integer read FREPRESENTANTEID write FREPRESENTANTEID;
      property RAMOID: Integer read FRAMOID write FRAMOID;
      property NCARTAO: Integer read FNCARTAO write FNCARTAO;
  end;

implementation

{ TModelClienteCreateRecord }

constructor TModelClienteDoProcedure.Create;
begin

  inherited;
end;

destructor TModelClienteDoProcedure.Destroy;
begin

  inherited;
end;

function TModelClienteDoProcedure.Gerador: Integer;
begin
  result := inherited doGerador('GEN_CLIENTE_ID');
end;

function TModelClienteDoProcedure.doProcedure(lcOpr: string; out erro: string): Boolean;
var
  qry : TFDQuery;
  PREPRESENTANTEID, PRAMOID: string;
begin
  try
    if lcOpr = 'I' then
      ID := Gerador;

    if REPRESENTANTEID = 0 then
      PREPRESENTANTEID := 'NULL'
    else
      PREPRESENTANTEID := 'PREPRESENTANTEID';

    if RAMOID = 0 then
      PRAMOID := 'NULL'
    else
      PRAMOID := 'PRAMOID';

    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;

    with qry do
      begin
        Active := false;
        SQL.Clear;
        SQL.Add('EXECUTE PROCEDURE SP_CLIENTE(:POPR, :PEMPRESAID, :PID, :PCIDADEID, ' + PREPRESENTANTEID +
        ', ' + PRAMOID + ', :PNOME, :PFANTASIA, :PINATIVO, :PTIPOPESSOA, :PESTADOCIVIL, :PDCTOOUTROS,' +
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
        ParamByName('POPR').AsString := lcOpr;
        ParamByName('PEMPRESAID').AsInteger := EMPRESAID;
        ParamByName('PID').AsInteger := ID;
        ParamByName('PCIDADEID').AsInteger := CIDADEID;

        if REPRESENTANTEID <> 0 then
          ParamByName('PREPRESENTANTEID').AsInteger := REPRESENTANTEID;

        if RAMOID <> 0 then
          ParamByName('PRAMOID').AsInteger := RAMOID;

        ParamByName('PNOME').AsString := NOME;
        ParamByName('PFANTASIA').AsString := FANTASIA;
        ParamByName('PINATIVO').AsString := INATIVO;
        ParamByName('PTIPOPESSOA').AsString := TIPOPESSOA;
        ParamByName('PESTADOCIVIL').AsString := ESTADOCIVIL;
        ParamByName('PDCTOOUTROS').AsString := DCTOOUTROS;
        ParamByName('PTEMPORESIDENCIA').AsString := TEMPORESIDENCIA;
        ParamByName('PENDERECO').AsString := ENDERECO;
        ParamByName('PNUMERO').AsString := NUMERO;
        ParamByName('PBAIRRO').AsString := BAIRRO;
        ParamByName('PCOMPLEMENTO').AsString := COMPLEMENTO;
        ParamByName('PCEP').AsString := CEP;
        ParamByName('PTELEFONE').AsString := TELEFONE;
        ParamByName('PCELULAR').AsString := CELULAR;
        ParamByName('PFAX').AsString := FAX;
        ParamByName('PLIMITECREDITO').AsFloat := LIMITECREDITO;
        ParamByName('PDESCONTOMAX').AsFloat := DESCONTOMAX;
        ParamByName('PREFCOMERCIAIS').AsString := REFCOMERCIAIS;
        ParamByName('PCNPJ').AsString := CNPJ;
        ParamByName('PINSCESTADUAL').AsString := INSCESTADUAL;
        ParamByName('PINSCMUNICIPAL').AsString := INSCMUNICIPAL;
        ParamByName('PDATAFUNDACAO').AsDateTime := DATAFUNDACAO;
        ParamByName('PCONTATO').AsString := CONTATO;
        ParamByName('PCPF').AsString := CPF;
        ParamByName('PRG').AsString := RG;
        ParamByName('PSEXO').AsString := SEXO;
        ParamByName('PREFBANCARIAS').AsString := REFBANCARIAS;
        ParamByName('PCASA').AsString := CASA;
        ParamByName('PALUGUEL').AsFloat := ALUGUEL;
        ParamByName('PPAINOME').AsString := PAINOME;
        ParamByName('PPAIRG').AsString := PAIRG;
        ParamByName('PPAICPF').AsString := PAICPF;
        ParamByName('PPAIOBS').AsString := PAIOBS;
        ParamByName('PMAENOME').AsString := MAENOME;
        ParamByName('PMAERG').AsString := MAERG;
        ParamByName('PMAECPF').AsString := MAECPF;
        ParamByName('PMAEOBS').AsString := MAEOBS;
        ParamByName('PTRABEMPRESA').AsString := TRABEMPRESA;
        ParamByName('PTRABTELEFONE').AsString := TRABTELEFONE;
        ParamByName('PTRABCARGO').AsString := TRABCARGO;
        ParamByName('PTRABADMISSAO').AsDateTime := TRABADMISSAO;
        ParamByName('PTRABSALARIO').AsFloat := TRABSALARIO;
        ParamByName('PTRABEND').AsString := TRABEND;
        ParamByName('PTRABNUMERO').AsString := TRABNUMERO;
        ParamByName('PTRABCEP').AsString := TRABCEP;
        ParamByName('PTRABCIDADE').AsString := TRABCIDADE;
        ParamByName('PTRABBAIRRO').AsString := TRABBAIRRO;
        ParamByName('PTRABUF').AsString := TRABUF;
        ParamByName('PDATANASCIMENTO').AsDateTime := DATANASCIMENTO;
        ParamByName('PNATURALCIDADE').AsString := NATURALCIDADE;
        ParamByName('PDATACADASTRO').AsDateTime := DATACADASTRO;
        ParamByName('PAUTORIZADONOME').AsString := AUTORIZADONOME;
        ParamByName('PCONJNOME').AsString := CONJNOME;
        ParamByName('PCONJNASC').AsDateTime := CONJNASC;
        ParamByName('PCONJCPF').AsString := CONJCPF;
        ParamByName('PCONJRG').AsString := CONJRG;
        ParamByName('PCONJEMPRESA').AsString := CONJEMPRESA;
        ParamByName('PCONJFONE').AsString := CONJFONE;
        ParamByName('PCONJCARGO').AsString := CONJCARGO;
        ParamByName('PCONJADMISSAO').AsDateTime := CONJADMISSAO;
        ParamByName('PCONJRENDA').AsFloat := CONJRENDA;
        ParamByName('PCONJEND').AsString := CONJEND;
        ParamByName('PCONJNUMERO').AsString := CONJNUMERO;
        ParamByName('PCONJBAIRRO').AsString := CONJBAIRRO;
        ParamByName('PCONJCIDADE').AsString := CONJCIDADE;
        ParamByName('PCONJNATURAL').AsString := CONJNATURAL;
        ParamByName('PCONJPAI').AsString := CONJPAI;
        ParamByName('PCONJMAE').AsString := CONJMAE;
        ParamByName('PEMAIL').AsString := EMAIL;
        ParamByName('PBANCO').AsString := BANCO;
        ParamByName('PAGENCIA').AsString := AGENCIA;
        ParamByName('PCTACORRENTE').AsString := CTACORRENTE;
        ParamByName('PNCARTAO').AsInteger := NCARTAO;
        ParamByName('PBANDCARTAO').AsString := BANDCARTAO;
        ParamByName('PSOCNOME').AsString := SOCNOME;
        ParamByName('PSOCIOEND').AsString := SOCIOEND;
        ParamByName('PSOCIOFONE').AsString := SOCIOFONE;
        ParamByName('PSOCIOEMAIL').AsString := SOCIOEMAIL;
        ParamByName('PSOCIORG').AsString := SOCIORG;
        ParamByName('PSOCIOCPF').AsString := SOCIOCPF;
        ParamByName('PSOCIODTNASC').AsDateTime := SOCIODTNASC;
        ParamByName('PAVALISTA').AsString := AVALISTA;
        ParamByName('PAVALCPF').AsString := AVALCPF;
        ParamByName('PAVALRG').AsString := AVALRG;
        ParamByName('PV_PRAZO').AsString := V_PRAZO;
        ParamByName('PSPCSERASA').AsString := SPCSERASA;

        ExecSQL;
      end;

    erro := '';
    Result := true;
  except on ex:exception do
    begin
      erro := 'Erro cliente: ' + ex.Message;
      Result := false;
    end;
  end;
end;

end.
