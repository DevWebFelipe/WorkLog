-- ============================================
-- 003 - Tabela: apontamento
-- ============================================

CREATE TABLE apontamento (
id BIGSERIAL PRIMARY KEY,

usuario_id BIGINT NOT NULL,
ticket_id  BIGINT NOT NULL,

data                DATE NOT NULL,
hora_inicio         TIME NOT NULL,
hora_fim            TIME NOT NULL,

descricao           VARCHAR(255),
observacao          TEXT,

solicitado_por      VARCHAR(100),

tipo_servico        VARCHAR(30) NOT NULL,

data_criacao        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
data_atualizacao    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_apontamento_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuario(id),

CONSTRAINT fk_apontamento_ticket
    FOREIGN KEY (ticket_id)
    REFERENCES ticket(id)

);

-- ============================================
-- Índices
-- ============================================

CREATE INDEX idx_apontamento_usuario
ON apontamento(usuario_id);

CREATE INDEX idx_apontamento_ticket
ON apontamento(ticket_id);

CREATE INDEX idx_apontamento_data
ON apontamento(data);

-- ============================================
-- Trigger para atualizar data_atualizacao
-- ============================================

CREATE OR REPLACE FUNCTION fn_apontamento_atualiza_timestamp()
RETURNS TRIGGER AS $$
BEGIN
NEW.data_atualizacao = CURRENT_TIMESTAMP;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_apontamento_atualiza_timestamp
BEFORE UPDATE ON apontamento
FOR EACH ROW
EXECUTE FUNCTION fn_apontamento_atualiza_timestamp();
