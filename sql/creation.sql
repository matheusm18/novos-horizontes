-- --
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Trabalho Prático: Viagens virtuais da escola Novos Horizontes
-- Implementação do Esquema Global
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2025, Novembro/Dezembro
-- --

-- Criação da Base de Dados
-- DROP DATABASE ViagensNH;
CREATE DATABASE IF NOT EXISTS ViagensNH
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Selecionar a base de dados a utilizar
USE ViagensNH;

-- Criação das tabelas da base de dados
-- 
-- Criação da Tabela Professor
CREATE TABLE IF NOT EXISTS Professor (
    id_professor INT NOT NULL,
    nome VARCHAR (100) NOT NULL,
    PRIMARY KEY (id_professor)
);

-- Criação da tabela Aluno
CREATE TABLE IF NOT EXISTS Aluno (
    id_aluno INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    genero ENUM('M', 'F') NOT NULL,
    ano TINYINT NOT NULL,
    letra CHAR(1) NOT NULL,
    PRIMARY KEY (id_aluno)
);

-- Criaçáo da tabela Viagem
CREATE TABLE IF NOT EXISTS Viagem (
    id_viagem INT AUTO_INCREMENT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    data_publicacao DATE NOT NULL DEFAULT (CURRENT_DATE),
    resumo VARCHAR(1000) NOT NULL,
    id_professor INT NOT NULL,
    PRIMARY KEY (id_viagem),
    FOREIGN KEY (id_professor)
        REFERENCES Professor(id_professor)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

-- Criação da tabela Aluno_Viagem
CREATE TABLE IF NOT EXISTS Aluno_Viagem (
    id_aluno INT NOT NULL,
    id_viagem INT NOT NULL,
    avaliacao INT NOT NULL CHECK (avaliacao BETWEEN 0 AND 10),
    comentario VARCHAR(200) NOT NULL,
    data_realizacao DATE NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY(id_aluno,id_viagem),
    FOREIGN KEY (id_aluno)
        REFERENCES Aluno(id_aluno)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (id_viagem)
        REFERENCES Viagem(id_viagem)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
);

-- Criação da tabela Disciplina
CREATE TABLE IF NOT EXISTS Disciplina (
    id_disciplina INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    ano TINYINT NOT NULL,
    PRIMARY KEY (id_disciplina)
);

-- Criação da tabela Viagem_Disciplina
CREATE TABLE IF NOT EXISTS Viagem_Disciplina (
    id_viagem INT NOT NULL,
    id_disciplina INT NOT NULL,
    PRIMARY KEY (id_viagem, id_disciplina),
    FOREIGN KEY (id_viagem)
        REFERENCES Viagem(id_viagem)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    FOREIGN KEY (id_disciplina)
        REFERENCES Disciplina(id_disciplina)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-- Criação da tabela Pais
CREATE TABLE IF NOT EXISTS Pais (
    id_pais INT NOT NULL AUTO_INCREMENT,
    pais VARCHAR(35) NOT NULL,
    PRIMARY KEY (id_pais)
);

-- Criação da tabela Cidade
CREATE TABLE IF NOT EXISTS Cidade (
    id_cidade INT NOT NULL AUTO_INCREMENT,
    cidade VARCHAR(35) NOT NULL,
    id_pais INT NOT NULL,
    PRIMARY KEY (id_cidade),
    FOREIGN KEY (id_pais)
        REFERENCES Pais(id_pais)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-- Criação da tabela Localizacao
CREATE TABLE IF NOT EXISTS Localizacao (
    id_localizacao INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(70) NOT NULL,
    id_cidade INT NOT NULL,
    PRIMARY KEY (id_localizacao),
    FOREIGN KEY (id_cidade)
        REFERENCES Cidade(id_cidade)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-- Criação da tabela Conteudo
CREATE TABLE IF NOT EXISTS Conteudo (
    id_conteudo INT NOT NULL AUTO_INCREMENT,
    url VARCHAR(150) NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    tipo ENUM('F', 'V') NOT NULL,
    data_captura DATE NOT NULL,
    id_viagem INT NOT NULL,
    id_localizacao INT NOT NULL,
    PRIMARY KEY (id_conteudo),
    FOREIGN KEY (id_viagem)
        REFERENCES Viagem(id_viagem)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    FOREIGN KEY (id_localizacao)
        REFERENCES Localizacao(id_localizacao)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-- <fim>
-- Afonso Barros a112178
-- Luís Pedrosa a112081
-- Diogo Pedrosa a103178
-- Matheus Azevedo a111430
-- DROP DATABASE viagensnh;
