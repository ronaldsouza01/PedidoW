program Pedidos;

uses
  Vcl.Forms,
  frmPedido in 'view\frmPedido.pas' {frmPrincipal},
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
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
