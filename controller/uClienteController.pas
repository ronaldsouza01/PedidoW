unit uClienteController;

interface

uses uClienteModel, udmCliente, System.SysUtils;

type
  TClienteController = class
  public
    Constructor Create;
    Destructor Destroy; override;
    procedure Carregar(oCliente: TClienteModel; iCodCli: integer);
  end;

implementation

{ TClienteController }

procedure TClienteController.Carregar(oCliente: TClienteModel;
  iCodCli: integer);
begin
  dmCliente.Carregar(oCliente,iCodCli);
end;

constructor TClienteController.Create;
begin
  dmCliente := TDMCliente.Create(nil);
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(dmCliente);
  inherited;
end;

end.
