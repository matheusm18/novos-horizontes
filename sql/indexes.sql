-- --
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Trabalho Prático: Viagens virtuais da escola Novos Horizontes
-- Implementação dos índices
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2025, Novembro/Dezembro
-- --

USE ViagensNH;

-- Índice para otimizar a ordenação cronológica (RM7)
CREATE INDEX idx_viagem_data ON Viagem(data_publicacao);

-- Índice para acelerar a ordenação por título (RM13)
CREATE INDEX idx_viagem_titulo ON Viagem(titulo);

-- Índice para otimizar a pesquisa e ordenação alfabética dos alunos (RM8)
CREATE INDEX idx_aluno_nome ON Aluno(nome);

-- <fim>
-- Afonso Barros a112178
-- Luís Pedrosa a112081
-- Diogo Pedrosa a103178
-- Matheus Azevedo a111430
