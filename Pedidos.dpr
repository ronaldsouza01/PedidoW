program Pedidos;

uses
  Vcl.Forms,
  frmPedido in 'view\frmPedido.pas' {Form1},
  udmConexao in 'dao\udmConexao.pas' {dmConexao: TDataModule},
  uPedidoModel in 'model\uPedidoModel.pas',
  uPedidoController in 'controller\uPedidoController.pas',
  udmPedido in 'dao\udmPedido.pas' {dmPedido: TDataModule},
  udmItens in 'dao\udmItens.pas' {dmItens: TDataModule},
  uItensModel in 'model\uItensModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmPedido, dmPedido);
  Application.CreateForm(TdmItens, dmItens);
  Application.Run;
end.
