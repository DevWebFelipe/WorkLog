-- ============================================
-- 004 - Tabela: anotacao
-- ============================================

CREATE TABLE anotacao (
id BIGSERIAL PRIMARY KEY,

usuario_id BIGINT NOT NULL,

observacao        TEXT NOT NULL,
finalizado        BOOLEAN NOT NULL DEFAULT FALSE,

data              DATE NOT NULL,

data_criacao      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
data_atualizacao  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_anotacao_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuario(id)

);

-- ============================================
-- Índices
-- ============================================

CREATE INDEX idx_anotacao_usuario
ON anotacao(usuario_id);

CREATE INDEX idx_anotacao_data
ON anotacao(data);

CREATE INDEX idx_anotacao_finalizado
ON anotacao(finalizado);

-- ============================================
-- Trigger para atualizar data_atualizacao
-- ============================================

CREATE OR REPLACE FUNCTION fn_anotacao_atualiza_timestamp()
RETURNS TRIGGER AS $$
BEGIN
NEW.data_atualizacao = CURRENT_TIMESTAMP;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_anotacao_atualiza_timestamp
BEFORE UPDATE ON anotacao
FOR EACH ROW
EXECUTE FUNCTION fn_anotacao_atualiza_timestamp();
