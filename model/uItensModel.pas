unit uItensModel;

interface

type
TItensModel = Class
  private
    fcoditem: integer;
    fcodpedido: integer;
    fcodproduto: integer;
    fquantidade: double;
    fvlunitario: double;
    fvlTotal: double;
  protected
  public
    property coditem: integer read fcoditem write fcoditem;
    property codpedido: integer read fcodpedido write fcodpedido;
    property codproduto: integer read fcodproduto write fcodproduto;
    property quantidade: double read fquantidade write fquantidade;
    property vlunitario: double read fvlunitario write fvlunitario;
    property vlTotal: double read fvlTotal write fvlTotal;
End;

implementation

end.
