# Estrutura de Pastas do Projeto

```
project-root/
├── .git/
├── .gitignore
├── README.MD
├── bin/
│   └── server/
│       ├── debug/
│       │   └── win/
│       └── release/
│           └── win/
├── build/
│   └── DCU/
│       ├── BaseDAO.dcu
│       ├── BaseVO.dcu
│       ├── Horse.Callback.dcu
│       ├── Horse.Commons.dcu
│       ├── Horse.Constants.dcu
│       ├── Horse.Core.dcu
│       ├── Horse.Core.Files.dcu
│       ├── Horse.Core.Group.Contract.dcu
│       ├── Horse.Core.Group.dcu
│       ├── Horse.Core.Param.Config.dcu
│       ├── Horse.Core.Param.dcu
│       ├── Horse.Core.Param.Field.Brackets.dcu
│       ├── Horse.Core.Param.Field.dcu
│       ├── Horse.Core.Param.Header.dcu
│       ├── Horse.Core.Route.Contract.dcu
│       ├── Horse.Core.Route.dcu
│       ├── Horse.Core.RouterTree.dcu
│       ├── Horse.Core.RouterTree.NextCaller.dcu
│       ├── Horse.dcu
│       ├── Horse.Exception.dcu
│       ├── Horse.Exception.Interrupted.dcu
│       ├── Horse.Mime.dcu
│       ├── Horse.Proc.dcu
│       ├── Horse.Provider.Abstract.dcu
│       ├── Horse.Provider.Apache.dcu
│       ├── Horse.Provider.CGI.dcu
│       ├── Horse.Provider.Console.dcu
│       ├── Horse.Provider.Daemon.dcu
│       ├── Horse.Provider.IOHandleSSL.Contract.dcu
│       ├── Horse.Provider.IOHandleSSL.dcu
│       ├── Horse.Provider.ISAPI.dcu
│       ├── Horse.Provider.VCL.dcu
│       ├── Horse.Request.dcu
│       ├── Horse.Response.dcu
│       ├── Horse.Rtti.dcu
│       ├── Horse.Rtti.Helper.dcu
│       ├── Horse.Session.dcu
│       ├── Horse.WebModule.dcu
│       ├── LibSistema.dcu
│       ├── PingController.dcu
│       ├── Routes.dcu
│       ├── Server.dcu
│       ├── uDMConexao.dcu
│       ├── uFrmMain.dcu
│       ├── UsuarioController.dcu
│       ├── UsuarioDAO.dcu
│       └── UsuarioVO.dcu
├── database/
│   ├── models/
│   └── scripts/
│       ├── 001_create_usuario.sql
│       ├── 002_create_ticket.sql
│       ├── 003_create_apontamento.sql
│       ├── 004_create_anotacao.sql
│       └── 005_create_movimentacao_pontos.sql
├── docs/
│   ├── arquitetura.md
│   ├── escopo.md
│   ├── padrao-commit.md
│   ├── padroes.md
│   └── regras-negocio.md
├── src/
│   └── backend/
│       ├── controllers/
│       │   ├── UsuarioController.pas
│       │   ├── __history/
│       │   └── __recovery/
│       ├── daos/
│       │   ├── BaseDAO.pas
│       │   ├── UsuarioDAO.pas
│       │   ├── __history/
│       │   └── __recovery/
│       ├── datamodules/
│       │   ├── uDMConexao.dfm
│       │   ├── uDMConexao.pas
│       │   └── ...
│       ├── middlewares/
│       ├── routes/
│       │   └── ...
│       ├── server/
│       ├── services/
│       ├── utils/
│       └── vos/
│   └── frontend-delphi/
│       ├── WorkLogClient.dpr
│       ├── WorkLogClient.dproj
│       ├── WorkLogClient.dproj.local
│       ├── WorkLogClient.res
│       ├── __history/
│       ├── __recovery/
│       ├── bin/
│       ├── core/
│       ├── forms/
│       ├── libs/
│       ├── models/
│       ├── resources/
│       ├── services/
│       └── utils/
│   └── shared/
│       ├── libEnumerado/
│       ├── libSistema/
│       └── libUtil/
└── tests/
```