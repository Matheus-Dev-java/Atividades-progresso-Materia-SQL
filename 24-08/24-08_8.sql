select nome_produto, preco
from produtos;

-- where filtra os registros com uma condicao especifica

select nome_produto, preco
from produtos
where categoria = 'periferico';

-- order by ordena o resultado, asc = crescente, desc = decrescente

select nome_produto, preco
from produtos
order by preco asc;

select nome_produto, preco
from produtos
order by preco desc;

-- juntando where e order by na mesma consulta

select nome_produto, preco, estoque
from produtos
where estoque > 10
order by preco desc;
