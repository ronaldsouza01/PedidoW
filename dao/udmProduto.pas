unit udmProduto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uProdutoModel;

type
  TdmProduto = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Carregar(oProduto: TProdutoModel; iCodProduto: integer);
  end;

var
  dmProduto: TdmProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

{ TDataModule2 }

procedure TdmProduto.Carregar(oProduto: TProdutoModel; iCodProduto: integer);
var
  fdqProduto: TFDQuery;
begin
  fdqProduto := TFDQuery.Create(nil);
  try
    with fdqProduto, oProduto do
    begin
      Connection := dmConexao.fdConexao;
      SQL.Add('select *');
      SQL.Add('from produto');
      SQL.Add('where codproduto = :pcodproduto');
      ParamByName('pcodproduto').AsInteger := iCodProduto;
      Open;
      codproduto := iCodProduto;
      nmproduto  := FieldByName('nmproduto').AsString;
      vlpreco    := FieldByName('vlpreco').AsFloat;
    end;
  finally
    FreeAndNil(fdqProduto);
  end;
end;

end.
