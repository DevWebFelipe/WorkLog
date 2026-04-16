# 📌 Escopo do Projeto

## 🎯 Objetivo

WorkLog
Gerenciador de atividades, tickets e anotações

Sistema para gerenciamento de atividades diárias, controle de tickets, apontamentos de tempo e acompanhamento de produtividade com base em metas.

---

## 🔐 Autenticação

* O usuário deve realizar login com usuário e senha
* Os dados do sistema são isolados por usuário

---

## 🎫 Gestão de Tickets

* Registrar tickets da semana
* Registrar tickets emergenciais
* Consultar tickets pendentes
* Consultar tickets finalizados
* Identificar tickets que contam para metas
* Registrar tickets que geraram problema em cliente
* Consultar tickets com problema

---

## ⏱️ Apontamentos

* Registrar apontamentos de trabalho diário
* Associar apontamentos a tickets (quando aplicável)
* Validar:

  * Sobreposição de horários
  * Furos de horário
  * Regras específicas por dia da semana

---

## 📝 Anotações

* Criar anotações livres
* Consultar anotações posteriormente

---

## 📊 Produtividade e Pontuação

* Controle de metas semanais
* Contabilização de tickets finalizados no mês
* Sistema de pontuação:

  * Pontos por ticket finalizado
  * Penalidade por tickets com problema
  * Ajustes manuais (créditos/débitos)
* Visualização de saldo de pontos

---

## 📅 Relatórios

* Geração de resumo diário (para uso em dailies)
* Relatórios com filtros:

  * Período
  * Status do ticket
  * Tipo de ticket

---

## 🚀 Evolução futura

* Separação entre backend (API) e frontend
* Possível migração para frontend web
* Escalabilidade para múltiplos usuários
