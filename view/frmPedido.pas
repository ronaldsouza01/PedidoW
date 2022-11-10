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
    pnlAcao: TPanel;
    lblTotal: TLabel;
    lblValorTotal: TLabel;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtValUnitarioExit(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtQtdExit(Sender: TObject);
    procedure dbgItensKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure dbgItensEnter(Sender: TObject);
    procedure dbgItensExit(Sender: TObject);
    procedure dbgItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fCodCli: integer;
    fCodPed: Integer;
    fValTotal: double;
    procedure BuscaCliente(iCodCli: integer);
    procedure BuscaProduto(iCodPro: integer);
    procedure InclueProduto;
    procedure AlteraProduto;
    procedure LimpaForm;
    procedure GravarPedido;
    procedure RecalculaTotal;
  public
    { Public declarations }
  end;

type
  TOpe = (oInsert,oEdit);
var
  frmPrincipal: TfrmPrincipal;
  Opera: TOpe;

implementation

{$R *.dfm}

uses udmConexao, uClienteController, uClienteModel, uProdutoController,
  uProdutoModel, uPedidoModel, uPedidoController, uItensController, uItensModel;

procedure TfrmPrincipal.AlteraProduto;
begin
  cdsItens.Edit;
  cdsItens.FieldByName('codproduto').AsInteger := strtoint(edtCodproduto.Text);
  cdsItens.FieldByName('quantidade').AsFloat   := StrToFloat(edtQtd.Text);
  cdsItens.FieldByName('vlunitario').AsFloat   := strToFloat(edtValUnitario.Text);
  cdsItens.FieldByName('nmproduto').AsString   := edtNomeProduto.Text;
  cdsItens.FieldByName('vltotal').AsFloat      := cdsItens.FieldByName('quantidade').AsFloat *
                                                  cdsItens.FieldByName('vlunitario').AsFloat;
  cdsItens.Post;
  RecalculaTotal;
end;

procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  LimpaForm;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
  GravarPedido;
end;

procedure TfrmPrincipal.btnIncluirClick(Sender: TObject);
begin
  if Opera = oInsert then
  begin
    InclueProduto;
  end
  else
  begin
    AlteraProduto;
  end;
  btnIncluir.Enabled := False;
  if not btnGravar.Enabled then
  begin
    btnGravar.Enabled := True;
  end;
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

procedure TfrmPrincipal.BuscaProduto(iCodPro: integer);
var
  oProdutoController: TProdutoController;
  oProdutoModel: TProdutoModel;
begin
  oProdutoModel := TProdutoModel.Create;
  try
    oProdutoController := TProdutoController.Create;
    try
      oProdutoController.Carregar(oProdutoModel,iCodPro);
      if oProdutoModel.nmproduto <> '' then
      begin
        edtNomeProduto.Text := oProdutoModel.nmproduto;
        edtValUnitario.Text := FloatToStr(oProdutoModel.vlpreco);
        edtQtd.SetFocus;
      end
      else
      begin
        ShowMessage('Produto n�o cadastrado !');
        edtCodProduto.Text := '';
        edtCodProduto.SetFocus;
      end;
    finally
      FreeAndNil(oProdutoController);
    end;
  finally
    FreeAndNil(oProdutoModel);
  end;
end;

procedure TfrmPrincipal.dbgItensEnter(Sender: TObject);
begin
   pnlRodape.Caption := '<INS> Inclue produto, <ENTER> Altera produto, <DEL> Exclue produto';
end;

procedure TfrmPrincipal.dbgItensExit(Sender: TObject);
begin
     pnlRodape.Caption := '';
end;

procedure TfrmPrincipal.dbgItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Opera := oEdit;
    btnIncluir.Caption  := 'Alterar';
    edtCodProduto.Text  := cdsItens.FieldByName('codproduto').AsString;
    edtNomeProduto.Text := cdsItens.FieldByName('nmproduto').AsString;
    edtQtd.Text         := FloatToStr(cdsItens.FieldByName('quantidade').AsFloat);
    edtValUnitario.Text := FloatToStr(cdsItens.FieldByName('vlunitario').AsFloat);
    edtCodProduto.SetFocus;
  end;
end;

procedure TfrmPrincipal.dbgItensKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    if MessageDlg('Confirma exclus�o do �tem ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      fValTotal := fValTotal - cdsItens.FieldByName('vltotal').AsFloat;
      cdsItens.Delete;
      lblValorTotal.Caption := FormatFloat('###,###,##0.00',fValTotal);
      if cdsItens.RecordCount = 0 then
      begin
        btnGravar.Enabled := False;
      end;
    end;
  end
  else if Key = VK_RETURN then
  begin
    Opera := oEdit;
    btnIncluir.Caption  := 'Alterar';
    edtCodProduto.Text  := cdsItens.FieldByName('codproduto').AsString;
    edtNomeProduto.Text := cdsItens.FieldByName('nmproduto').AsString;
    edtQtd.Text         := FloatToStr(cdsItens.FieldByName('quantidade').AsFloat);
    edtValUnitario.Text := FloatToStr(cdsItens.FieldByName('vlunitario').AsFloat);
    edtCodProduto.SetFocus;
  end
  else if Key = VK_INSERT then
  begin
    Opera := oInsert;
    btnIncluir.Caption  := 'Incluir';
    edtCodProduto.Text  := '';
    edtNomeProduto.Text := '';
    edtQtd.Text         := '';
    edtValUnitario.Text := '';
    edtCodProduto.SetFocus;
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
    if not btnFechar.Focused and
       not btnCancelar.Focused then
    begin
      ShowMessage('Informe o c�digo do cliente !');
      edtCodigo.SetFocus;
    end;
  end;
end;

procedure TfrmPrincipal.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0',#8]) then
  begin
    key :=#0;
  end;
end;

procedure TfrmPrincipal.edtCodProdutoExit(Sender: TObject);
begin
  if edtCodProduto.Text <> '' then
  begin
    BuscaProduto(StrToInt(edtCodProduto.Text));
  end;
end;

procedure TfrmPrincipal.edtQtdExit(Sender: TObject);
begin
  if edtQtd.Text = '' then
  begin
    if not btnFechar.Focused and
       not btnCancelar.Focused then
    begin
      ShowMessage('Informe a quantidade do �tem !');
      edtQtd.SetFocus;
    end;
  end;
end;

procedure TfrmPrincipal.edtValUnitarioExit(Sender: TObject);
var
  fValor: double;
begin
  try
    fValor := StrToFloat(edtValUnitario.Text);
    if (edtCodProduto.Text <> '') and
       (edtQtd.Text <> '') and
       (edtValUnitario.Text <> '') then
       btnIncluir.Enabled := True;
       btnIncluir.SetFocus;
  except
    MessageDlg('Valor incorreto - Favor corrigir !',TMsgDlgType.mtError,[mbOk],0,mbOK);
    edtValUnitario.SetFocus;
  end;
end;

procedure TfrmPrincipal.edtValUnitarioKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0','.',#8]) then
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
  cdsItens.Open;
  edtCodigo.SetFocus;
  fValTotal := 0.00;
  Opera := oInsert;
end;

procedure TfrmPrincipal.GravarPedido;
var
  oPedidoModel: TPedidoModel;
  oPedidoController: TPedidoController;
  oItensModel: TItensModel;
  oItensController: TItensController;
  iCodPedido: Integer;
  sErro: String;
  sMensagem: String;
begin
  sMensagem := '';
  sErro := '';
  cdsItens.DisableControls;
  oPedidoModel := TPedidoModel.Create;
  dmConexao.fdConexao.StartTransaction;
  try
    oPedidoModel.dtemissao := Date;
    oPedidoModel.codcli    := StrToInt(edtCodigo.Text);
    oPedidoModel.vltotal   := fValTotal;
    oPedidoController := TPedidoController.Create;
    try
      oPedidoController.InserirPedido(oPedidoModel,sErro);
      if sErro <> '' then
      begin
        sMensagem := sErro + #13 + #10;
      end;
      iCodPedido := oPedidoController.RecuperaIDPedido;
    finally
      FreeAndNil(oPedidoController);
    end;
  finally
    FreeAndNil(oPedidoModel);
  end;
  oItensModel := TItensModel.Create;
  try
    oItensController := TItensController.Create;
    cdsItens.First;
    while not cdsItens.Eof do
    begin
      oItensModel.codpedido  := iCodPedido;
      oItensModel.codproduto := cdsItens.FieldByName('codproduto').AsInteger;
      oItensModel.quantidade := cdsItens.FieldByName('quantidade').AsFloat;
      oItensModel.vlunitario := cdsItens.FieldByName('vlunitario').AsFloat;
      oItensModel.vlTotal    := cdsItens.FieldByName('vltotal').AsFloat;
      sErro := '';
      oItensController.Inserir(oItensModel,sErro);
      if sErro <> '' then
      begin
        sMensagem := sErro + #13 + #10;
      end;
      cdsItens.Next;
    end;
  finally
    FreeAndnIl(oItensModel);
  end;
  cdsItens.EnableControls;
  if sMensagem <> '' then
  begin
    dmConexao.fdConexao.Rollback;
    MessageDlg(sMensagem,TMsgDlgType.mtError,[mbOk],0,mbOK);
  end
  else
  begin
    dmConexao.fdConexao.CommitRetaining;
  end;
  LimpaForm;
end;

procedure TfrmPrincipal.InclueProduto;
begin
  cdsItens.Append;
  cdsItens.FieldByName('codproduto').AsInteger := strtoint(edtCodproduto.Text);
  cdsItens.FieldByName('quantidade').AsFloat   := StrToFloat(edtQtd.Text);
  cdsItens.FieldByName('vlunitario').AsFloat   := strToFloat(edtValUnitario.Text);
  cdsItens.FieldByName('nmproduto').AsString   := edtNomeProduto.Text;
  cdsItens.FieldByName('vltotal').AsFloat      := cdsItens.FieldByName('quantidade').AsFloat *
                                                  cdsItens.FieldByName('vlunitario').AsFloat;
  fValTotal := fValTotal + cdsItens.FieldByName('vltotal').AsFloat;
  cdsItens.Post;
  edtCodProduto.Text  := '';
  edtNomeProduto.Text := '';
  edtQtd.Text         := '';
  edtValUnitario.Text := '';
  lblValorTotal.Caption := FormatFloat('###,###,##0.00',fValTotal);
  edtCodProduto.SetFocus;
end;

procedure TfrmPrincipal.LimpaForm;
begin
  fValTotal := 0.00;
  edtCodigo.Clear;
  edtNomeCliente.Clear;
  edtCodProduto.Clear;
  edtNomeProduto.Clear;
  edtQtd.Clear;
  edtValUnitario.Clear;
  cdsItens.DisableControls;
  cdsItens.EmptyDataSet;
  cdsItens.EnableControls;
  lblValorTotal.Caption := '0,00';
  btnIncluir.Enabled := False;
end;

procedure TfrmPrincipal.RecalculaTotal;
var
  iReg: integer;
begin
  iReg := cdsItens.RecNo;
  cdsItens.DisableControls;
  fValTotal := 0;
  cdsItens.First;
  while not cdsItens.Eof do
  begin
    fValTotal := fValTotal + cdsItens.FieldByName('vltotal').AsFloat;
    cdsItens.Next;
  end;
  cdsItens.RecNo := iReg;
  cdsItens.EnableControls;
  lblValorTotal.Caption := FormatFloat('###,###,##0.00',fValTotal);
end;

end.
