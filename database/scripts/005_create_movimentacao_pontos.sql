-- ============================================
-- 005 - Tabela: movimentacao_pontos
-- ============================================

CREATE TABLE movimentacao_pontos (
id BIGSERIAL PRIMARY KEY,

usuario_id BIGINT NOT NULL,

tipo_origem      VARCHAR(30) NOT NULL,
tipo_valor       VARCHAR(10) NOT NULL, -- CREDITO / DEBITO

valor            INTEGER NOT NULL,

descricao        TEXT,

ticket_id        BIGINT NULL,

data             DATE NOT NULL,

data_criacao     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
data_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_mov_pontos_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuario(id),

CONSTRAINT fk_mov_pontos_ticket
    FOREIGN KEY (ticket_id)
    REFERENCES ticket(id)

);

-- ============================================
-- Índices
-- ============================================

CREATE INDEX idx_mov_pontos_usuario
ON movimentacao_pontos(usuario_id);

CREATE INDEX idx_mov_pontos_data
ON movimentacao_pontos(data);

CREATE INDEX idx_mov_pontos_tipo_origem
ON movimentacao_pontos(tipo_origem);

-- ============================================
-- Trigger para atualizar data_atualizacao
-- ============================================

CREATE OR REPLACE FUNCTION fn_mov_pontos_atualiza_timestamp()
RETURNS TRIGGER AS $$
BEGIN
NEW.data_atualizacao = CURRENT_TIMESTAMP;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_mov_pontos_atualiza_timestamp
BEFORE UPDATE ON movimentacao_pontos
FOR EACH ROW
EXECUTE FUNCTION fn_mov_pontos_atualiza_timestamp();
