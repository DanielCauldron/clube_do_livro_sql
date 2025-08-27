# 📚 Clube do Livro - Projeto SQL

Este projeto é um exemplo de banco de dados para uma livraria, feito para praticar SQL e modelagem de dados.  
Ele inclui o esquema, tabelas, inserção de dados e consultas úteis.

## Estrutura do Banco

O banco possui as seguintes tabelas:

- **livros**: Armazena os livros disponíveis, com nome, autor, editora e preço.
- **estoque**: Controla a quantidade de cada livro disponível.
- **vendedores**: Cadastro dos vendedores da livraria.
- **vendas**: Registra cada venda feita, com vendedor, livro, quantidade e data.

## Funcionalidades

- Criação do schema e tabelas com relacionamentos (chaves primárias e estrangeiras).
- Inserção de dados de exemplo em todas as tabelas.
- Consultas para:
  - Total de livros vendidos por vendedor.
  - Total vendido de cada livro.
  - Estoque restante de cada livro.
  - Total de vendas por data.
  - Valor total vendido por vendedor.

## Como usar

1. Abra o arquivo `create-schema-template.sql`.
2. Execute o script em um banco PostgreSQL (ou compatível).
3. As tabelas serão criadas e preenchidas com dados de exemplo.
4. Use as consultas do final do arquivo para visualizar os resultados.

## Tecnologias

- SQL (PostgreSQL/MySQL)
- VSCode

## Observações

- O projeto serve para estudo e prática de SQL.
- Os dados são fictícios e podem ser alterados conforme necessário.

---