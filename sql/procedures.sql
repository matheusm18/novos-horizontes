-- --
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Trabalho Prático: Viagens virtuais da escola Novos Horizontes
-- Implementação dos procedimentos
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2025, Novembro/Dezembro
-- --

USE ViagensNH;

-- Procedimento para listar as preferências de um aluno específico
DELIMITER $$
CREATE PROCEDURE sp_perfil_preferencias_aluno (IN p_id_aluno INT)
BEGIN
    SELECT a.id_aluno, a.nome, d.nome AS disciplina, AVG(av.avaliacao) AS media_avaliacao, COUNT(av.id_viagem) AS total_viagens FROM Disciplina AS d
        INNER JOIN Viagem_Disciplina AS vd ON d.id_disciplina = vd.id_disciplina
        INNER JOIN Aluno_Viagem AS av ON vd.id_viagem = av.id_viagem
        INNER JOIN Aluno AS a ON a.id_aluno = av.id_aluno
    WHERE a.id_aluno = p_id_aluno
    GROUP BY a.id_aluno, a.nome, d.id_disciplina, d.nome
    ORDER BY media_avaliacao DESC, total_viagens DESC;
END $$
DELIMITER ;

-- Procedimento para pesquisar viagens por texto (título ou resumo)
DELIMITER $$
CREATE PROCEDURE sp_pesquisar_viagem (IN p_termo VARCHAR(100))
BEGIN
    SELECT id_viagem, titulo, resumo, data_publicacao FROM Viagem
        WHERE titulo LIKE CONCAT('%', p_termo, '%') OR resumo LIKE CONCAT('%', p_termo, '%')
    ORDER BY titulo ASC;
END $$
DELIMITER ;

-- <fim>
-- Afonso Barros a112178
-- Luís Pedrosa a112081
-- Diogo Pedrosa a103178
-- Matheus Azevedo a111430
