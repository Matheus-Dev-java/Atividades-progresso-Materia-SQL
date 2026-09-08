-- tema da aula: normalizacao
-- objetivo: mostrar como os dados da loja ficariam se estivessem "todos juntos"
-- (forma nao normalizada) e como chegamos, passo a passo, ate a estrutura que
-- ja vinhamos usando (produtos, clientes, pedidos, itens_pedido).

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

-- ============================================
-- 2fn - remove dependencia parcial: cada entidade ganha sua propria tabela
-- ============================================
-- dados do cliente saem para uma tabela propria (clientes).
-- dados do pedido (sem o produto) ficam em pedidos.
-- isso ja bate com o que a gente ja tinha criado no arquivo anterior!

-- clientes (id_cliente, nome_cliente, telefone, ...) -> ja existe
-- pedidos (id_pedido, id_cliente, valor_total, ...)  -> ja existe

-- ============================================
-- 3fn - remove dependencia transitiva: produto tambem vira sua propria tabela
-- ============================================
-- produto deixa de ser um texto solto dentro do pedido e ganha sua propria
-- tabela (produtos), e a ligacao pedido <-> produto passa a ser feita pela
-- tabela associativa itens_pedido (que criamos no arquivo de chave estrangeira).

-- produtos (id_produto, nome_produto, preco, ...)               -> ja existe
-- itens_pedido (id_item, id_pedido, id_produto, quantidade, ...) -> ja existe

-- ============================================
-- conclusao
-- ============================================
-- as tabelas produtos, clientes, pedidos e itens_pedido que a gente ja vinha
-- usando nos arquivos anteriores sao, na pratica, o resultado de normalizar
-- a tabela "tudo junto" (pedidos_unf) ate a 3fn. cada dado mora em um unico
-- lugar e as chaves estrangeiras garantem a ligacao entre as tabelas.

-- limpando as tabelas de demonstracao (nao fazem parte do modelo final)
drop table pedidos_unf;
drop table pedidos_1fn;
