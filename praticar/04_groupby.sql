-- Quantos produtos são da categoria de espada? 

--SELECT count(*) AS SaoDaCategoriaEspada

--FROM produtos

--WHERE DescCategoriaProduto = 'espada'

Select DescCategoriaProduto,
    count(*)

FROM produtos

--WHERE DescCategoriaProduto = 'espada'

GROUP BY DescCategoriaProduto


