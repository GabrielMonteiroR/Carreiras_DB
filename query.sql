/*1) retornar os produtos da Classificação 003 e que a unidade de medida não
seja 'UN' R: 139 registros;*/

SELECT p.CODIGO, p.DESCRICAO, p.TIPO, p.CODIGO_CLASSIFICACAO, p.UNIDADE, p.QUANTIDADE, p.VALOR
    FROM produto p
WHERE p.CODIGO_CLASSIFICACAO = '003'
AND p.UNIDADE NOT LIKE 'UN';


/*2) Retornar os produtos da Classificação 003, com a unidade de medida 'UN'
em que a quantidade seja entre 5 e 7 com o valor menor que 10;
R: 27 registros;*/

    SELECT p.CODIGO, p.DESCRICAO, p.TIPO, p.CODIGO_CLASSIFICACAO, p.UNIDADE, p.QUANTIDADE, p.VALOR
    FROM produto p
    WHERE p.UNIDADE = 'UN'
    AND p.CODIGO_CLASSIFICACAO = '003'
    AND p.QUANTIDADE BETWEEN 5 AND 7
    AND p.VALOR < 10;

/*
3) Valor total dos 'biscoito' da base de dados;
R: 3021;*/

    SELECT SUM(p.VALOR * p.QUANTIDADE) AS "VALOR_TOTAL_BISCOITOS"
    FROM produto p
    WHERE p.DESCRICAO LIKE '%biscoito%';

/*4) Validar se existe algum 'martelo' que não pertença a classificação material de
Construção;*/

    SELECT p.DESCRICAO, c.DESCRICAO
    FROM produto p
    INNER JOIN classificacao c
    ON c.CODIGO = p.CODIGO_CLASSIFICACAO
    WHERE c.DESCRICAO NOT LIKE '%Materiais de Construção%'
    AND p.DESCRICAO LIKE '%martelo%'

/*5) Retornar os produtos da classificação EPI que estejam em menos
de 5 caixas;
R: 2 registros;
 */

    SELECT p.CODIGO, p.DESCRICAO, p.TIPO, p.CODIGO_CLASSIFICACAO, p.UNIDADE, p.QUANTIDADE, p.VALOR
    FROM produto p
    INNER JOIN classificacao c
    ON c.CODIGO = p.CODIGO_CLASSIFICACAO
    WHERE c.DESCRICAO LIKE '%EPI%'
    AND p.QUANTIDADE < 5
    AND p.UNIDADE LIKE '%CX%'


/*6) Retornar os produtos da Classificação EPI que NÃO ESTEJA em
caixas e sua quantidade esteja em 10 e 50;
R:9 registros;
 */
    SELECT p.CODIGO, p.DESCRICAO, p.TIPO, p.CODIGO_CLASSIFICACAO, p.UNIDADE, p.QUANTIDADE, p.VALOR
    FROM produto p
    INNER JOIN classificacao c
    ON c.CODIGO = p.CODIGO_CLASSIFICACAO
    WHERE c.DESCRICAO LIKE '%EPI%'
    AND p.QUANTIDADE BETWEEN 10 AND 50
    AND p.UNIDADE NOT LIKE '%CX%'


/*<Exercicios>
7) Retornar todos registros da classificação UNIFORMES com o nome
'camiseta e todos os produtos da classificação MATERIAL ESPORTIVO
e com nome 'bola'
R: 11 registros;*/

    SELECT p.CODIGO, p.DESCRICAO, p.TIPO, p.CODIGO_CLASSIFICACAO, p.UNIDADE, p.QUANTIDADE, p.VALOR
    FROM produto p
    INNER JOIN classificacao c
    ON c.CODIGO = p.CODIGO_CLASSIFICACAO
    WHERE c.DESCRICAO LIKE '%Uniforme%'
    AND P.DESCRICAO LIKE '%Camiseta%'
    OR c.DESCRICAO LIKE '%esportivo%'
    AND p.DESCRICAO LIKE '%bola%';

/*8) Retornar a média do valor dos produtos que a quantidade esteja entre
2 e 4, com valor inferior a 50, que não seja material de construção e que
não seja um 'copo';
R: 18.8688*/

SELECT AVG(p.valor)
FROM produto p
INNER JOIN classificacao c
ON c.CODIGO = p.CODIGO_CLASSIFICACAO
WHERE p.QUANTIDADE BETWEEN 2 AND 4
AND p.VALOR < 50
AND p.DESCRICAO NOT LIKE '%copo%'
AND c.DESCRICAO NOT LIKE '%constru%';

/*9) Retornar o quantidade total de pacotes ( PCT) dos produtos
alimenticios
R: 1165;*/

SELECT SUM(p.QUANTIDADE)
    FROM produto p
INNER JOIN classificacao c
ON c.CODIGO = p.CODIGO_CLASSIFICACAO
WHERE p.UNIDADE = 'PCT'
AND c.DESCRICAO = 'Produtos Alimentícios';

/*10) Retornar apenas o numero total de produtos cadastrados com
unidade pacote e que seja da classificação de alimentos
R: 23 produtos;*/

SELECT p.CODIGO, p.DESCRICAO, p.TIPO, p.CODIGO_CLASSIFICACAO, p.UNIDADE, p.QUANTIDADE, p.VALOR
    FROM produto p
INNER JOIN classificacao c
ON c.CODIGO = p.CODIGO_CLASSIFICACAO
WHERE c.DESCRICAO LIKE '%Alime%'
AND p.UNIDADE = 'PCT';

/*11) Retornar qual é o maior valor de um produto do estoque, este deve
ser o produto que sua quantidade * valor seja o maior
R: 1134870;*/

SELECT p.DESCRICAO, p.QUANTIDADE * p.VALOR AS TOTAL
FROM produto p
WHERE p.TIPO = 'P'
HAVING TOTAL = (
    SELECT MAX(p2.QUANTIDADE * p2.VALOR)
    FROM produto p2
    WHERE p2.TIPO = 'P'
);

/*12) Retornar o menor valor de um produto que a quantidade seja maior
que 0 e que a unidade seja ‘UN’ e classificação alimentos
R: 1; */

SELECT MIN(p.VALOR) AS VALOR_MINIMO
    FROM produto p
INNER JOIN classificacao c
    ON c.CODIGO = p.CODIGO_CLASSIFICACAO
WHERE p.UNIDADE = 'UN'
AND c.DESCRICAO LIKE '%alime%'

/*13) Retornar é o valor total dos produtos da categoria ‘Material
Hospitalares’
R: 406355;*/

SELECT SUM(p.QUANTIDADE * p.VALOR)
    FROM produto p
INNER JOIN classificacao c
    ON c.CODIGO = p.CODIGO_CLASSIFICACAO
WHERE c.DESCRICAO LIKE '%Hospit%'

/*14) Retornar TODOS os valores totais por categoria e ordenar por
categoria*/

SELECT c.DESCRICAO,SUM(p.QUANTIDADE * p.VALOR)
    FROM classificacao c
INNER JOIN
        produto p
    ON p.CODIGO_CLASSIFICACAO = c.CODIGO
GROUP BY c.CODIGO;

/*15) Retornar todos os tipos de ‘UNIDADE’ da classificação Veterinária
R: 12;*/

SELECT p.UNIDADE
    FROM produto p
INNER JOIN classificacao c
    ON c.CODIGO = p.CODIGO_CLASSIFICACAO
WHERE c.DESCRICAO ='Veterinária'
GROUP BY p.UNIDADE;

/*16) Contar Quantos produtos são da categoria de Aviamentos por
unidade. EX: (20 produtos - UN; 2 PRODUTOS - PCT)*/

SELECT p.UNIDADE, SUM(p.QUANTIDADE) AS QUATIDADE
    FROM produto p
INNER JOIN classificacao c
    ON c.CODIGO = p.CODIGO_CLASSIFICACAO
WHERE c.DESCRICAO LIKE '%Aviamento%'
GROUP BY p.UNIDADE;

/*1) Qual Cliente foi a venda ?*/

SELECT c.nome, v.codvenda
    FROM vendas v
INNER JOIN cliente c
    ON c.codcliente = v.codcliente

/*2) Qual Cidade é o cliente ?*/

SELECT c.nome, ci.descricao
    FROM cliente c
INNER JOIN cidades ci
    ON ci.codcidade = c.codcidade

/*3) Quais produtos ele comprou ?*/

SELECT p.DESCRICAO, v.codvenda
    FROM cliente c
INNER JOIN vendas v
    ON v.codcliente = c.codcliente
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto

/*4) Qual quantidade de cada produto ele comprou ?*/

    SELECT p.DESCRICAO, p.QUANTIDADE, v.codvenda
    FROM cliente c
INNER JOIN vendas v
    ON v.codcliente = c.codcliente
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto


/*5) Qual é Classificação do produto ? */

SELECT p.DESCRICAO,cla.DESCRICAO, v.codvenda
    FROM cliente c
INNER JOIN vendas v
    ON v.codcliente = c.codcliente
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto
INNER JOIN classificacao cla
    ON cla.CODIGO = p.CODIGO_CLASSIFICACAO

/*6) Qual nome vendedor ?*/

SELECT p.DESCRICAO,ven.nome, v.codvenda
    FROM cliente c
INNER JOIN vendas v
    ON v.codcliente = c.codcliente
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto
INNER JOIN vendedores ven
    ON ven.codvendedor = v.codvendedor

/*7) Qual valor total de cada produto ?*/

SELECT p.DESCRICAO,p.QUANTIDADE * p.VALOR AS VALOR_TOTAL, v.codvenda
    FROM cliente c
INNER JOIN vendas v
    ON v.codcliente = c.codcliente
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto


/*1) Quantidade de produtos vendidos ?*/

SELECT iv.codvenda,SUM(p.QUANTIDADE) AS QUANTIDADE_VENDAS
    FROM produto p
    INNER JOIN itens_venda iv
    ON iv.codproduto = p.CODIGO
GROUP BY  iv.codvenda;

/*2) Quantidade de vendas por vendedor ?*/

SELECT ven.nome,COUNT(v.codvenda) AS QUANTIDADE_VENDAS
    FROM produto p
    INNER JOIN itens_venda iv
    ON iv.codproduto = p.CODIGO
    INNER JOIN vendas v
    ON v.codvenda = iv.codvenda
    LEFT JOIN vendedores ven
    ON ven.codvendedor = v.codvendedor
GROUP BY  ven.codvendedor;

/*3) Melhor vendedor nos 3 primeiros meses do ano ?*/

SELECT ve.nome, SUM(p.QUANTIDADE * p.VALOR) AS VENDAS
    FROM vendas v
LEFT JOIN vendedores ve
    ON ve.codvendedor = v.codvendedor
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto
WHERE MONTH(v.datavenda) BETWEEN 1 AND 3
GROUP BY ve.codvendedor
HAVING VENDAS = (
    SELECT SUM(p.QUANTIDADE * p.VALOR) AS VENDAS2
    FROM vendas v
LEFT JOIN vendedores ve
    ON ve.codvendedor = v.codvendedor
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto
WHERE MONTH(v.datavenda) BETWEEN 1 AND 3
GROUP BY ve.codvendedor
ORDER BY VENDAS2 DESC
LIMIT 1
    );

/*4) A melhor venda ( valor mais alto) ? */
SELECT v.codvenda, MAX(p.QUANTIDADE * p.VALOR) AS VALOR_TOTAL
    FROM vendas v
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto
GROUP BY v.codvenda
HAVING VALOR_TOTAL = (
    SELECT MAX(p.QUANTIDADE * p.VALOR) AS MAX_VALOR
    FROM vendas v
    INNER JOIN itens_venda iv
        ON iv.codvenda = v.codvenda
    INNER JOIN produto p
        ON p.CODIGO = iv.codproduto
);

/*5) Qual é o valor da Média de vendas por mês ?*/

SELECT MONTH(datavenda) AS MES, AVG(p.QUANTIDADE * p.VALOR) AS MEDIA_VENDAS
    FROM vendas v
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto
GROUP BY MONTH(datavenda);

/*6) Qual cidade compra mais ?*/

SELECT ci.descricao AS CIDADE, SUM(p.QUANTIDADE) AS TOTAL_COMPRAS
    FROM cliente c
INNER JOIN vendas v
    ON v.codcliente = c.codcliente
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto
INNER JOIN cidades ci
    ON ci.codcidade = c.codcidade
GROUP BY ci.descricao
HAVING TOTAL_COMPRAS = (
    SELECT SUM(p.QUANTIDADE) AS MAX_COMPRAS
    FROM cliente c
    INNER JOIN vendas v
        ON v.codcliente = c.codcliente
    INNER JOIN itens_venda iv
        ON iv.codvenda = v.codvenda
    INNER JOIN produto p
        ON p.CODIGO = iv.codproduto
    INNER JOIN cidades ci
        ON ci.codcidade = c.codcidade
    GROUP BY ci.descricao
    ORDER BY MAX_COMPRAS DESC
    LIMIT 1
);

/*7) Qual é o melhor cliente ?*/

SELECT c.nome AS CLIENTE, SUM(p.QUANTIDADE * p.VALOR) AS TOTAL_COMPRAS
    FROM cliente c
INNER JOIN vendas v
    ON v.codcliente = c.codcliente
INNER JOIN itens_venda iv
    ON iv.codvenda = v.codvenda
INNER JOIN produto p
    ON p.CODIGO = iv.codproduto
GROUP BY c.nome
HAVING TOTAL_COMPRAS = (
    SELECT SUM(p.QUANTIDADE * p.VALOR) AS MEDIA_COMPRAS
    FROM cliente c
    INNER JOIN vendas v
        ON v.codcliente = c.codcliente
    INNER JOIN itens_venda iv
        ON iv.codvenda = v.codvenda
    INNER JOIN produto p
        ON p.CODIGO = iv.codproduto
    GROUP BY c.nome
    ORDER BY MEDIA_COMPRAS DESC
    LIMIT 1
);

/*8) O pior vendedor ?*/

SELECT ve.nome AS VENDEDOR, COUNT(v.codvenda) AS QUANTIDADE_VENDAS
    FROM vendas v
LEFT JOIN vendedores ve
    ON ve.codvendedor = v.codvendedor
GROUP BY ve.nome
HAVING QUANTIDADE_VENDAS = (
    SELECT COUNT(v.codvenda) AS QUATIDADE
    FROM vendas v
LEFT JOIN vendedores ve
    ON ve.codvendedor = v.codvendedor
GROUP BY ve.nome
ORDER BY QUATIDADE ASC
LIMIT 1
);

/*9) Comissão de 10% para o vendedor que seu total
de vendas que for acima da média do mês de
todos vendedores ?*/

SELECT ve.nome AS VENDEDOR,
       SUM(p.QUANTIDADE * p.VALOR) AS TOTAL_VENDAS,
       AVG(p.QUANTIDADE * p.VALOR) AS MEDIA_MENSAL,
       CASE WHEN SUM(p.QUANTIDADE * p.VALOR) > AVG(p.QUANTIDADE * p.VALOR) THEN SUM(p.QUANTIDADE * p.VALOR) * 0.1
           END AS COMISSAO
FROM vendas
LEFT JOIN vendedores ve ON ve.codvendedor = vendas.codvendedor
INNER JOIN itens_venda iv ON iv.codvenda = vendas.codvenda
INNER JOIN produto p ON p.CODIGO = iv.codproduto
GROUP BY ve.nome, YEAR(datavenda), MONTH(vendas.datavenda);
