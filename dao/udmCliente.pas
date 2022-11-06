unit udmCliente;

interface

uses
  System.SysUtils, System.Classes, uClienteModel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCliente = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Carregar(oCliente: TClienteModel; iCodCli: Integer);
  end;

var
  dmCliente: TdmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

{ TDataModule1 }

procedure TdmCliente.Carregar(oCliente: TClienteModel; iCodCli: Integer);
var
  fdqCliente: TFDQuery;
begin
  fdqCliente := TFDQuery.Create(nil);
  try
    with fdqCliente, oCliente do
    begin
      Connection := dmConexao.fdConexao;
      SQL.Add('select *');
      SQL.Add('from clientes');
      SQL.Add('where codcli = :pcodcli');
      ParamByName('pcodcli').AsInteger := iCodCli;
      Open;
      codcli    := iCodCli;
      nmcliente := FieldByName('nmcliente').AsString;
      nmcidade  := FieldByName('nmcidade').AsString;
      nmuf      := FieldByName('nmuf').AsString;
    end;
  finally
    FreeAndNil(fdqCliente);
  end;
end;

end.
