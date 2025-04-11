
-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

-- TABELA: Clientes
CREATE TABLE Clientes (
    idClientes INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    Endereco VARCHAR(45)
);

-- TABELA: Veiculos
CREATE TABLE Veiculos (
    idVeiculos INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(45)
);

-- TABELA: Mecanicos
CREATE TABLE Mecanicos (
    idMecanicos INT AUTO_INCREMENT PRIMARY KEY,
    Codigo VARCHAR(45),
    Nome VARCHAR(45),
    Endereco VARCHAR(45),
    Especialidade VARCHAR(45)
);

-- TABELA: Equipe_Mecanicos
CREATE TABLE Equipe_Mecanicos (
    idEquipe_Mecanicos INT AUTO_INCREMENT PRIMARY KEY
);

-- TABELA: Relacionamento Mecanicos/Equipe
CREATE TABLE Rel_Mecanicos_Equipe (
    Equipe_Mecanicos_idEquipe_Mecanicos INT,
    Mecanicos_idMecanicos INT,
    PRIMARY KEY (Equipe_Mecanicos_idEquipe_Mecanicos, Mecanicos_idMecanicos),
    FOREIGN KEY (Equipe_Mecanicos_idEquipe_Mecanicos) REFERENCES Equipe_Mecanicos(idEquipe_Mecanicos),
    FOREIGN KEY (Mecanicos_idMecanicos) REFERENCES Mecanicos(idMecanicos)
);

-- TABELA: Pedido
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(100)
);

-- TABELA: Relacionamento Cliente/Pedido
CREATE TABLE Rel_Cliente_Pedido (
    Clientes_idClientes INT,
    Pedido_idPedido INT,
    PRIMARY KEY (Clientes_idClientes, Pedido_idPedido),
    FOREIGN KEY (Clientes_idClientes) REFERENCES Clientes(idClientes),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- TABELA: Relacionamento Pedido/Mecanicos
CREATE TABLE Rel_Pedido_Mecanicos (
    Pedido_idPedido INT,
    Mecanicos_idMecanicos INT,
    PRIMARY KEY (Pedido_idPedido, Mecanicos_idMecanicos),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Mecanicos_idMecanicos) REFERENCES Mecanicos(idMecanicos)
);

-- TABELA: Autorização do cliente para o mecânico
CREATE TABLE Autorizacao_Cliente_Mecanico (
    Clientes_idClientes INT,
    Mecanicos_idMecanicos INT,
    Autorizacao_do_cliente VARCHAR(45),
    PRIMARY KEY (Clientes_idClientes, Mecanicos_idMecanicos),
    FOREIGN KEY (Clientes_idClientes) REFERENCES Clientes(idClientes),
    FOREIGN KEY (Mecanicos_idMecanicos) REFERENCES Mecanicos(idMecanicos)
);

-- TABELA: Relacionamento Veiculo/Equipe
CREATE TABLE Rel_Veiculos_Equipe (
    Veiculos_idVeiculos INT,
    Equipe_Mecanicos_idEquipe_Mecanicos INT,
    PRIMARY KEY (Veiculos_idVeiculos, Equipe_Mecanicos_idEquipe_Mecanicos),
    FOREIGN KEY (Veiculos_idVeiculos) REFERENCES Veiculos(idVeiculos),
    FOREIGN KEY (Equipe_Mecanicos_idEquipe_Mecanicos) REFERENCES Equipe_Mecanicos(idEquipe_Mecanicos)
);

-- TABELA: Tipos de Peça
CREATE TABLE Tipos_Peca (
    idTipos_Peca INT AUTO_INCREMENT PRIMARY KEY,
    Tipos_de_peca VARCHAR(45)
);

-- TABELA: Peça
CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY
);

-- TABELA: Relacionamento Peça/Tipo de peça
CREATE TABLE Rel_Peca_Tipo (
    Peca_idPeca INT,
    Tipos_Peca_idTipos_Peca INT,
    PRIMARY KEY (Peca_idPeca, Tipos_Peca_idTipos_Peca),
    FOREIGN KEY (Peca_idPeca) REFERENCES Peca(idPeca),
    FOREIGN KEY (Tipos_Peca_idTipos_Peca) REFERENCES Tipos_Peca(idTipos_Peca)
);

-- TABELA: Serviços
CREATE TABLE Servicos (
    idServicos INT AUTO_INCREMENT PRIMARY KEY,
    Servicos VARCHAR(45)
);

-- TABELA: Ordem de Serviço
CREATE TABLE Ordem_Servico (
    idOrdem_de_Servico INT AUTO_INCREMENT PRIMARY KEY,
    Numero VARCHAR(45),
    Data_de_emissao DATE,
    Status VARCHAR(45),
    Data_para_conclusao DATE,
    Peca_idPeca INT,
    Servicos_idServicos INT,
    FOREIGN KEY (Peca_idPeca) REFERENCES Peca(idPeca),
    FOREIGN KEY (Servicos_idServicos) REFERENCES Servicos(idServicos)
);

-- INSERÇÃO DE DADOS DE TESTE
INSERT INTO Clientes (Nome, Endereco) VALUES ('João da Silva', 'Rua A, 123'), ('Maria Oliveira', 'Av. Central, 456');

INSERT INTO Veiculos (Descricao) VALUES ('Civic 2018'), ('Gol 2010');

INSERT INTO Mecanicos (Codigo, Nome, Endereco, Especialidade) VALUES
('M001', 'Carlos Mendes', 'Rua B, 222', 'Motor'),
('M002', 'Luana Rocha', 'Rua C, 333', 'Freios');

INSERT INTO Equipe_Mecanicos VALUES (1), (2);

INSERT INTO Rel_Mecanicos_Equipe VALUES
(1, 1),
(2, 2);

INSERT INTO Pedido (Descricao) VALUES ('Troca de óleo e filtro'), ('Revisão de freios');

INSERT INTO Rel_Cliente_Pedido VALUES (1, 1), (2, 2);

INSERT INTO Rel_Pedido_Mecanicos VALUES (1, 1), (2, 2);

INSERT INTO Autorizacao_Cliente_Mecanico VALUES
(1, 1, 'Autorizado'),
(2, 2, 'Autorizado');

INSERT INTO Rel_Veiculos_Equipe VALUES
(1, 1),
(2, 2);

INSERT INTO Tipos_Peca (Tipos_de_peca) VALUES ('Filtro de óleo'), ('Pastilha de freio');

INSERT INTO Peca VALUES (1), (2);

INSERT INTO Rel_Peca_Tipo VALUES (1, 1), (2, 2);

INSERT INTO Servicos (Servicos) VALUES ('Troca de óleo'), ('Revisão de freios');

INSERT INTO Ordem_Servico (Numero, Data_de_emissao, Status, Data_para_conclusao, Peca_idPeca, Servicos_idServicos)
VALUES
('OS001', '2024-04-10', 'Em andamento', '2024-04-12', 1, 1),
('OS002', '2024-04-09', 'Concluído', '2024-04-11', 2, 2);
