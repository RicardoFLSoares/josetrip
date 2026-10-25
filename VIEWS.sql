-- =========================================================
-- VIEWS
-- =========================================================

USE JoseTrip;

CREATE VIEW vista_artigos_hoje AS
SELECT
    A.Título,
    A.dataPublicacao,
    U.Nome AS Nome_Autor,
    U.Email AS Email_Autor
FROM
    ArtigodaViagem AS A
JOIN	
    Utilizador AS U 
		ON A.Utilizador_ID = U.ID_utilizador
WHERE
    A.dataPublicacao = CURDATE();

SELECT * FROM vista_artigos_hoje;



CREATE VIEW vista_preco_medio_voos_por_cidade AS
SELECT
    C.cidade,
    COUNT(DISTINCT A.ID_artigo) AS Total_Artigos,
    AVG(V.preco_voo) AS Preco_Medio_Voo
FROM
    Voo AS V
JOIN
    ArtigodaViagem AS A ON V.ID_artigo = A.ID_artigo
JOIN
    CidadeArtigo AS C ON A.ID_artigo = C.ID_artigo
GROUP BY
    C.cidade;
    
SELECT *
FROM vista_preco_medio_voos_por_cidade;




CREATE VIEW vista_artigos_top_avaliacao AS
SELECT
    A.ID_artigo,
    A.Título,
    U.Nome AS Nome_Autor,
    A.preco_total,
    V.Comentário
FROM
    ArtigodaViagem AS A
JOIN
    Avaliação AS V ON A.ID_artigo = V.ID_artigo
JOIN
    Utilizador AS U ON A.Utilizador_ID = U.ID_utilizador
WHERE
    V.Pontuação = 5 OR V.Avaliação_hospedagem = 5 OR V.Avaliação_companhia_aerea = 5;

SELECT Título, Nome_Autor, preco_total
FROM vista_artigos_top_avaliacao;
