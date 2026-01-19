-- --
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Trabalho Prático: Viagens virtuais da escola Novos Horizontes
-- Implementação das vistas
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2025, Novembro/Dezembro
-- --

USE ViagensNH;

-- Vista para simplificar a apresentação dos detalhes das viagens
CREATE OR REPLACE VIEW v_detalhes_viagem AS
    SELECT v.id_viagem, v.titulo, v.data_publicacao, p.nome AS Professor, GROUP_CONCAT(CONCAT(d.nome, ' ', d.ano, 'º ano') SEPARATOR ', ') AS Disciplinas FROM Viagem AS v
        INNER JOIN Professor AS p ON v.id_professor = p.id_professor
        INNER JOIN Viagem_Disciplina AS vd ON v.id_viagem = vd.id_viagem
        INNER JOIN Disciplina AS d ON vd.id_disciplina = d.id_disciplina
    GROUP BY v.id_viagem
    ORDER BY v.id_viagem;

-- Vista para consultar o Top 10 de Alunos com mais viagens realizadas
CREATE OR REPLACE VIEW v_top_alunos AS
    SELECT a.id_aluno, a.nome, CONCAT(a.ano,'º',' ',a.letra) AS turma, COUNT(av.id_viagem) AS total_viagens FROM Aluno AS a
        INNER JOIN Aluno_Viagem AS av ON a.id_aluno = av.id_aluno
    GROUP BY a.id_aluno, a.nome
    ORDER BY total_viagens DESC, MAX(av.data_realizacao) ASC
    LIMIT 10;
    
-- <fim>
-- Afonso Barros a112178
-- Luís Pedrosa a112081
-- Diogo Pedrosa a103178
-- Matheus Azevedo a111430
