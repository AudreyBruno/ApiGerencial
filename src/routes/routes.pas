unit routes;

interface

uses
  Horse, controller.cliente.GetAll, controller.cliente.GetById, controller.cliente.CreateRecord,
  controller.cliente.UpdateById, controller.cliente.DeleteById, controller.produto.GetAll,
  controller.produto.GetById, controller.produto.CreateRecord, controller.produto.UpdateById,
  controller.produto.DeleteById;

procedure rotasCliente;
procedure rotasProduto;

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

procedure rotasProduto;
var
  GetAll: TControllerProdutoGetAll;
  GetById: TControllerProdutoGetById;
  CreateRecord: TControllerProdutoCreateRecord;
  UpdateById: TControllerProdutoUpdateById;
  DeleteById: TControllerProdutoDeleteById;
begin
  THorse.Get('/produto', GetAll.getAll);
  THorse.Get('/produto/:id', GetById.getById);
  THorse.Post('/produto', CreateRecord.CreateRecord);
  THorse.Put('/produto/:id', UpdateById.updateById);
  THorse.Delete('/produto/:id', DeleteById.deleteById);
end;

end.
