object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Servidor WorkLog'
  ClientHeight = 239
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 476
    Height = 239
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 8
    Padding.Top = 8
    Padding.Right = 8
    Padding.Bottom = 8
    TabOrder = 0
    ExplicitWidth = 472
    ExplicitHeight = 238
    object mmoLog: TMemo
      Left = 8
      Top = 40
      Width = 460
      Height = 191
      Align = alBottom
      Lines.Strings = (
        'mmoLog')
      TabOrder = 0
    end
    object btnIniciarServer: TButton
      Left = 8
      Top = 8
      Width = 460
      Height = 25
      Align = alTop
      Caption = 'Iniciar servidor'
      TabOrder = 1
      OnClick = btnIniciarServerClick
      ExplicitTop = 0
      ExplicitWidth = 129
    end
  end
end
