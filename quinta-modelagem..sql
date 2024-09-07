-- Tabela de famílias beneficiadas
CREATE TABLE familias (
    id_familia INT PRIMARY KEY AUTO_INCREMENT,
    nome_responsavel VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    membros_familia INT,
    renda_mensal DECIMAL(10, 2),
    data_cadastro DATE DEFAULT CURRENT_DATE
);

-- Tabela de doações
CREATE TABLE doacoes (
    id_doacao INT PRIMARY KEY AUTO_INCREMENT,
    doador VARCHAR(100) NOT NULL,
    data_doacao DATE NOT NULL,
    valor_estimado DECIMAL(10, 2),
    descricao VARCHAR(255)
);

-- Tabela de itens de doação
CREATE TABLE itens_doacao (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_doacao INT,
    nome_item VARCHAR(100),
    quantidade INT,
    CONSTRAINT fk_doacao FOREIGN KEY (id_doacao) REFERENCES doacoes(id_doacao)
);

-- Tabela de participantes das atividades
CREATE TABLE participantes (
    id_participante INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    genero ENUM('Masculino', 'Feminino', 'Outro'),
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

-- Tabela de atividades
CREATE TABLE atividades (
    id_atividade INT PRIMARY KEY AUTO_INCREMENT,
    nome_atividade VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    vagas INT
);

-- Tabela de frequência nas atividades
CREATE TABLE frequencia_atividades (
    id_frequencia INT PRIMARY KEY AUTO_INCREMENT,
    id_atividade INT,
    id_participante INT,
    data_participacao DATE,
    CONSTRAINT fk_atividade FOREIGN KEY (id_atividade) REFERENCES atividades(id_atividade),
    CONSTRAINT fk_participante FOREIGN KEY (id_participante) REFERENCES participantes(id_participante)
);

-- Tabela de distribuição de doações para as famílias
CREATE TABLE distribuicoes (
    id_distribuicao INT PRIMARY KEY AUTO_INCREMENT,
    id_familia INT,
    id_item INT,
    data_distribuicao DATE NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT fk_familia FOREIGN KEY (id_familia) REFERENCES familias(id_familia),
    CONSTRAINT fk_item FOREIGN KEY (id_item) REFERENCES itens_doacao(id_item)
);
