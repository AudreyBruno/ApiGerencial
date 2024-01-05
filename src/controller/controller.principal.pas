unit controller.principal;

interface

uses
  Horse, System.JSON, System.SysUtils, FireDAC.Comp.Client, Data.DB, DataSet.Serialize;

type
  TControllerPrincipal = class
    private

    public
      procedure getAll(Req: THorseRequest; Res: THorseResponse; Next: TProc);
      procedure getById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
      procedure createRecord(Req: THorseRequest; Res: THorseResponse; Next: TProc);
      procedure deleteById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
      procedure updateById(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TPrincipal }

procedure TControllerPrincipal.createRecord(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin

end;

procedure TControllerPrincipal.deleteById(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin

end;

procedure TControllerPrincipal.getAll(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin

end;

procedure TControllerPrincipal.getById(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin

end;

procedure TControllerPrincipal.updateById(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin

end;

end.
