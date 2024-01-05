unit routes;

interface

uses
  Horse, controller.cliente.GetAll, controller.cliente.GetById, controller.cliente.CreateRecord,
  controller.cliente.UpdateById, controller.cliente.DeleteById;

procedure rotasCliente;

implementation

procedure rotasCliente;
var
  GetAll: TControllerClienteGetAll;
  GetById: TControllerClienteGetById;
  CreateRecord: TControllerClienteCreateRecord;
  UpdateById: TControllerClienteUpdateById;
  DeleteById: TControllerClienteDeleteById;
begin
  THorse.Get('/cliente', GetAll.getAll);
  THorse.Get('/cliente/:id', GetById.getById);
  THorse.Post('/cliente', CreateRecord.CreateRecord);
  THorse.Put('/cliente/:id', UpdateById.updateById);
  THorse.Delete('/cliente/:id', DeleteById.deleteById);
end;

end.
