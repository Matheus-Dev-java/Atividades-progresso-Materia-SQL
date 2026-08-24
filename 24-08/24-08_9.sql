-- distinct remove valores duplicados, mostrando cada categoria uma vez soh

select distinct categoria
from produtos;

-- limit especifica o numero de registros retornados
-- aqui pegamos so os 2 produtos mais caros

select nome_produto, preco
from produtos
order by preco desc
limit 2;

-- alias (as) da um apelido para a coluna, deixando o resultado mais legivel

select nome_produto as produto, preco as valor
from produtos;

-- alias tambem pode ser usado no nome da tabela

select p.nome_produto, p.preco
from produtos as p
where p.categoria = 'notebook';
