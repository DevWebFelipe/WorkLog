inherited FrmPrin: TFrmPrin
  Caption = 'WorkLog - Gerenciador de atividades'
  ClientHeight = 600
  ClientWidth = 800
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  ExplicitWidth = 812
  ExplicitHeight = 638
  TextHeight = 15
  object Fundo: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 600
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 8
    Padding.Top = 8
    TabOrder = 0
    ExplicitWidth = 759
    ExplicitHeight = 200
    object pnlMenu: TPanel
      Left = 8
      Top = 8
      Width = 265
      Height = 592
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitHeight = 192
      object btnUsuario: TButton
        Left = 0
        Top = 0
        Width = 265
        Height = 25
        Align = alTop
        Caption = 'Cadastro de usu'#225'rio'
        TabOrder = 0
        OnClick = btnUsuarioClick
      end
    end
  end
end
