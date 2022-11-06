unit uProdutoController;

interface

uses uProdutoModel, udmProduto, System.SysUtils;

type
  TProdutoController = class
  public
    Constructor Create;
    Destructor Destroy; override;
    procedure Carregar(oProduto: TProdutoModel; iCodProd: Integer);
  end;

implementation

{ TProdutoController }

procedure TProdutoController.Carregar(oProduto: TProdutoModel;
  iCodProd: Integer);
begin
  dmProduto.Carregar(oProduto, iCodProd);
end;

constructor TProdutoController.Create;
begin
  dmProduto := TDMProduto.Create(nil);
end;

destructor TProdutoController.Destroy;
begin
  FreeAndNil(dmProduto);
  inherited;
end;

end.
