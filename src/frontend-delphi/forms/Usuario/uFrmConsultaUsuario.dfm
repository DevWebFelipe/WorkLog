inherited FrmConsultaUsuario: TFrmConsultaUsuario
  Caption = 'Cadastro de usu'#225'rios'
  ClientWidth = 788
  ExplicitWidth = 800
  TextHeight = 15
  inherited pnlFundo: TPanel
    Width = 788
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 788
    ExplicitHeight = 600
    inherited pnlFiltro: TPanel
      Width = 772
    end
    inherited pnlBotoes: TPanel
      Width = 772
      inherited tlbBotoes: TToolBar
        inherited btnNovo: TToolButton
          OnClick = btnNovoClick
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 772
      ExplicitWidth = 772
      inherited grdConsulta: TDBGrid
        Width = 772
      end
    end
  end
end
