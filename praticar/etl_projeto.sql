
WITH tb_transacoes AS (

SELECT idCliente,
       IdTransacao,
       qtdePontos,
       datetime(substr(dtCriacao,1,19)) AS dtCriacao,
       julianday('now') - julianday(substr(dtCriacao,1,10)) AS diffDate
FROM transacoes

),

tb_cliente AS (

        SELECT IdCliente,
               datetime(substr(dtCriacao,1,19)) AS dtCriacao,
               julianday('now') - julianday(substr(dtCriacao,1,10)) AS idadeBase
        FROM clientes


)

SELECT * FROM tb_cliente

--SELECT IdCliente,
       --count(IdTransacao) AS qtdeTransacoesVida,
       --count(CASE WHEN diffDate <= 58 THEN IdTransacao END) AS qtdeTransacoes58,
       --count(CASE WHEN diffDate <= 28 THEN IdTransacao END) AS qtdeTransacoes28,
       --count(CASE WHEN diffDate <= 14 THEN IdTransacao END) AS qtdeTransacoes14,
       --count(CASE WHEN diffDate <= 7  THEN IdTransacao END) AS qtdeTransacoes7,
       --min(diffDate) AS diasUltimaInteracao
--FROM tb_transacoes
--GROUP BY IdCliente


