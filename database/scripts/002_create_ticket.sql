-- ============================================
-- 002 - Tabela: ticket
-- ============================================

CREATE TABLE ticket (
id BIGSERIAL PRIMARY KEY,

usuario_id BIGINT NOT NULL,

prioridade         INTEGER,
numero             INTEGER NOT NULL UNIQUE,

descricao          VARCHAR(255) NOT NULL,
observacao         TEXT,

status             VARCHAR(30) NOT NULL,
tipo               VARCHAR(30) NOT NULL,

conta_meta_semanal BOOLEAN NOT NULL DEFAULT FALSE,

hotel_nome         VARCHAR(150),

data_criacao       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
data_atualizacao   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
data_finalizacao   TIMESTAMP NULL,

CONSTRAINT fk_ticket_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuario(id)

);

-- ============================================
-- Índices
-- ============================================

CREATE INDEX idx_ticket_usuario
ON ticket(usuario_id);

CREATE INDEX idx_ticket_status
ON ticket(status);

CREATE INDEX idx_ticket_tipo
ON ticket(tipo);

-- ============================================
-- Trigger para atualizar data_atualizacao
-- ============================================

CREATE OR REPLACE FUNCTION fn_ticket_atualiza_timestamp()
RETURNS TRIGGER AS $$
BEGIN
NEW.data_atualizacao = CURRENT_TIMESTAMP;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_ticket_atualiza_timestamp
BEFORE UPDATE ON ticket
FOR EACH ROW
EXECUTE FUNCTION fn_ticket_atualiza_timestamp();
