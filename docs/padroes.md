# 📐 Padrões do Projeto

## 🎯 Objetivo

Definir convenções e padrões de desenvolvimento para garantir organização, padronização e facilidade de manutenção do sistema.

---

## 🧱 Tecnologias

* **Linguagem:** Delphi 11.1 (Alexandria)
* **Framework API:** Horse
* **Arquitetura:** Cliente-Servidor (API + Cliente)
* **Banco de Dados:** Relacional (a definir, com boas práticas modernas)

---

## 🏗️ Arquitetura

O sistema será dividido em camadas:

* **Controller:** Responsável pelas rotas e entrada de dados (HTTP)
* **Service:** Regras de negócio
* **DAO (Data Access Object):** Acesso ao banco de dados
* **VO (Value Object):** Representação das entidades

---

## 📁 Organização de Pastas

```bash
src/
│
├── backend/
│   ├── controllers/
│   ├── services/
│   ├── daos/
│   ├── vos/
│   ├── middlewares/
│   ├── routes/
│   └── utils/
│
├── shared/
│   ├── libUtil/
│   ├── libEnumerado/
│   └── libSistema/
```

---

## 🧠 ORM (Customizado)

Será desenvolvido um ORM próprio com base nas seguintes estruturas:

* **BaseVO**

  * Classe base para todas as entidades
  * Responsável por representar os dados

* **BaseDAO**

  * Classe base para acesso a dados
  * Operações genéricas:

    * Inserir
    * Alterar
    * Excluir
    * Consultar

* Evolução futura:

  * Uso de RTTI
  * Mapeamento automático de propriedades

---

## 🔤 Convenções de Nomenclatura

### 📌 Geral

* Padrão: **camelCase**
* Linguagem: **Português**

---

### 🔹 Variáveis

| Tipo                    | Prefixo |
| ----------------------- | ------- |
| Variáveis de método     | m       |
| Variáveis de formulário | f       |
| Variáveis globais       | g       |

---

### 🔹 Constantes

| Tipo                     | Prefixo |
| ------------------------ | ------- |
| Constantes de método     | cm      |
| Constantes de formulário | cf      |
| Constantes globais       | cg      |

---

### 🔹 Properties

* Prefixo: **F**

Exemplo:

```delphi
FNome: String;
```

---

### 🔹 Units

| Tipo        | Prefixo |
| ----------- | ------- |
| Formulários | uFrm    |
| DataModules | uDM     |

---

### 🔹 Classes

| Tipo        | Convenção   |
| ----------- | ----------- |
| VO          | TabelaVO    |
| DAO         | TabelaDAO   |
| Utilitárias | Sem prefixo |

---

## 📚 Bibliotecas Internas

### 🔹 LibUtil

* Funções utilitárias
* Formatação de valores
* Manipulação de strings
* Funções genéricas

---

### 🔹 LibEnumerado

* Enumeradores reutilizáveis
* Tipos comuns do sistema

---

### 🔹 LibSistema

* Centralizador de `uses`
* Facilita acesso às classes do sistema
* **Não deve conter lógica**
* Atua apenas como atalho

---

## 🗄️ Padrões de Banco de Dados

### 📌 Estrutura Geral

* Uso de **PK (Primary Key)**
* Uso de **FK (Foreign Key)**
* Uso de **Generators/Sequences** para IDs
* Campos de controle:

  * `created_at`
  * `updated_at`

---

### 📌 Nome de Tabelas e Campos

Seguindo padrão da empresa (Silbeck):

| Tabela         | Prefixo |
| -------------- | ------- |
| TABELA         | TAB     |
| TABELA_UM      | TUM     |
| TABELA_UM_DOIS | TUD     |

---

### 📌 Exemplos

```sql
HOS_ID
HOS_NOME
HOS_CPF
HOS_SEXO

EMP_ID
EMP_NOME
```

---

### 📌 Observação

Embora o padrão acima seja utilizado por alinhamento profissional, o projeto poderá adotar **boas práticas modernas de nomenclatura** no banco, priorizando clareza, como:

```sql
usuario_id
usuario_nome
ticket_id
```

---

## 🔗 API

* Padrão REST
* Comunicação via JSON
* Separação clara entre:

  * Controller
  * Service
  * DAO

---

## 🔄 Evolução Planejada

* Desacoplamento total entre frontend e backend
* Substituição futura do frontend Delphi por web
* Possível migração para Java no backend
* Possível uso de banco NoSQL (MongoDB)

---

## ⚠️ Diretrizes Importantes

* Evitar código duplicado
* Priorizar reutilização
* Manter simplicidade sempre que possível
* Evoluir gradualmente (sem overengineering)
* Base robusta, manutenção simplificada

---

## 🚀 Filosofia do Projeto

> “A base se constrói uma vez. A manutenção é eterna.”

Este projeto prioriza:

* Clareza
* Organização
* Facilidade de manutenção
* Aprendizado profundo da arquitetura
