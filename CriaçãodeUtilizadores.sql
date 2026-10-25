-- =========================================================
-- CRIAÇÃO DE UTILIZADORES
-- =========================================================

DROP USER IF EXISTS 'dono_db'@'localhost';
DROP USER IF EXISTS 'equipa30'@'localhost';
DROP USER IF EXISTS 'equipa15'@'localhost';


-- Criação da VIEW para ocultar a Palavra_passe

CREATE OR REPLACE VIEW Utilizador_View AS
SELECT
    ID_utilizador,
    Email,
    Nome,
    Fotografia,
    Nacionalidade
FROM
    JoseTrip.Utilizador;

    
-- Criação do Utilizador Proprietário (Dono / Equipa 32)
CREATE USER 'dono_db'@'localhost' IDENTIFIED BY 'senha_dono_forte';
GRANT ALL PRIVILEGES ON JoseTrip.* TO 'dono_db'@'localhost' WITH GRANT OPTION;


-- Criação do Utilizador Equipa 30
CREATE USER 'equipa30'@'localhost' IDENTIFIED BY 'senha_equipa30';

GRANT SELECT, INSERT, UPDATE, DELETE ON JoseTrip.ArtigodaViagem TO 'equipa30'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON JoseTrip.Avaliação TO 'equipa30'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON JoseTrip.CidadeArtigo TO 'equipa30'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON JoseTrip.PaísArtigo TO 'equipa30'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON JoseTrip.UtilizadorTelemóvel TO 'equipa30'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON JoseTrip.UtilizadorPaísesVisitados TO 'equipa30'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON JoseTrip.Documento TO 'equipa30'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON JoseTrip.Foto TO 'equipa30'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON JoseTrip.Hospedagem TO 'equipa30'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON JoseTrip.Voo TO 'equipa30'@'localhost';
GRANT INSERT, UPDATE, DELETE ON JoseTrip.Utilizador TO 'equipa30'@'localhost';
GRANT SELECT ON JoseTrip.Utilizador_View TO 'equipa30'@'localhost';


-- Criação do Utilizador Equipa 15 (Consulta e Leitura)
CREATE USER 'equipa15'@'localhost' IDENTIFIED BY 'senha_equipa15';

GRANT SELECT ON JoseTrip.ArtigodaViagem TO 'equipa15'@'localhost';
GRANT SELECT ON JoseTrip.Avaliação TO 'equipa15'@'localhost';
GRANT SELECT ON JoseTrip.CidadeArtigo TO 'equipa15'@'localhost';
GRANT SELECT ON JoseTrip.PaísArtigo TO 'equipa15'@'localhost';
GRANT SELECT ON JoseTrip.UtilizadorTelemóvel TO 'equipa15'@'localhost';
GRANT SELECT ON JoseTrip.UtilizadorPaísesVisitados TO 'equipa15'@'localhost';
GRANT SELECT ON JoseTrip.Documento TO 'equipa15'@'localhost';
GRANT SELECT ON JoseTrip.Foto TO 'equipa15'@'localhost';
GRANT SELECT ON JoseTrip.Hospedagem TO 'equipa15'@'localhost';
GRANT SELECT ON JoseTrip.Voo TO 'equipa15'@'localhost';
GRANT SELECT ON JoseTrip.Utilizador_View TO 'equipa15'@'localhost';


-- Aplica as alterações de privilégios no servidor
FLUSH PRIVILEGES;