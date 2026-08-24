

-- Cria o banco de dados do projeto
CREATE DATABASE loja_informatica;

-- Tabela de produtos vendidos pela loja
CREATE TABLE produto (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10,2),
    quantidade_estoque INT
);

-- Tabela de clientes
CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_cadastro DATE
);

-- Tabela de fornecedores
CREATE TABLE fornecedor (
    id INT PRIMARY KEY,
    razao_social VARCHAR(150),
    cnpj VARCHAR(18),
    telefone VARCHAR(20)
);

-- Tabela de vendas
CREATE TABLE venda (
    id INT PRIMARY KEY,
    data_venda DATE,
    valor_total DECIMAL(10,2),
    forma_pagamento VARCHAR(30)
);