CREATE TABLE empresa (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    hash_senha VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT
);

CREATE TABLE veiculo (
    placa VARCHAR(7) PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    empresa_cnpj VARCHAR(14),
    CONSTRAINT fk_empresa_veiculo
        FOREIGN KEY (empresa_cnpj)
        REFERENCES empresa(cnpj)
        ON DELETE CASCADE
);

CREATE TABLE motorista (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnh VARCHAR(20),
    empresa_cnpj VARCHAR(14),
    CONSTRAINT fk_empresa_motorista
        FOREIGN KEY (empresa_cnpj)
        REFERENCES empresa(cnpj)
);

CREATE TABLE vaga (
    id_vaga SERIAL PRIMARY KEY,
    localizacao VARCHAR(150) NOT NULL,
    descricao TEXT
);

CREATE TABLE agendamento (
    id_agendamento SERIAL PRIMARY KEY,
    data_hora_inicio TIMESTAMP NOT NULL,
    data_hora_fim TIMESTAMP NOT NULL,
    status VARCHAR(30) NOT NULL,
    veiculo_placa VARCHAR(7),
    vaga_id INTEGER,
    motorista_cpf VARCHAR(11),
    data_hora_chegada TIMESTAMP,
    data_hora_saida TIMESTAMP,
    ticket VARCHAR(100),
    CONSTRAINT fk_agendamento_veiculo
        FOREIGN KEY (veiculo_placa)
        REFERENCES veiculo(placa),
    CONSTRAINT fk_agendamento_vaga
        FOREIGN KEY (vaga_id)
        REFERENCES vaga(id_vaga),
    CONSTRAINT fk_agendamento_motorista
        FOREIGN KEY (motorista_cpf)
        REFERENCES motorista(cpf),
    CONSTRAINT duracao_maxima
        CHECK (data_hora_fim <= data_hora_inicio + INTERVAL '3 hours')
);

CREATE TABLE infracao (
    id_infracao SERIAL PRIMARY KEY,
    agendamento_id INTEGER,
    tipo VARCHAR(100) NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    descricao TEXT,
    CONSTRAINT fk_infracao_agendamento
        FOREIGN KEY (agendamento_id)
        REFERENCES agendamento(id_agendamento)
        ON DELETE CASCADE
);