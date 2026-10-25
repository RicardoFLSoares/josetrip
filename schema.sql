-- =========================================================
-- SCHEMA
-- =========================================================

CREATE SCHEMA IF NOT EXISTS `JoseTrip`;
USE `JoseTrip` ;

CREATE TABLE IF NOT EXISTS `JoseTrip`.`Utilizador` (
  `ID_utilizador` INT NOT NULL AUTO_INCREMENT,
  `Palavra_passe` VARCHAR(60) NOT NULL,
  `Email` VARCHAR(45) UNIQUE NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Fotografia` VARCHAR(2048) NULL,
  `Nacionalidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_utilizador`));

CREATE TABLE IF NOT EXISTS `JoseTrip`.`UtilizadorTelemóvel` (
  `ID_utilizador` INT NOT NULL,
  `Telemóvel` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ID_utilizador`, `Telemóvel`),
  CONSTRAINT `Id_utilizador2`
    FOREIGN KEY (`ID_utilizador`)
    REFERENCES `JoseTrip`.`Utilizador` (`ID_utilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `JoseTrip`.`UtilizadorPaísesVisitados` (
  `ID_utilizador` INT NOT NULL,
  `PaísesVisitados` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PaísesVisitados`, `ID_utilizador`),
  CONSTRAINT `ID_utilizador`
    FOREIGN KEY (`ID_utilizador`)
    REFERENCES `JoseTrip`.`Utilizador` (`ID_utilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `JoseTrip`.`ArtigodaViagem` (
  `ID_artigo` INT NOT NULL AUTO_INCREMENT,
  `preco_total` DECIMAL(10,2) NULL,
  `dataInicialViagem` DATE NULL,
  `dataFinalViagem` DATE NULL,
  `Título` VARCHAR(45) NOT NULL,
  `dataPublicacao` DATE NOT NULL,
  `Utilizador_ID` INT NOT NULL,
  PRIMARY KEY (`ID_artigo`),
  CONSTRAINT `fk_ArtigodaViagem_Utilizador1`
    FOREIGN KEY (`Utilizador_ID`)
    REFERENCES `JoseTrip`.`Utilizador` (`ID_utilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `JoseTrip`.`CidadeArtigo` (
  `ID_artigo` INT NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cidade`, `ID_artigo`),
  CONSTRAINT `cidade`
    FOREIGN KEY (`ID_artigo`)
    REFERENCES `JoseTrip`.`ArtigodaViagem` (`ID_artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `JoseTrip`.`PaísArtigo` (
  `ID_artigo` INT NOT NULL,
  `país` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`país`, `ID_artigo`),
  CONSTRAINT `país`
    FOREIGN KEY (`ID_artigo`)
    REFERENCES `JoseTrip`.`ArtigodaViagem` (`ID_artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `JoseTrip`.`Avaliação` (
  `ID_artigo` INT NOT NULL,
  `Pontuação` TINYINT NOT NULL,
  `Comentário` VARCHAR(2048) NOT NULL,
  `Avaliação_hospedagem` TINYINT NULL,
  `Avaliação_companhia_aerea` TINYINT NULL,
  
  CONSTRAINT chk_Pontuacao CHECK(Pontuação >= 1 AND Pontuação <= 5),
  CONSTRAINT chk_Hospedagem CHECK(Avaliação_hospedagem IS NULL OR (Avaliação_hospedagem >= 1 AND Avaliação_hospedagem <= 5)),
  CONSTRAINT chk_CompanhiaAerea CHECK(Avaliação_companhia_aerea IS NULL OR (Avaliação_companhia_aerea >= 1 AND Avaliação_companhia_aerea <= 5)),
  
  PRIMARY KEY (`ID_artigo`),
  CONSTRAINT `fk_Avaliação_ArtigodaViagem1`
    FOREIGN KEY (`ID_artigo`)
    REFERENCES `JoseTrip`.`ArtigodaViagem` (`ID_artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `JoseTrip`.`Documento` (
  `ID_documento` INT NOT NULL AUTO_INCREMENT,
  `url_ficheiro` VARCHAR(2048) NOT NULL,
  `nome_ficheiro` VARCHAR(45) NOT NULL,
  `tipo_documento` VARCHAR(45) NOT NULL,
  `ID_artigo` INT NOT NULL,
  PRIMARY KEY (`ID_documento`),
  CONSTRAINT `fk_Documento_ArtigodaViagem1`
    FOREIGN KEY (`ID_artigo`)
    REFERENCES `JoseTrip`.`ArtigodaViagem` (`ID_artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `JoseTrip`.`Foto` (
  `ID_foto` INT NOT NULL AUTO_INCREMENT,
  `URL` VARCHAR(2048) NOT NULL,
  `Legenda` VARCHAR(45) NULL,
  `Data_upload` DATETIME NOT NULL,
  `ID_artigo` INT NOT NULL,
  PRIMARY KEY (`ID_foto`),
  CONSTRAINT `fk_Foto_ArtigodaViagem1`
    FOREIGN KEY (`ID_artigo`)
    REFERENCES `JoseTrip`.`ArtigodaViagem` (`ID_artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `JoseTrip`.`Hospedagem` (
  `ID_hospedagem` INT NOT NULL AUTO_INCREMENT,
  `Data_checkin` DATETIME NOT NULL,
  `data_checkout` DATETIME NOT NULL,
  `localização_hospedagem` VARCHAR(45) NOT NULL,
  `nome_hotel` VARCHAR(45) NOT NULL,
  `ID_artigo` INT NOT NULL,
  PRIMARY KEY (`ID_hospedagem`),
  CONSTRAINT `fk_Hospedagem_ArtigodaViagem1`
    FOREIGN KEY (`ID_artigo`)
    REFERENCES `JoseTrip`.`ArtigodaViagem` (`ID_artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `JoseTrip`.`Voo` (
  `ID_voo` INT NOT NULL AUTO_INCREMENT,
  `data_horario_partida` DATETIME NOT NULL,
  `data_horario_chegada` DATETIME NOT NULL,
  `preco_voo` DECIMAL(10,2) NULL,
  `companhia_aerea` VARCHAR(45) NOT NULL,
  `duracao_voo` SMALLINT GENERATED ALWAYS AS (TIMESTAMPDIFF(MINUTE, data_horario_partida, data_horario_chegada)),
  `ID_artigo` INT NOT NULL,
  PRIMARY KEY (`ID_voo`),
  CONSTRAINT `fk_Voo_ArtigodaViagem1`
    FOREIGN KEY (`ID_artigo`)
    REFERENCES `JoseTrip`.`ArtigodaViagem` (`ID_artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
