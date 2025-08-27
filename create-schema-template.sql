--Script para criar o schema e as tabelas do clube do livro
CREATE SCHEMA IF NOT EXISTS clube_do_livro;
SET search_path TO clube_do_livro;
--Tabela de livros
CREATE TABLE livros (
    id_livro SERIAL PRIMARY KEY,         -- SERIAL = inteiro que auto incrementa
    nome_livro VARCHAR(100) NOT NULL,    -- Nome do livro (até 100 caracteres)
    autoria VARCHAR(100) NOT NULL,       -- Nome do autor
    editora VARCHAR(100) NOT NULL,       -- Nome da editora
    preco NUMERIC(5,2) NOT NULL          -- Preço do livro com 2 casas decimais
);
--Tabela de estoque
CREATE TABLE estoque (
    id_livro INT PRIMARY KEY,            -- Relaciona com o livro
    qtd_estoque INT NOT NULL,            -- Quantidade disponível
    CONSTRAINT fk_estoque_livros
        FOREIGN KEY (id_livro)           -- Chave estrangeira ligada à tabela livros
        REFERENCES livros (id_livro)
        ON DELETE NO ACTION              -- Se tentar apagar o livro, o estoque bloqueia
);
--Tabela de vendedores e vendas
CREATE TABLE vendedores (
    id_vendedor SERIAL PRIMARY KEY,      -- ID automático do vendedor
    nome_vendedor VARCHAR(255) NOT NULL  -- Nome do vendedor
);
--Tabela de vendas
CREATE TABLE vendas (
    id_pedido SERIAL NOT NULL,           -- Número do pedido (auto incrementa)
    id_vendedor INT NOT NULL,            -- Vendedor que fez a venda
    id_livro INT NOT NULL,               -- Livro vendido
    qtd_vendida INT NOT NULL,            -- Quantidade de livros vendidos
    data_venda DATE NOT NULL,            -- Data da venda
    PRIMARY KEY (id_vendedor, id_pedido),-- Chave primária composta (cada pedido é único por vendedor)
-- Chaves estrangeiras
    CONSTRAINT fk_vendas_vendedor
        FOREIGN KEY (id_vendedor)
        REFERENCES vendedores (id_vendedor)
        ON DELETE CASCADE,               -- 
        CONSTRAINT fk_vendas_livro
        FOREIGN KEY (id_livro)
        REFERENCES livros (id_livro)
        ON DELETE CASCADE                -- Se o livro for apagado, suas vendas também saem
);

INSERT INTO livros (nome_livro, autoria, editora, preco) VALUES
('Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 34.65),
('O Hobbit', 'J.R.R. Tolkien', 'HarperCollins', 42.90),
('1984', 'George Orwell', 'Companhia das Letras', 29.50),
('Dom Casmurro', 'Machado de Assis', 'L&PM', 19.80),
('A Menina que Roubava Livros', 'Markus Zusak', 'Rocco', 36.20);

-- ======================================
-- INSERINDO DADOS NA TABELA LIVROS
-- ======================================
INSERT INTO livros (nome_livro, autoria, editora, preco) VALUES
('Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 34.65),
('O Hobbit', 'J.R.R. Tolkien', 'HarperCollins', 42.90),
('1984', 'George Orwell', 'Companhia das Letras', 29.50),
('Dom Casmurro', 'Machado de Assis', 'L&PM', 19.80),
('A Menina que Roubava Livros', 'Markus Zusak', 'Rocco', 36.20);

-- ======================================
-- INSERINDO DADOS NA TABELA ESTOQUE
-- ======================================
INSERT INTO estoque (id_livro, qtd_estoque) VALUES
(1, 20),
(2, 15),
(3, 30),
(4, 12),
(5, 25);

-- ======================================
-- INSERINDO DADOS NA TABELA VENDEDORES
-- ======================================
INSERT INTO vendedores (nome_vendedor) VALUES
('Ana Paula'),
('Carlos Eduardo'),
('Fernanda Silva'),
('João Pedro');

-- INSERINDO DADOS NA TABELA VENDAS
INSERT INTO estoque (id_livro, qtd_estoque) VALUES
(1, 20),
(2, 15),
(3, 30),
(4, 12),
(5, 25);
--INSERINDO DADOS NA TABELA VENDEDORES
INSERT INTO vendedores (nome_vendedor) VALUES
('Ana Paula'),
('Carlos Eduardo'),
('Fernanda Silva'),
('João Pedro');
--INSERINDO DADOS NA TABELA VENDAS
INSERT INTO vendas (id_vendedor, id_livro, qtd_vendida, data_venda) VALUES
(1, 1, 2, '2025-08-20'),
(1, 3, 1, '2025-08-21'),
(2, 2, 3, '2025-08-21'),
(2, 5, 1, '2025-08-22'),
(3, 4, 2, '2025-08-23'),
(4, 1, 1, '2025-08-23'),
(4, 5, 2, '2025-08-24');

-- Soma de livros vendidos por cada vendedor
SELECT v.nome_vendedor,
       SUM(ve.qtd_vendida) AS total_vendido
FROM vendas ve
JOIN vendedores v ON ve.id_vendedor = v.id_vendedor
GROUP BY v.nome_vendedor
ORDER BY total_vendido DESC;

-- Quantidade total vendida de cada livro
SELECT l.nome_livro,
       SUM(ve.qtd_vendida) AS total_vendido
FROM vendas ve
JOIN livros l ON ve.id_livro = l.id_livro
GROUP BY l.nome_livro
ORDER BY total_vendido DESC;

-- Mostra o estoque disponível de cada livro
SELECT l.nome_livro,
       e.qtd_estoque,
       COALESCE(SUM(ve.qtd_vendida),0) AS total_vendido,
       e.qtd_estoque - COALESCE(SUM(ve.qtd_vendida),0) AS estoque_restante
FROM livros l
JOIN estoque e ON l.id_livro = e.id_livro
LEFT JOIN vendas ve ON l.id_livro = ve.id_livro
GROUP BY l.nome_livro, e.qtd_estoque
ORDER BY estoque_restante ASC;

-- Total de vendas por data
SELECT data_venda,
       SUM(qtd_vendida) AS total_livros_vendidos
FROM vendas
GROUP BY data_venda
ORDER BY data_venda;

-- Total vendido em valor por vendedor
SELECT v.nome_vendedor,
       SUM(ve.qtd_vendida * l.preco) AS total_valor_vendas
FROM vendas ve
JOIN vendedores v ON ve.id_vendedor = v.id_vendedor
JOIN livros l ON ve.id_livro = l.id_livro
GROUP BY v.nome_vendedor
ORDER BY total_valor_vendas DESC;

