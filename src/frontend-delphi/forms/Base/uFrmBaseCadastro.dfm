inherited FrmBaseCadastro: TFrmBaseCadastro
  Caption = 'Cadastro'
  ClientHeight = 112
  ClientWidth = 800
  Constraints.MinHeight = 150
  Constraints.MinWidth = 800
  ExplicitWidth = 812
  ExplicitHeight = 150
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 112
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 312
    ExplicitTop = 56
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlBotoes: TPanel
      Left = 0
      Top = 71
      Width = 800
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 312
      ExplicitTop = 40
      ExplicitWidth = 185
      object tlbBotoes: TToolBar
        Left = 0
        Top = 0
        Width = 123
        Height = 40
        Align = alNone
        ButtonHeight = 38
        ButtonWidth = 41
        Caption = 'tlbBotoes'
        Images = DMImagem.imlImagens16x16
        ShowCaptions = True
        TabOrder = 0
        object btnSalvar: TToolButton
          Left = 0
          Top = 0
          Caption = 'Salvar'
          ImageIndex = 41
          OnClick = btnSalvarClick
        end
        object btnExcluir: TToolButton
          Left = 41
          Top = 0
          Caption = 'Excluir'
          ImageIndex = 11
          OnClick = btnExcluirClick
        end
        object btnSair: TToolButton
          Left = 82
          Top = 0
          Caption = 'Sair'
          ImageIndex = 7
          OnClick = btnSairClick
        end
      end
    end
    object pnlDados: TPanel
      Left = 0
      Top = 0
      Width = 800
      Height = 71
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 312
      ExplicitTop = 40
      ExplicitWidth = 185
      ExplicitHeight = 41
    end
  end
end
