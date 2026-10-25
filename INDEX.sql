-- =========================================================
-- CRIAÇÃO DE INDICES
-- =========================================================

USE `JoseTrip`;

CREATE INDEX idx_artigo_dataPub ON ArtigodaViagem (dataPublicacao);

CREATE INDEX idx_cidadeArtigo_cidade ON CidadeArtigo (cidade);

CREATE INDEX idx_avaliacao_pontuacao ON Avaliação (Pontuação);

CREATE INDEX idx_voo_companhia ON Voo (companhia_aerea);

CREATE INDEX idx_artigo_titulo ON ArtigodaViagem (Título);