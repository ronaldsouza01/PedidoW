unit udmPedido;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    fdqPedidos: TFDQuery;
    fdqPedido: TFDQuery;
    fdqInsert: TFDQuery;
    fdqUpdate: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation
uses
  udmConexao;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
