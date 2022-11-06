object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 570
  ClientWidth = 840
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object pnlRodape: TPanel
    Left = 0
    Top = 504
    Width = 840
    Height = 66
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 503
    ExplicitWidth = 836
    object btnFechar: TButton
      Left = 755
      Top = 16
      Width = 69
      Height = 41
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pnlCliente: TPanel
    Left = 0
    Top = 0
    Width = 840
    Height = 105
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 836
    object lblCodigo: TLabel
      Left = 25
      Top = 2
      Width = 62
      Height = 15
      Caption = 'C'#243'd Cliente'
    end
    object lblNomeCliente: TLabel
      Left = 114
      Top = 2
      Width = 37
      Height = 15
      Caption = 'Cliente'
    end
    object lblCodProduto: TLabel
      Left = 25
      Top = 49
      Width = 68
      Height = 15
      Caption = 'C'#243'd Produto'
    end
    object lblNomeProduto: TLabel
      Left = 114
      Top = 49
      Width = 43
      Height = 15
      Caption = 'Produto'
    end
    object lblQtd: TLabel
      Left = 530
      Top = 49
      Width = 23
      Height = 15
      Caption = 'Qtd.'
    end
    object lblValUnitario: TLabel
      Left = 603
      Top = 49
      Width = 71
      Height = 15
      Caption = 'Valor Unit'#225'rio'
    end
    object edtCodigo: TEdit
      Left = 25
      Top = 18
      Width = 80
      Height = 23
      TabOrder = 0
      OnKeyPress = edtCodigoKeyPress
    end
    object edtNomeCliente: TEdit
      Left = 114
      Top = 18
      Width = 407
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtCodProduto: TEdit
      Left = 25
      Top = 64
      Width = 80
      Height = 23
      TabOrder = 2
      OnKeyPress = edtCodigoKeyPress
    end
    object edtNomeProduto: TEdit
      Left = 114
      Top = 64
      Width = 407
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtQtd: TEdit
      Left = 528
      Top = 64
      Width = 66
      Height = 23
      Alignment = taRightJustify
      TabOrder = 4
      OnKeyPress = edtCodigoKeyPress
    end
    object edtValUnitario: TEdit
      Left = 603
      Top = 64
      Width = 121
      Height = 23
      Alignment = taRightJustify
      TabOrder = 5
      OnExit = edtValUnitarioExit
      OnKeyPress = edtValUnitarioKeyPress
    end
    object btnIncluir: TButton
      Left = 755
      Top = 55
      Width = 69
      Height = 41
      Caption = 'Incluir'
      TabOrder = 6
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 105
    Width = 840
    Height = 399
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 836
    ExplicitHeight = 398
    object dbgItens: TDBGrid
      Left = 1
      Top = 1
      Width = 838
      Height = 397
      Align = alClient
      DataSource = dsItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nmproduto'
          Width = 420
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vlunitario'
          Title.Alignment = taRightJustify
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vlTotal'
          Title.Alignment = taRightJustify
          Width = 150
          Visible = True
        end>
    end
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 401
    object cdsItenscodproduto: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'codproduto'
    end
    object cdsItensquantidade: TFloatField
      DisplayLabel = 'Qtd.'
      FieldName = 'quantidade'
    end
    object cdsItensvlunitario: TFloatField
      DisplayLabel = 'R$ Unit'#225'rio'
      FieldName = 'vlunitario'
    end
    object cdsItensvlTotal: TFloatField
      DisplayLabel = 'R$ Total'
      FieldName = 'vlTotal'
    end
    object cdsItensnmproduto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'nmproduto'
      Size = 100
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 568
    Top = 401
  end
end
