-- Quantidade de usuários cadastrados (absoluto e acumulado) ao longo do tempo?

WITH tb_qtd_clientes AS (

SELECT DISTINCT
       substr(DtCriacao,1,10) AS dtDia,
       count(idCliente) AS qtdClientes

FROM clientes

GROUP BY dtDia

),

tb_qtd_clientes_acum AS (

SELECT *, 
        sum(qtdClientes) OVER (ORDER BY dtDia) AS qtdClientesAcum
        
FROM tb_qtd_clientes

),

tb_rn_qtd_clientes AS (

SELECT *,
         ROW_NUMBER() OVER (ORDER BY qtdClientesAcum DESC) AS rn

FROM tb_qtd_clientes_acum

),

tb_qtd_clientes_abs AS (

SELECT * FROM tb_rn_qtd_clientes
WHERE rn = 1

)

SELECT t1.dtDia,
       t1.qtdClientes,
       t1.qtdClientesAcum,
       t2.qtdClientesAcum AS qtdClientesAbs

       

FROM tb_qtd_clientes_acum AS t1

LEFT JOIN tb_qtd_clientes_abs AS t2
ON t1.qtdClientes = t2.qtdClientes
ORDER BY t1.dtDia


