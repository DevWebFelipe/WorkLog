-- ============================================
-- 001 - Tabela: usuario
-- ============================================

CREATE TABLE usuario (
id BIGSERIAL PRIMARY KEY,

nome            VARCHAR(150) NOT NULL,
login           VARCHAR(100) NOT NULL UNIQUE,
senha           VARCHAR(255) NOT NULL,

ativo           BOOLEAN NOT NULL DEFAULT TRUE,

data_criacao    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
data_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

);

-- ============================================
-- Índices
-- ============================================

CREATE INDEX idx_usuario_login
ON usuario(login);

-- ============================================
-- Trigger para atualizar data_atualizacao
-- ============================================

CREATE OR REPLACE FUNCTION fn_usuario_atualiza_timestamp()
RETURNS TRIGGER AS $$
BEGIN
NEW.data_atualizacao = CURRENT_TIMESTAMP;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_usuario_atualiza_timestamp
BEFORE UPDATE ON usuario
FOR EACH ROW
EXECUTE FUNCTION fn_usuario_atualiza_timestamp();
