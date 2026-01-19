-- --
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Trabalho Prático: Viagens virtuais da escola Novos Horizontes
-- Implementação dos gatilhos
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2025, Novembro/Dezembro
-- --

USE ViagensNH;

-- Gatilho para impedir que uma viagem seja realizada antes da sua data de publicação.
DELIMITER $$
CREATE TRIGGER t_valida_cronologia BEFORE INSERT ON Aluno_Viagem
    FOR EACH ROW
BEGIN
    DECLARE data_pub DATE;

    SELECT data_publicacao INTO data_pub FROM Viagem
    WHERE id_viagem = NEW.id_viagem;

    IF NEW.data_realizacao < data_pub THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro de Integridade: A viagem não pode ser realizada antes da sua data de publicação.';
    END IF;
END $$
DELIMITER ;

-- <fim>
-- Afonso Barros a112178
-- Luís Pedrosa a112081
-- Diogo Pedrosa a103178
-- Matheus Azevedo a111430
