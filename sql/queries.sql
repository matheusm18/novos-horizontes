-- --
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Trabalho Prático: Viagens virtuais da escola Novos Horizontes
-- Implementação das queries
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2025, Novembro/Dezembro
-- --

USE ViagensNH;

-- RM7: Listar todas as viagens disponíveis para uma determinada disciplina dado o seu identificador, ordenadas da mais recente para a mais antiga (apresentando o id, o título, o resumo e a data de publicação)
-- Neste caso, para efeito de demonstração utilizamos id_disciplina = 2
SELECT v.id_viagem, v.titulo, v.resumo, v.data_publicacao FROM Viagem AS v
    INNER JOIN Viagem_Disciplina AS vd ON v.id_viagem = vd.id_viagem
    INNER JOIN Disciplina AS d ON vd.id_disciplina = d.id_disciplina
WHERE d.id_disciplina = 2
ORDER BY v.data_publicacao DESC;

-- RM8: Listar os alunos (id e nome) que realizaram uma determinada viagem, ordenados alfabeticamente, apresentando a sua respetiva avaliação
-- Neste caso, para efeito de demonstração utilizamos id_viagem = 1
SELECT a.id_aluno, a.nome, av.avaliacao FROM Aluno AS a
    INNER JOIN Aluno_Viagem AS av ON a.id_aluno = av.id_aluno
WHERE av.id_viagem = 1
ORDER BY a.nome ASC;

-- RM10: Consultar a classificação média atual de todas as viagens, apresentando o respetivo identificador, título e o valor da média calculada
SELECT v.id_viagem, v.titulo, AVG(av.avaliacao) AS Media FROM Viagem AS v
    INNER JOIN Aluno_Viagem AS av ON v.id_viagem = av.id_viagem
GROUP BY v.id_viagem;

-- RM11: Listar o desempenho dos professores, apresentando o id do professor, nome do professor e o número total de viagens virtuais criadas por cada um, ordenado por ordem decrescente da quantidade de viagens criadas. Além disso, devem ser apresentadas as classificações médias mínimas e máximas das suas viagens.
SELECT p.id_professor, p.nome, COUNT(v.id_viagem) AS total_viagens, MIN(r.nm) AS AvaliacaoMin, MAX(r.nm) AS AvaliacaoMax
FROM Professor AS p
LEFT JOIN Viagem AS v ON p.id_professor = v.id_professor
LEFT JOIN (
        SELECT id_viagem, AVG(avaliacao) AS nm
        FROM Aluno_Viagem
        GROUP BY id_viagem) AS r ON v.id_viagem = r.id_viagem
GROUP BY p.id_professor
ORDER BY total_viagens DESC;

-- <fim>
-- Afonso Barros a112178
-- Luís Pedrosa a112081
-- Diogo Pedrosa a103178
-- Matheus Azevedo a111430
