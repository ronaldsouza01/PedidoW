program Pedidos;

uses
  Vcl.Forms,
  frmPedido in 'view\frmPedido.pas' {Form1},
  udmConexao in 'dao\udmConexao.pas' {dmConexao: TDataModule},
  uPedidoModel in 'model\uPedidoModel.pas',
  uPedidoController in 'controller\uPedidoController.pas',
  udmPedido in 'dao\udmPedido.pas' {DataModule1: TDataModule},
  udmItens in 'dao\udmItens.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
