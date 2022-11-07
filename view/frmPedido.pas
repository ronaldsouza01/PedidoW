unit frmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    pnlRodape: TPanel;
    btnFechar: TButton;
    pnlCliente: TPanel;
    pnlGrid: TPanel;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    edtNomeCliente: TEdit;
    lblNomeCliente: TLabel;
    edtCodProduto: TEdit;
    lblCodProduto: TLabel;
    edtNomeProduto: TEdit;
    lblNomeProduto: TLabel;
    edtQtd: TEdit;
    lblQtd: TLabel;
    edtValUnitario: TEdit;
    lblValUnitario: TLabel;
    btnIncluir: TButton;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsItenscodproduto: TIntegerField;
    cdsItensquantidade: TFloatField;
    cdsItensvlunitario: TFloatField;
    cdsItensvlTotal: TFloatField;
    dbgItens: TDBGrid;
    cdsItensnmproduto: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtValUnitarioExit(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    { Private declarations }
    fCodCli: integer;
    fCodPed: Integer;
    procedure BuscaCliente(iCodCli: integer);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses udmConexao, uClienteController, uClienteModel;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.BuscaCliente(iCodCli: integer);
var
  oClienteController: TClienteController;
  oClienteModel: TClienteModel;
begin
  oClienteModel := TClienteModel.Create;
  try
    oClienteController := TClienteController.Create;
    try
      oClienteController.Carregar(oClienteModel,iCodCli);
      if oClienteModel.nmcliente <> '' then
      begin
        fCodCli := iCodCli;
        edtNomeCliente.Text := oClienteModel.nmcliente;
        edtCodProduto.SetFocus;
      end
      else
      begin
        ShowMessage('Cliente n�o cadastrado !');
        fCodCli := 0;
        edtCodigo.Text := '';
        edtCodigo.SetFocus;
      end;
    finally
      FreeAndNil(oClienteController);
    end;
  finally
    FreeAndNil(oClienteModel);
  end;
end;

procedure TfrmPrincipal.edtCodigoExit(Sender: TObject);
begin
  if edtCodigo.Text <> '' then
  begin
    BuscaCliente(StrToInt(edtCodigo.Text));
  end
  else
  begin
    if not btnFechar.Focused then
    begin
      ShowMessage('Informe o c�digo do cliente !');
      edtCodigo.SetFocus;
    end;
  end;
end;

procedure TfrmPrincipal.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0']) then
  begin
    key :=#0;
  end;
end;

procedure TfrmPrincipal.edtValUnitarioExit(Sender: TObject);
var
  fValor: double;
begin
  try
    fValor := StrToFloat(edtValUnitario.Text);
  except
    MessageDlg('Valor incorreto - Favor corrigir !',TMsgDlgType.mtError,[mbOk],0,mbOK);
    edtValUnitario.SetFocus;
  end;
end;

procedure TfrmPrincipal.edtValUnitarioKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0','.']) then
  begin
    key :=#0;
  end;
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  edtCodigo.SetFocus;
end;

end.
