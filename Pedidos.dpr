program Pedidos;

uses
  Vcl.Forms,
  frmPedido in 'frmPedido.pas' {Form1},
  udmPedido in 'udmPedido.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
