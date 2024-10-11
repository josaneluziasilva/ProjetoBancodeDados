

/*Pergunta 1: Qual é a área total desmatada por bioma em um município específico?*/
SELECT bioma, sum(desmatado) as Total_Desmatado
FROM `basedosdados.br_inpe_prodes.municipio_bioma` 
WHERE id_municipio = '2100709'
group by bioma;


/*Pergunta 2: Qual é o bioma com a maior área desmatada em um Município específico?*/
SELECT bioma, sum(desmatado) as Total_Desmatado
FROM `basedosdados.br_inpe_prodes.municipio_bioma` 
WHERE id_municipio = '2100907'
group by bioma
order by sum(desmatado) desc;

/*Pergunta 3: Qual foi a tendência de desmatamento ao longo dos anos em um bioma específico?*/
SELECT bioma, ano, sum(desmatado) as Total_Desmatado
FROM `basedosdados.br_inpe_prodes.municipio_bioma` 
WHERE bioma = 'Caatinga'
group by bioma, ano
order by ano;

/*Pergunta 4: Qual é a média de desmatamento anual por bioma?*/
SELECT bioma, avg(desmatado) as Media_Desmatado
FROM `basedosdados.br_inpe_prodes.municipio_bioma` 
group by bioma;


/*Pergunta 5: Quais municípios apresentaram aumento no desmatamento em um ano específico?*/
SELECT bioma, avg(desmatado) as Media_Desmatado
FROM `basedosdados.br_inpe_prodes.municipio_bioma` 
group by bioma;


/*Pergunta 6: Qual bioma teve o menor desmatamento em um determinado ano?*/
SELECT a.id_municipio, a.bioma, a.desmatado
FROM `basedosdados.br_inpe_prodes.municipio_bioma` a
INNER JOIN (SELECT ano, min(desmatado) as Menor_Desmatamento
            FROM `basedosdados.br_inpe_prodes.municipio_bioma` 
            WHERE ano = 2020
            GROUP BY ano) b
ON a.ano = b.ano
AND a.desmatado = b.Menor_Desmatamento;

/*Pergunta 7: Qual a distribuição do desmatamento por bioma em um gráfico?*/


/*Pergunta 8: Quais municípios tiveram a maior área desmatada no último ano disponível?*/
SELECT c.Ultimo_Ano, a.id_municipio, a.bioma, a.desmatado
FROM `basedosdados.br_inpe_prodes.municipio_bioma` a
INNER JOIN (SELECT max(desmatado) as Maior_Desmatamento
            FROM `basedosdados.br_inpe_prodes.municipio_bioma` ) b
ON a.desmatado = b.Maior_Desmatamento
INNER JOIN (SELECT max(ano) as Ultimo_Ano
            FROM `basedosdados.br_inpe_prodes.municipio_bioma` ) c
ON a.ano = c.Ultimo_Ano


