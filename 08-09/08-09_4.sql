-- tema da aula: operadores set (union, union all, except/minus, intersect)
-- objetivo: "empilhar" resultados de consultas diferentes, desde que as
-- colunas selecionadas tenham a mesma estrutura (mesma quantidade e tipo).

-- union: junta os nomes de clientes e de fornecedores numa lista so,
-- removendo duplicados (caso o mesmo nome aparecesse nas duas tabelas)
select nome_cliente as nome from clientes
union
select razao_social as nome from fornecedores;

-- union all: igual ao union, mas mantem duplicados (e roda mais rapido,
-- porque nao precisa checar duplicidade)
select nome_cliente as nome from clientes
union all
select razao_social as nome from fornecedores;

-- intersect: mostra produtos que estao ao mesmo tempo em estoque normal
-- e na tabela de promocao (ou seja, o produto esta cadastrado nos dois lugares)
select id_produto from produtos
intersect
select id_produto from produtos_promocao;

-- except (no mysql 8+ tambem funciona "except"; em outros bancos pode ser "minus"):
-- mostra produtos que NAO estao em promocao
select id_produto from produtos
except
select id_produto from produtos_promocao;
