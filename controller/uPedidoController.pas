unit uPedidoController;

interface

uses
  uPedidoModel;

type
  TPedidoController = class
  public
    function Inserir(oPedido: TPedidoModel; var stErro: string) : Boolean;
  end;
implementation

{ TPedidoController }

function TPedidoController.Inserir(oPedido: TPedidoModel;
  var stErro: string): Boolean;
begin

end;

end.
