-- --
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Trabalho Prático: Viagens virtuais da escola Novos Horizontes
-- Implementação das funções
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2025, Novembro/Dezembro
-- --

USE ViagensNH;

-- Função para calcular dinamicamente o nº de viagens realizados por um aluno
DELIMITER $$
CREATE FUNCTION f_total_viagens_aluno (p_id_aluno INT)
    RETURNS INT DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE v_total INT;

    SELECT COUNT(*) INTO v_total FROM Aluno_Viagem
        WHERE id_aluno = p_id_aluno;

    RETURN v_total;
END $$
DELIMITER ;

-- Função para calcular percentagem de avaliações positivas (>= 5) de uma viagem
DELIMITER $$
CREATE FUNCTION f_taxa_sucesso_viagem (p_id_viagem INT)
    RETURNS DECIMAL(5,2) DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE v_total INT;
    DECLARE v_positivas INT;

    SELECT COUNT(*) INTO v_total FROM Aluno_Viagem WHERE id_viagem = p_id_viagem;

    IF v_total = 0 THEN RETURN 0.00;
    END IF;

    SELECT COUNT(*) INTO v_positivas FROM Aluno_Viagem
        WHERE id_viagem = p_id_viagem AND avaliacao >= 5;

    RETURN (v_positivas / v_total) * 100;
END $$
DELIMITER ;

-- <fim>
-- Afonso Barros a112178
-- Luís Pedrosa a112081
-- Diogo Pedrosa a103178
-- Matheus Azevedo a111430
