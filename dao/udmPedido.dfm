object dmPedido: TdmPedido
  Height = 193
  Width = 446
  object fdqPedidos: TFDQuery
    Connection = dmConexao.fdConexao
    SQL.Strings = (
      
        'select a.codpedido, a.dtemissao, a.codcli, b.nmcliente, a.vltota' +
        'l'
      'from pedido a,'
      '     clientes b'
      'where b.codcli = a.codcli;')
    Left = 48
    Top = 32
  end
  object fdqInsert: TFDQuery
    Connection = dmConexao.fdConexao
    Transaction = dmConexao.fdTransacao
    SQL.Strings = (
      'insert into pedido'
      '(dtemissao,codcli,vltotal)'
      'values'
      '(:pdtemissao,:pcodcli,:pvltotal);')
    Left = 272
    Top = 128
    ParamData = <
      item
        Name = 'PDTEMISSAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'PCODCLI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PVLTOTAL'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object fdqUpdate: TFDQuery
    Connection = dmConexao.fdConexao
    SQL.Strings = (
      'update pedido set'
      'dtemissao = :pdtemissao,'
      'codcli = :pcodcli,'
      'vltotal = :pvltotal'
      'where codpedido = :pcodpedido;')
    Left = 352
    Top = 120
    ParamData = <
      item
        Name = 'PDTEMISSAO'
        FDDataType = dtDate
        ParamType = ptInput
      end
      item
        Name = 'PCODCLI'
        FDDataType = dtInt32
        ParamType = ptInput
      end
      item
        Name = 'PVLTOTAL'
        FDDataType = dtDouble
        ParamType = ptInput
      end
      item
        Name = 'PCODPEDIDO'
        FDDataType = dtInt32
        ParamType = ptInput
      end>
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisar'
    Left = 128
    Top = 32
    object cdsPesquisarcodpedido: TLargeintField
      DisplayLabel = 'C'#243'd.Pedido'
      FieldName = 'codpedido'
    end
    object cdsPesquisardtemissao: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'dtemissao'
    end
    object cdsPesquisarcodcli: TLargeintField
      DisplayLabel = 'C'#243'd.Cliente'
      FieldName = 'codcli'
    end
    object cdsPesquisarvltotal: TBCDField
      DisplayLabel = 'Vl.Total'
      FieldName = 'vltotal'
      Precision = 9
      Size = 2
    end
    object cdsPesquisarnmcliente: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'nmcliente'
      Size = 100
    end
  end
  object dspPesquisar: TDataSetProvider
    DataSet = fdqPedidos
    Left = 208
    Top = 32
  end
end
