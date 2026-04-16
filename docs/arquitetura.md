# 🏗️ Arquitetura do Sistema

## 🎯 Objetivo

Definir a arquitetura do sistema, suas camadas, responsabilidades e fluxo de funcionamento, garantindo organização, escalabilidade e facilidade de manutenção.

---

## 🧠 Visão Geral

O sistema será construído seguindo o modelo **cliente-servidor**, com separação clara entre:

* **Backend (API)** → Responsável por regras de negócio e acesso a dados
* **Frontend (Cliente)** → Responsável pela interface com o usuário

---

## 🧩 Estrutura Geral

```text
[ Cliente (Delphi / Futuro Web) ]
                ↓
        [ API - Horse ]
                ↓
        [ Banco PostgreSQL ]
```

---

## 🔄 Fluxo de Requisição

1. O cliente envia uma requisição HTTP para a API
2. A API recebe a requisição através de uma rota (Controller)
3. O Controller encaminha para o Service
4. O Service aplica as regras de negócio
5. O DAO realiza acesso ao banco de dados
6. O resultado retorna seguindo o fluxo inverso até o cliente

---

## 🧱 Camadas da Aplicação

### 🔹 Controller

Responsável por:

* Receber requisições HTTP
* Validar dados de entrada
* Chamar os Services
* Retornar respostas (JSON)

📌 Não deve conter regra de negócio

---

### 🔹 Service

Responsável por:

* Implementar regras de negócio
* Orquestrar chamadas entre DAOs
* Validar regras específicas do sistema

Exemplos:

* Validação de apontamentos (sobreposição, horários)
* Cálculo de pontuação
* Regras de metas

---

### 🔹 DAO (Data Access Object)

Responsável por:

* Comunicação com o banco de dados
* Execução de queries (INSERT, UPDATE, DELETE, SELECT)
* Persistência dos dados

---

### 🔹 VO (Value Object)

Responsável por:

* Representar entidades do sistema
* Mapear dados entre aplicação e banco

Exemplos:

* UsuarioVO
* TicketVO
* ApontamentoVO

---

## 🧠 ORM Customizado

O projeto utilizará um ORM próprio com as seguintes bases:

### 🔹 BaseVO

* Classe base para todas as entidades
* Contém estrutura comum

### 🔹 BaseDAO

* Classe base para acesso a dados
* Métodos genéricos:

  * Save
  * Delete
  * Find

📌 Evolução futura:

* RTTI para mapeamento automático
* Redução de código repetitivo

---

## 📦 Organização de Código

```text
backend/
├── controllers/
├── services/
├── daos/
├── vos/
├── routes/
├── middlewares/
└── utils/

shared/
├── libUtil/
├── libEnumerado/
└── libSistema/
```

---

## 🔗 API

* Padrão REST
* Comunicação via JSON
* Endpoints organizados por recurso

Exemplos:

* `/login`
* `/tickets`
* `/apontamentos`
* `/anotacoes`

---

## 🗄️ Banco de Dados

* Banco relacional (PostgreSQL)
* Uso de:

  * Primary Keys (PK)
  * Foreign Keys (FK)
  * Sequences (auto incremento)
* Estrutura normalizada

---

## 🔒 Autenticação

* Login com usuário e senha
* Dados isolados por usuário
* Cada entidade possui referência ao usuário (usuario_id)

---

## 📊 Regras de Negócio (Visão Arquitetural)

O sistema centraliza regras importantes na camada de **Service**, como:

* Validação de apontamentos (horários e consistência)
* Controle de metas e pontuação
* Identificação de tickets válidos para metas
* Aplicação de penalidades

---

## 🔄 Evolução da Arquitetura

O sistema será desenvolvido pensando em evolução gradual:

### 🔹 Fase 1

* API + Cliente Delphi
* Banco PostgreSQL local

### 🔹 Fase 2

* API desacoplada
* Melhorias na estrutura

### 🔹 Fase 3

* Frontend web consumindo API

### 🔹 Fase 4 (Opcional)

* Migração de backend (ex: Java)
* Possível uso de banco NoSQL

---

## ⚠️ Diretrizes Arquiteturais

* Separação clara de responsabilidades
* Baixo acoplamento entre camadas
* Evitar lógica no Controller
* Evitar acesso direto ao banco fora do DAO
* Services como centralizadores de regras

---

## 🚀 Princípios do Projeto

* Simplicidade antes de complexidade
* Evolução contínua
* Reutilização de código
* Clareza acima de tudo

---

## 💡 Observação Final

A arquitetura foi pensada para permitir:

* Fácil manutenção
* Escalabilidade
* Troca de tecnologias (principalmente frontend)
* Aprendizado aprofundado de conceitos fundamentais
