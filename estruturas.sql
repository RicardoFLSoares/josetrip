-- =========================================================
-- DIFERENTES ESTRUTURAS: PROCEDURE, FUNCTION e TRIGGER
-- =========================================================

USE JoseTrip;

DELIMITER $$

CREATE PROCEDURE sp_relatorio_voos_artigo (
    IN artigo_id INT
)
BEGIN
    SELECT
        V.ID_voo,
        V.companhia_aerea,
        V.data_horario_partida,
        V.data_horario_chegada,
        V.duracao_voo,
        V.preco_voo,
        A.Título AS Artigo_Titulo
    FROM
        Voo AS V
    JOIN
        ArtigodaViagem AS A ON V.ID_artigo = A.ID_artigo
    WHERE
        V.ID_artigo = artigo_id;
END $$

DELIMITER ;

CALL sp_relatorio_voos_artigo(2); -- p.e ID: 2

DELIMITER $$

CREATE FUNCTION fn_calcular_duracao_viagem_dias (
    data_inicial DATE,
    data_final DATE
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE duracao_dias INT;
    
    SET duracao_dias = DATEDIFF(data_final, data_inicial) + 1;
    
    RETURN duracao_dias;
END $$

DELIMITER ;

SELECT fn_calcular_duracao_viagem_dias('2025-05-10', '2025-05-15') AS Dias_Totais;

DELIMITER $$

CREATE TRIGGER trg_impedir_remocao_utilizador_com_artigos
BEFORE DELETE ON Utilizador
FOR EACH ROW
BEGIN
    DECLARE num_artigos INT;

    SELECT COUNT(*)
    INTO num_artigos
    FROM ArtigodaViagem
    WHERE Utilizador_ID = OLD.ID_utilizador;

    IF num_artigos > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 
        'Não é possível remover este utilizador. 
		O utilizador ainda possui artigos de viagem publicados.';
    END IF;
END $$

DELIMITER ;

DELETE FROM Utilizador WHERE ID_utilizador = 1; -- dá erro porque não podemos retirar devido ao trigger
