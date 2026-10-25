-- =========================================================
-- Tradução das Interrogações do Utilizador para SQL
-- =========================================================

Use JoseTrip;

SELECT Título
FROM ArtigodaViagem
WHERE
    dataPublicacao >= '2025-03-01'
    AND dataPublicacao <= '2025-03-30';
    
    

SELECT A.Título, A.ID_artigo, U.Nome, A.preco_total
FROM ArtigodaViagem AS A
JOIN Utilizador AS U 
	ON A.Utilizador_ID = U.ID_utilizador;
    
    
    
SELECT A.Título, A.dataPublicacao, U.Nome
FROM ArtigodaViagem AS A
JOIN Utilizador AS U 
	ON A.Utilizador_ID = U.ID_utilizador
WHERE
    A.dataPublicacao = '2025-03-15';
    
    
SELECT A.ID_artigo, AVG(V.preco_voo) AS Preco_Medio_Voo
FROM ArtigodaViagem AS A
JOIN Voo AS V 
	ON A.ID_artigo = V.ID_artigo
WHERE
    A.ID_artigo = 2
GROUP BY
    A.ID_artigo;
    
    
SELECT C.cidade, AVG(V.preco_voo) AS Preco_Medio_Voo
FROM Voo AS V
JOIN ArtigodaViagem AS A 
	ON V.ID_artigo = A.ID_artigo
JOIN CidadeArtigo AS C 
	ON A.ID_artigo = C.ID_artigo
WHERE
    C.cidade = 'Paris'
GROUP BY
    C.cidade;
    
    
SELECT DISTINCT
    A.Título,
    U.Nome
FROM
    ArtigodaViagem AS A
JOIN
    Avaliação AS V ON A.ID_artigo = V.ID_artigo
JOIN
    Utilizador AS U ON A.Utilizador_ID = U.ID_utilizador
WHERE
    V.Pontuação = 5 OR V.Avaliação_hospedagem = 5 OR V.Avaliação_companhia_aerea = 5;
    
    
SELECT
    companhia_aerea,
    preco_voo,
    duracao_voo
FROM
    Voo
WHERE
    duracao_voo > 240;