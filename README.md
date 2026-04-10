# 📊 Análise de Vendas - Clube do Livro (SQL)

Este projeto simula um sistema de vendas de uma livraria, com foco em análise de dados utilizando SQL.

O objetivo é transformar dados brutos de vendas em **informações estratégicas para tomada de decisão**.

---

## 🎯 Objetivo

Analisar o desempenho de vendas, estoque e faturamento para responder perguntas de negócio como:

* Quem são os vendedores com melhor desempenho?
* Quais livros vendem mais?
* Como está o controle de estoque?
* Qual o faturamento por vendedor?

---

## 🧱 Modelagem de Dados

O banco foi estruturado com 4 tabelas principais:

* **livros** → catálogo de produtos
* **estoque** → controle de disponibilidade
* **vendedores** → equipe comercial
* **vendas** → transações realizadas

Com uso de:

* Chaves primárias (PK)
* Chaves estrangeiras (FK)
* Relacionamentos entre tabelas

---

## 📈 Análises Realizadas

### 🔹 Vendas por vendedor

Identifica os vendedores com maior volume de vendas.

### 🔹 Performance de produtos

Mostra quais livros têm maior saída.

### 🔹 Controle de estoque

Calcula estoque restante com base nas vendas.

### 🔹 Vendas por data

Permite análise temporal do desempenho.

### 🔹 Faturamento total

Calcula receita gerada por vendedor.

---

## 🛠️ Tecnologias

* SQL (PostgreSQL)
* Modelagem de dados relacional

---

## 💡 Insights Gerados

* Identificação de vendedores mais produtivos
* Produtos com maior demanda
* Possíveis riscos de falta de estoque
* Visão de faturamento por responsável

---

## 🚀 Conclusão

Este projeto demonstra a aplicação de SQL para análise de dados de negócio, indo além de consultas básicas e explorando cenários reais de tomada de decisão.

---

## 📂 Como executar

1. Execute o script SQL em um banco PostgreSQL
2. As tabelas e dados serão criados automaticamente
3. Rode as consultas ao final do script para visualizar as análises
