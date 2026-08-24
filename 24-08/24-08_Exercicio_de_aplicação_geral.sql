-- exercicio 1: adicionar um novo produto na loja (ddl ja feito antes, aqui eh insert)
insert into produtos (id_produto, nome_produto, categoria, preco, estoque, marca)
values (5, 'webcam full hd', 'periferico', 180.00, 20, 'logitech');

-- exercicio 2: a loja resolveu guardar o peso do produto, entao alteramos a tabela
alter table produtos
add peso_kg decimal(5,2);

-- exercicio 3: atualizar o peso dos produtos cadastrados
update produtos
set peso_kg = 2.50
where id_produto = 1;

update produtos
set peso_kg = 0.10
where id_produto = 2;

-- exercicio 4: listar produtos da categoria periferico, do mais barato pro mais caro
select nome_produto as produto, preco as valor
from produtos
where categoria = 'periferico'
order by preco asc;

-- exercicio 5: listar as 3 categorias diferentes cadastradas na loja
select distinct categoria
from produtos;

-- exercicio 6: mostrar apenas os 2 produtos com maior estoque
select nome_produto, estoque
from produtos
order by estoque desc
limit 2;

-- exercicio 7: remover um produto que saiu de linha
delete from produtos
where id_produto = 5;
