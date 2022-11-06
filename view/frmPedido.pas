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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses udmConexao;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Close;
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
