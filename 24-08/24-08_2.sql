

-- metodo 1: entrada manual (values)
INSERT INTO produto (id, nome, categoria, preco, quantidade_estoque)
VALUES (1, 'Notebook Gamer', 'Notebook', 4500.00, 8);

INSERT INTO produto (id, nome, categoria, preco, quantidade_estoque)
VALUES (2, 'Mouse Sem Fio', 'Periférico', 89.90, 40);

INSERT INTO cliente (id, nome, email, telefone, data_cadastro)
VALUES (1, 'Maria Silva', 'maria.silva@email.com', '(73) 99999-0001', '2026-01-15');

INSERT INTO fornecedor (id, razao_social, cnpj, telefone)
VALUES (1, 'TechParts Distribuidora LTDA', '12.345.678/0001-90', '(11) 4000-1000');

INSERT INTO venda (id, data_venda, valor_total, forma_pagamento)
VALUES (1, '2026-08-10', 4589.90, 'Cartão de Crédito');

-- metodo 2: insert usando select (copiando de uma tabela de origem)
-- exemplo: move produtos com estoque baixo para uma tabela de reposicao
INSERT INTO produto_reposicao (id, nome, quantidade_estoque)
SELECT id, nome, quantidade_estoque
FROM produto
WHERE quantidade_estoque < 5;