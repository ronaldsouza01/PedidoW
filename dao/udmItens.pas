unit udmItens;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uItensModel, Datasnap.DBClient,
  Datasnap.Provider;

type
  TdmItens = class(TDataModule)
    fdqItens: TFDQuery;
    fdqInsert: TFDQuery;
    fdqUpdate: TFDQuery;
    dspItens: TDataSetProvider;
    cdsItens: TClientDataSet;
    cdsItenscoditem: TLargeintField;
    cdsItenscodpedido: TLargeintField;
    cdsItenscodproduto: TLargeintField;
    cdsItensnmproduto: TWideStringField;
    cdsItensquantidade: TBCDField;
    cdsItensvlunitario: TBCDField;
    cdsItensvltotal: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar(iCodPedido: Integer);
    procedure Carregar(oItens: TItensModel; iCodItem: integer; iCodPedido: integer);
    function Inserir(oItens: TItensModel; out sMensagem: string): Boolean;
  end;

var
  dmItens: TdmItens;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

{ TDataModule2 }

procedure TdmItens.Carregar(oItens: TItensModel; iCodItem, iCodPedido: integer);
var
  fdqItem: TFDQuery;
begin
  fdqItem := TFDQuery.Create(nil);
  try
    with fdqItem do
    begin
      Connection := dmConexao.fdConexao;
      SQL.Add('select *');
      SQL.Add('from itens');
      SQL.Add('where coditem = :pcoditem');
      SQL.Add('and codpedido = :pcodpedido');
      ParamByName('pcoditem').AsInteger   := iCodItem;
      ParamByName('pcodpedido').AsInteger := iCodPedido;
      Open;
      with oItens do
      begin
        coditem    := iCodItem;
        codpedido  := iCodPedido;
        codproduto := FieldByName('codproduto').AsInteger;
        quantidade := FieldByName('quantidade').AsFloat;
        vlunitario := FieldByName('vlunitario').AsFloat;
        vlTotal    := FieldByName('vltotal').AsFloat;
      end;
    end;
  finally
    FreeAndNil(fdqItem);
  end;
end;

function TdmItens.Inserir(oItens: TItensModel; out sMensagem: string): Boolean;
begin

end;

procedure TdmItens.Pesquisar(iCodPedido: Integer);
begin
  if cdsItens.Active then
    cdsItens.Close;
  fdqItens.ParamByName('pcodpedido').AsInteger := iCodPedido;
  cdsItens.Open;
  cdsItens.First;
end;

end.
