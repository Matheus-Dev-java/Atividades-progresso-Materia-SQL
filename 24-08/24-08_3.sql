
-- adiciona uma coluna nova na tabela produto
ALTER TABLE produto
ADD marca VARCHAR(50);

-- remove uma coluna que nao sera mais usada
ALTER TABLE produto
DROP COLUMN categoria;

-- adiciona coluna de status ativo/inativo no cliente
ALTER TABLE cliente
ADD ativo BOOLEAN;