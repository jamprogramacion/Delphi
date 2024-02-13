object frmFiltros: TfrmFiltros
  Left = 0
  Top = 0
  Width = 744
  Height = 159
  TabOrder = 0
  object JAMPanel1: TJAMPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 159
    Align = alClient
    TabOrder = 0
    object JAMPanel2: TJAMPanel
      Left = 221
      Top = 1
      Width = 275
      Height = 157
      Align = alClient
      TabOrder = 0
      object btnAdd: TButton
        Left = 6
        Top = 1
        Width = 80
        Height = 25
        Caption = '>> Añade filtro'
        TabOrder = 0
        OnClick = btnAddClick
      end
      object edFiltro: TJAMEdit
        Left = 5
        Top = 27
        Width = 264
        Height = 21
        TabOrder = 1
        OnKeyPress = edFiltroKeyPress
      end
      object btnDel: TButton
        Left = 189
        Top = 50
        Width = 80
        Height = 25
        Caption = 'Borra filtro <<'
        TabOrder = 2
        OnClick = btnDelClick
      end
      object Panel1: TPanel
        Left = 5
        Top = 92
        Width = 265
        Height = 61
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 3
        object edBuscar: TJAMEdit
          Left = 5
          Top = 7
          Width = 255
          Height = 21
          TabOrder = 0
          OnChange = edBuscarChange
          OnKeyPress = edBuscarKeyPress
        end
        object btnBuscar: TButton
          Left = 180
          Top = 30
          Width = 80
          Height = 25
          Caption = 'Buscar -->'
          TabOrder = 1
          OnClick = btnBuscarClick
        end
      end
      object cbFiltro: TJAMComboBox
        Left = 90
        Top = 3
        Width = 179
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        Sorted = True
        TabOrder = 4
      end
    end
    object JAMPanel3: TJAMPanel
      Left = 496
      Top = 1
      Width = 247
      Height = 157
      Align = alRight
      TabOrder = 1
      object Label2: TLabel
        Left = 6
        Top = 1
        Width = 73
        Height = 13
        Caption = 'Filtros actuales:'
      end
      object lbFiltros: TJAMListBox
        Left = 6
        Top = 16
        Width = 234
        Height = 137
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 0
        OnClick = lbFiltrosClick
      end
    end
    object JAMPanel4: TJAMPanel
      Left = 1
      Top = 1
      Width = 220
      Height = 157
      Align = alLeft
      TabOrder = 2
      object Label1: TLabel
        Left = 7
        Top = 1
        Width = 96
        Height = 13
        Caption = 'Campos disponibles:'
      end
      object lbCampos: TJAMListBox
        Left = 7
        Top = 16
        Width = 206
        Height = 137
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
        OnClick = lbCamposClick
      end
    end
  end
end
