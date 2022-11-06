unit uItensController;

interface

uses uItensModel, udmItens, System.SysUtils;

type
  TItensController = class
    public
    Constructor Create;
    Destructor Destroy; override;
    procedure Pesquisar(IcodPedido:Integer);
    Function Inserir(oItens: TItensModel; out sMensagem: string): Boolean;
    function Alterar(oItens: TItensModel; out sMensagem: string): Boolean;
  end;

implementation

{ TItensController }

function TItensController.Alterar(oItens: TItensModel;
  out sMensagem: string): Boolean;
begin
  Result := dmItens.Alterar(oItens, sMensagem);
end;

constructor TItensController.Create;
begin
  dmItens := TdmItens.Create(nil);
end;

destructor TItensController.Destroy;
begin
  FreeAndNil(dmItens);
  inherited;
end;

function TItensController.Inserir(oItens: TItensModel;
  out sMensagem: string): Boolean;
begin
  Result := dmItens.Inserir(oItens,sMensagem);
end;

procedure TItensController.Pesquisar(IcodPedido: Integer);
begin
  dmItens.Pesquisar(iCodPedido);
end;

end.
