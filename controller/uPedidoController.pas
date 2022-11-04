unit uPedidoController;

interface

uses
  uPedidoModel, udmPedido, System.SysUtils;

type
  TPedidoController = class
  public
    Constructor Create;
    Destructor Destroy; override;
    function InserirPedido(oPedido: TPedidoModel; var stErro: string): Boolean;
    function AlterarPedido(oPedido: TPedidoModel; var stErro: string): Boolean;
    procedure CarregarPedido(oPedido: TPedidoModel; iCodPedido: integer);
    function RecuperaIDPedido: Integer;
  end;
implementation

{ TPedidoController }

function TPedidoController.AlterarPedido(oPedido: TPedidoModel;
  var stErro: string): Boolean;
begin
  Result := dmPedido.Alterar(oPedido, stErro);
end;

procedure TPedidoController.CarregarPedido(oPedido: TPedidoModel;
  iCodPedido: integer);
begin
  dmPedido.Carregar(oPedido,iCodPedido);
end;

constructor TPedidoController.Create;
begin
  dmPedido := TdmPedido.Create(nil);
end;

destructor TPedidoController.Destroy;
begin
  FreeAndNil(dmPedido);
  inherited;
end;

function TPedidoController.InserirPedido(oPedido: TPedidoModel;
  var stErro: string): Boolean;
begin
  Result := dmPedido.Inserir(oPedido, stErro);
end;

function TPedidoController.RecuperaIDPedido: Integer;
begin
  Result := dmPedido.RecuperaIDPedido;
end;

end.
