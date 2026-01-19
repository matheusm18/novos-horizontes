-- --
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Trabalho Prático: Viagens virtuais da escola Novos Horizontes
-- Criação dos roles
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2025, Novembro/Dezembro
-- --

-- Criação dos roles
CREATE ROLE IF NOT EXISTS 'aluno';
CREATE ROLE IF NOT EXISTS 'professor';
CREATE ROLE IF NOT EXISTS 'bibliotecario';

--  Dar permissões ao role aluno
GRANT INSERT,SELECT ON ViagensNH.Aluno_Viagem TO 'aluno';
GRANT SELECT ON ViagensNH.Viagem TO 'aluno';
GRANT SELECT ON ViagensNH.Conteudo TO 'aluno';
GRANT SELECT ON ViagensNH.Viagem_Disciplina TO 'aluno';
GRANT SELECT ON ViagensNH.Disciplina TO 'aluno';
GRANT SELECT ON ViagensNH.Localizacao TO 'aluno';
GRANT SELECT ON ViagensNH.Cidade TO 'aluno';
GRANT SELECT ON ViagensNH.Pais TO 'aluno';

-- Permissões vistas, procedimentos, funções ao role aluno
GRANT SELECT ON ViagensNH.v_detalhes_viagem TO 'aluno';
GRANT SELECT ON ViagensNH.v_top_alunos TO 'aluno';
GRANT EXECUTE ON FUNCTION ViagensNH.f_total_viagens_aluno TO 'aluno';
GRANT EXECUTE ON PROCEDURE ViagensNH.sp_perfil_preferencias_aluno TO 'aluno';
GRANT EXECUTE ON PROCEDURE ViagensNH.sp_pesquisar_viagem TO 'aluno';
-- REVOKE GRANT OPTION ON ViagensNH.* FROM 'aluno';

-- Dar permissões ao role professor
GRANT SELECT ON ViagensNH.* TO 'professor';
GRANT INSERT,UPDATE ON ViagensNH.Viagem TO 'professor';
GRANT INSERT,UPDATE ON ViagensNH.Conteudo TO 'professor';
GRANT INSERT ON ViagensNH.Localizacao TO 'professor';
GRANT INSERT ON ViagensNH.Cidade TO 'professor';
GRANT INSERT ON ViagensNH.Pais TO 'professor';

-- Permissões vistas, procedimentos, funções ao role professor
GRANT SELECT ON ViagensNH.v_detalhes_viagem TO 'professor';
GRANT SELECT ON ViagensNH.v_top_alunos TO 'professor';
GRANT EXECUTE ON FUNCTION ViagensNH.f_total_viagens_aluno TO 'professor';
GRANT EXECUTE ON FUNCTION ViagensNH.f_taxa_sucesso_viagem TO 'professor';
GRANT EXECUTE ON PROCEDURE ViagensNH.sp_perfil_preferencias_aluno TO 'professor';
GRANT EXECUTE ON PROCEDURE ViagensNH.sp_pesquisar_viagem TO 'professor';
-- REVOKE GRANT OPTION ON ViagensNH.* FROM 'professor';

-- Dar permissões ao role bibliotecario
GRANT SELECT ON ViagensNH.* TO 'bibliotecario';
GRANT DELETE ON ViagensNH.* TO 'bibliotecario';
GRANT INSERT,UPDATE ON ViagensNH.Aluno TO 'bibliotecario';
GRANT INSERT,UPDATE ON ViagensNH.Professor TO 'bibliotecario';
GRANT INSERT,UPDATE ON ViagensNH.Disciplina TO 'bibliotecario';

-- Permissões vistas, procedimentos, funções ao role bibliotecario
GRANT SELECT ON ViagensNH.v_detalhes_viagem TO 'bibliotecario';
GRANT SELECT ON ViagensNH.v_top_alunos TO 'bibliotecario';
GRANT EXECUTE ON FUNCTION ViagensNH.f_total_viagens_aluno TO 'bibliotecario';
GRANT EXECUTE ON FUNCTION ViagensNH.f_taxa_sucesso_viagem TO 'bibliotecario';
GRANT EXECUTE ON PROCEDURE ViagensNH.sp_perfil_preferencias_aluno TO 'bibliotecario';
GRANT EXECUTE ON PROCEDURE ViagensNH.sp_pesquisar_viagem TO 'bibliotecario';
-- REVOKE GRANT OPTION ON ViagensNH.* FROM 'bibliotecario';

-- <fim>
-- Afonso Barros a112178
-- Luís Pedrosa a112081
-- Diogo Pedrosa a103178
-- Matheus Azevedo a111430
