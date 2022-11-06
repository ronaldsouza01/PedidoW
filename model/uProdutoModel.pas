unit uProdutoModel;

interface

type

TProdutoModel = class
private
  fcodproduto: integer;
	fnmproduto: string;
	fvlpreco: double;
protected
  { protected declarations }
public
  { public declarations }
  property codproduto: integer read fcodproduto write fcodproduto;
  property nmproduto: string read fnmproduto write fnmproduto;
  property vlpreco: double read fvlpreco write fvlpreco;
published
  { published declarations }
end;

implementation

end.
