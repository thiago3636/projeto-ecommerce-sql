-- ============================================
-- PROJETO: Sistema de Vendas / E-commerce
-- Banco de Dados: SQL Server
-- Autor: Thiago Rodrigues 
-- Data: 2026-05-07
-- ============================================


-- ============================================
-- 1. CRIAÇÃO DAS TABELAS
-- ============================================

-- Tabela de Clientes
CREATE TABLE TBL_CLIENTES (
    id_cliente   INT PRIMARY KEY IDENTITY(1,1),
    nome         VARCHAR(100) NOT NULL,
    email        VARCHAR(100),
    telefone     VARCHAR(20),
    cidade       VARCHAR(50),
    data_cadastro DATE DEFAULT GETDATE()
);

-- Tabela de Produtos
CREATE TABLE TBL_PRODUTOS (
    id_produto   INT PRIMARY KEY IDENTITY(1,1),
    nome_produto VARCHAR(100) NOT NULL,
    categoria    VARCHAR(50),
    preco        DECIMAL(10,2) NOT NULL,
    estoque      INT DEFAULT 0
);

-- Tabela de Vendas
CREATE TABLE TBL_VENDAS (
    id_venda     INT PRIMARY KEY IDENTITY(1,1),
    id_cliente   INT FOREIGN KEY REFERENCES TBL_CLIENTES(id_cliente),
    id_produto   INT FOREIGN KEY REFERENCES TBL_PRODUTOS(id_produto),
    quantidade   INT NOT NULL,
    valor_total  DECIMAL(10,2),
    data_venda   DATE DEFAULT GETDATE()
);


-- ============================================
-- 2. INSERÇÃO DE DADOS - CLIENTES
-- ============================================

INSERT INTO TBL_CLIENTES (nome, email, telefone, cidade)
VALUES ('Ana Silva', 'ana@email.com', '21-99001-0001', 'Rio de Janeiro');

INSERT INTO TBL_CLIENTES (nome, email, telefone, cidade)
VALUES ('Carlos Souza', 'carlos@email.com', '11-99002-0002', 'São Paulo');

INSERT INTO TBL_CLIENTES (nome, email, telefone, cidade)
VALUES ('Julia Lima', 'julia@email.com', '31-99003-0003', 'Belo Horizonte');

INSERT INTO TBL_CLIENTES (nome, email, telefone, cidade)
VALUES ('Thiago Costa', 'thiago@email.com', '41-99004-0004', 'Curitiba');

INSERT INTO TBL_CLIENTES (nome, email, telefone, cidade)
VALUES ('Mariana Rocha', 'mari@email.com', '51-99005-0005', 'Porto Alegre');


-- ============================================
-- 3. INSERÇÃO DE DADOS - PRODUTOS
-- ============================================

INSERT INTO TBL_PRODUTOS (nome_produto, categoria, preco, estoque)
VALUES ('Notebook Dell', 'Informática', 3500.00, 10);

INSERT INTO TBL_PRODUTOS (nome_produto, categoria, preco, estoque)
VALUES ('Mouse Gamer', 'Informática', 150.00, 50);

INSERT INTO TBL_PRODUTOS (nome_produto, categoria, preco, estoque)
VALUES ('Headphone JBL', 'Eletrônicos', 299.90, 30);

INSERT INTO TBL_PRODUTOS (nome_produto, categoria, preco, estoque)
VALUES ('Teclado Mecânico', 'Informática', 450.00, 25);

INSERT INTO TBL_PRODUTOS (nome_produto, categoria, preco, estoque)
VALUES ('Monitor 24"', 'Informática', 899.00, 15);


-- ============================================
-- 4. INSERÇÃO DE DADOS - VENDAS
-- ============================================

INSERT INTO TBL_VENDAS (id_cliente, id_produto, quantidade, valor_total, data_venda)
VALUES (1, 2, 1, 150.00, '2026-05-01');

INSERT INTO TBL_VENDAS (id_cliente, id_produto, quantidade, valor_total, data_venda)
VALUES (2, 1, 1, 3500.00, '2026-05-02');

INSERT INTO TBL_VENDAS (id_cliente, id_produto, quantidade, valor_total, data_venda)
VALUES (3, 3, 2, 599.80, '2026-05-03');

INSERT INTO TBL_VENDAS (id_cliente, id_produto, quantidade, valor_total, data_venda)
VALUES (4, 4, 1, 450.00, '2026-05-04');

INSERT INTO TBL_VENDAS (id_cliente, id_produto, quantidade, valor_total, data_venda)
VALUES (5, 5, 1, 899.00, '2026-05-05');

INSERT INTO TBL_VENDAS (id_cliente, id_produto, quantidade, valor_total, data_venda)
VALUES (1, 3, 1, 299.90, '2026-05-06');

INSERT INTO TBL_VENDAS (id_cliente, id_produto, quantidade, valor_total, data_venda)
VALUES (2, 2, 2, 300.00, '2026-05-07');


-- ============================================
-- 5. CONSULTAS
-- ============================================

-- Ver todos os clientes
SELECT * FROM TBL_CLIENTES;

-- Ver todos os produtos
SELECT * FROM TBL_PRODUTOS;

-- Ver todas as vendas com nome do cliente e produto
SELECT
    v.id_venda,
    c.nome        AS cliente,
    p.nome_produto AS produto,
    v.quantidade,
    v.valor_total,
    v.data_venda
FROM TBL_VENDAS v
JOIN TBL_CLIENTES c ON v.id_cliente = c.id_cliente
JOIN TBL_PRODUTOS p ON v.id_produto = p.id_produto
ORDER BY v.data_venda;

-- Total de vendas por cliente
SELECT
    c.nome AS cliente,
    SUM(v.valor_total) AS total_gasto
FROM TBL_VENDAS v
JOIN TBL_CLIENTES c ON v.id_cliente = c.id_cliente
GROUP BY c.nome
ORDER BY total_gasto DESC;
