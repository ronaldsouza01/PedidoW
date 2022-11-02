unit uPedidoModel;

interface

type

TPedidoModel = class
private
    fcodpedido: integer;
    fcodcli: integer;
    fvltotal: double;
    fdtemissao: tdate;
  { private declarations }
protected
  { protected declarations }
public
  { public declarations }
  property codpedido: integer read fcodpedido write fcodpedido;
  property dtemissao: tdate read fdtemissao write fdtemissao;
  property codcli: integer read fcodcli write fcodcli;
  property vltotal: double read fvltotal write fvltotal;
published
  { published declarations }
end;

implementation

end.
