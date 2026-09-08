
-- ============================================
-- forma nao normalizada (unf) - tudo numa tabela so
-- ============================================
-- repare que aqui o nome e o telefone do cliente se repetem em toda linha,
-- e a coluna "produtos" guarda mais de um valor na mesma celula.

create table pedidos_unf (
  id_pedido int,
  nome_cliente varchar(100),
  telefone_cliente varchar(20),
  produtos varchar(200), -- ex: 'notebook gamer, mouse sem fio'
  valor_total decimal(10,2)
);

insert into pedidos_unf values
(1, 'joao silva', '71999990001', 'notebook gamer, mouse sem fio', 4589.90),
(2, 'maria souza', '71999990002', 'teclado mecanico', 250.00);

-- ============================================
-- 1fn - cada celula com um unico valor (atomicidade)
-- ============================================
-- quebramos a lista de produtos em uma linha por produto.
-- problema que sobra: nome e telefone do cliente ainda se repetem.

create table pedidos_1fn (
  id_pedido int,
  nome_cliente varchar(100),
  telefone_cliente varchar(20),
  produto varchar(100),
  valor_total decimal(10,2)
);

insert into pedidos_1fn values
(1, 'joao silva', '71999990001', 'notebook gamer', 4589.90),
(1, 'joao silva', '71999990001', 'mouse sem fio', 4589.90),
(2, 'maria souza', '71999990002', 'teclado mecanico', 250.00);

-- limpando as tabelas de demonstracao (nao fazem parte do modelo final)
drop table pedidos_unf;
drop table pedidos_1fn;
