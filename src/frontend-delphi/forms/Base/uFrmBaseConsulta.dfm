inherited FrmBaseConsulta: TFrmBaseConsulta
  Caption = 'Consulta de cadastros'
  ClientHeight = 600
  ClientWidth = 800
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  OnResize = FormResize
  OnShow = FormShow
  ExplicitWidth = 812
  ExplicitHeight = 638
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 600
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 8
    Padding.Right = 8
    TabOrder = 0
    ExplicitLeft = 312
    ExplicitTop = 272
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlFiltro: TPanel
      Left = 8
      Top = 0
      Width = 784
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 772
      DesignSize = (
        784
        50)
      object lbl1: TLabel
        Left = 0
        Top = 3
        Width = 30
        Height = 15
        Caption = 'Filtrar'
      end
      object btnConsultar: TSpeedButton
        Left = 746
        Top = 18
        Width = 23
        Height = 23
        Hint = 'Consultar'
        Anchors = [akTop, akRight]
        ImageIndex = 39
        Images = DMImagem.imlImagens16x16
        ParentShowHint = False
        ShowHint = True
      end
      object edtFiltro: TEdit
        Left = 0
        Top = 18
        Width = 632
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object chkAtivo: TCheckBox
        Left = 640
        Top = 21
        Width = 97
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Somente ativos'
        TabOrder = 1
      end
    end
    object pnlBotoes: TPanel
      Left = 8
      Top = 560
      Width = 784
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 478
      ExplicitWidth = 772
      object tlbBotoes: TToolBar
        Left = 496
        Top = 0
        Width = 270
        Height = 40
        Align = alNone
        ButtonHeight = 38
        ButtonWidth = 54
        Caption = 'tlbBotoes'
        Images = DMImagem.imlImagens16x16
        ShowCaptions = True
        TabOrder = 0
        object btnRelatorio: TToolButton
          Left = 0
          Top = 0
          Caption = 'Relat'#243'rio'
          ImageIndex = 36
        end
        object btnNovo: TToolButton
          Left = 54
          Top = 0
          Caption = 'Novo'
          ImageIndex = 0
        end
        object btnAlterar: TToolButton
          Left = 108
          Top = 0
          Caption = 'Alterar'
          ImageIndex = 17
        end
        object btnExcluir: TToolButton
          Left = 162
          Top = 0
          Caption = 'Excluir'
          ImageIndex = 11
          OnClick = btnExcluirClick
        end
        object btnSair: TToolButton
          Left = 216
          Top = 0
          Caption = 'Sair'
          ImageIndex = 7
          OnClick = btnSairClick
        end
      end
    end
    object pnlGrid: TPanel
      Left = 8
      Top = 50
      Width = 784
      Height = 510
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 304
      ExplicitTop = 248
      ExplicitWidth = 185
      ExplicitHeight = 41
      object grdConsulta: TDBGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 510
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
end
