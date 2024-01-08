program ApiGerencial;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  model.connection in 'src\model\model.connection.pas',
  model.principal in 'src\model\model.principal.pas',
  controller.principal in 'src\controller\controller.principal.pas',
  model.cliente.GetAll in 'src\model\cliente\model.cliente.GetAll.pas',
  controller.cliente.GetAll in 'src\controller\cliente\controller.cliente.GetAll.pas',
  routes in 'src\routes\routes.pas',
  model.cliente.GetById in 'src\model\cliente\model.cliente.GetById.pas',
  controller.cliente.GetById in 'src\controller\cliente\controller.cliente.GetById.pas',
  model.cliente.doProcedure in 'src\model\cliente\model.cliente.doProcedure.pas',
  controller.cliente.CreateRecord in 'src\controller\cliente\controller.cliente.CreateRecord.pas',
  controller.cliente.UpdateById in 'src\controller\cliente\controller.cliente.UpdateById.pas',
  controller.cliente.DeleteById in 'src\controller\cliente\controller.cliente.DeleteById.pas',
  model.produto.GetAll in 'src\model\produto\model.produto.GetAll.pas',
  controller.produto.GetAll in 'src\controller\produto\controller.produto.GetAll.pas',
  model.produto.GetById in 'src\model\produto\model.produto.GetById.pas',
  controller.produto.GetById in 'src\controller\produto\controller.produto.GetById.pas';

begin
  THorse.Use(Jhonson());

  routes.rotasCliente;
  routes.rotasProduto;

  THorse.Listen(9000);
end.
