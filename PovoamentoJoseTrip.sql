-- =========================================================
-- POVOAMENTO
-- =========================================================

USE `JoseTrip` ;

INSERT INTO `Utilizador` (`Palavra_passe`, `Email`, `Nome`, `Fotografia`, `Nacionalidade`) VALUES
('hash123', 'joana.santos@email.com', 'Joana Santos', NULL, 'Portuguesa'),
('hash456', 'carlos.almeida@email.com', 'Carlos Almeida', 'carlos_img.jpg', 'Brasileiro'),
('hash789', 'ana.gomes@email.com', 'Ana Gomes', NULL, 'Espanhola');

INSERT INTO `UtilizadorTelemóvel` (`ID_utilizador`, `Telemóvel`) VALUES
(1, '910001010'),
(2, '210002020'),
(2, '933334444'),
(3, '966665555');

INSERT INTO `UtilizadorPaísesVisitados` (`ID_utilizador`, `PaísesVisitados`) VALUES
(1, 'França'),
(1, 'Portugal'),
(2, 'Japão'),
(3, 'Itália');

INSERT INTO `ArtigodaViagem` (`preco_total`, `dataInicialViagem`, `dataFinalViagem`, `Título`, `dataPublicacao`, `Utilizador_ID`) VALUES
(450.50, '2025-05-10', '2025-05-15', 'Escapadinha de 5 dias para Paris', '2025-03-01', 1),
(1200.00, '2025-07-01', '2025-07-14', 'Aventura de Verão no Japão', '2025-03-15', 2),
(890.99, '2025-11-20', '2025-11-25', 'Roteiro Gastronómico em Roma', '2025-04-10', 3);

INSERT INTO `CidadeArtigo` (`ID_artigo`, `cidade`) VALUES
(1, 'Paris'),
(2, 'Tóquio'),
(2, 'Quioto'),
(3, 'Roma');

INSERT INTO `PaísArtigo` (`ID_artigo`, `país`) VALUES
(1, 'França'),
(2, 'Japão'),
(3, 'Itália');

INSERT INTO `Voo` (`data_horario_partida`, `data_horario_chegada`, `preco_voo`, `companhia_aerea`, `ID_artigo`) VALUES
('2025-05-10 08:00:00', '2025-05-10 11:30:00', 150.00, 'Air Portugal', 1),
('2025-07-01 14:00:00', '2025-07-02 09:00:00', 450.00, 'Japan Air', 2),
('2025-11-20 10:30:00', '2025-11-20 13:00:00', 120.50, 'Ryanair', 3);

INSERT INTO `Avaliação` (`ID_artigo`, `Pontuação`, `Comentário`, `Avaliação_hospedagem`, `Avaliação_companhia_aerea`) VALUES
(1, 5, 'Viagem excelente, tudo perfeito.', 5, 4),
(2, 4, 'Viagem longa, mas valeu a pena. Companhia aérea podia ser melhor.', 3, 3),
(3, 5, 'Roteiro de sonho e hotéis ótimos.', 5, NULL);

INSERT INTO `Hospedagem` (`Data_checkin`, `data_checkout`, `localização_hospedagem`, `nome_hotel`, `ID_artigo`) VALUES
('2025-05-10 15:00:00', '2025-05-15 11:00:00', 'Paris', 'Hotel Central', 1),
('2025-07-02 16:00:00', '2025-07-08 10:00:00', 'Tóquio', 'Ryo-kan Tradicional', 2),
('2025-11-20 14:00:00', '2025-11-25 12:00:00', 'Roma', 'Boutique Pantheon', 3);

INSERT INTO `Documento` (`url_ficheiro`, `nome_ficheiro`, `tipo_documento`, `ID_artigo`) VALUES
('url_mapa_metro_paris.pdf', 'Mapa Metro Paris', 'PDF', 1),
('url_dicas_japao.docx', 'Dicas de Viagem Japão', 'DOCX', 2),
('url_lista_restaurantes.txt', 'Restaurantes_Roma', 'TXT', 3);

INSERT INTO `Foto` (`URL`, `Legenda`, `Data_upload`, `ID_artigo`) VALUES
('url_paris_torre.jpg', 'Torre Eiffel ao pôr do sol', '2025-05-15 18:00:00', 1),
('url_japao_templo.jpg', 'Templo em Quioto', '2025-07-10 09:00:00', 2),
('url_italia_coliseu.jpg', 'Coliseu com poucas pessoas', '2025-11-22 14:00:00', 3),
('url_paris_museu.jpg', 'Entrada do Museu do Louvre', '2025-05-11 11:00:00', 1);