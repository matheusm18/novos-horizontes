-- --
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Trabalho Prático: Viagens virtuais da escola Novos Horizontes
-- Criação e atribuição de utilizadores
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2025, Novembro/Dezembro
-- --

-- Criação dos utilizadores
CREATE USER IF NOT EXISTS 'sr_bruno'@'localhost' IDENTIFIED BY 'bibliotecario';
CREATE USER IF NOT EXISTS 'orlando_belo'@'localhost' IDENTIFIED BY 'belo20';
CREATE USER IF NOT EXISTS 'francisco_luciano'@'localhost' IDENTIFIED BY 'xico';

-- Atribuição de roles aos utilizadores
GRANT 'bibliotecario' TO 'sr_bruno'@'localhost';
GRANT 'professor' TO 'orlando_belo'@'localhost';
GRANT 'aluno' TO 'francisco_luciano'@'localhost';

SET DEFAULT ROLE ALL TO 'sr_bruno'@'localhost';
SET DEFAULT ROLE ALL TO 'orlando_belo'@'localhost';
SET DEFAULT ROLE ALL TO 'francisco_luciano'@'localhost';

-- <fim>
-- Afonso Barros a112178
-- Luís Pedrosa a112081
-- Diogo Pedrosa a103178
-- Matheus Azevedo a111430
