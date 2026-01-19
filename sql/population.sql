-- --
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Trabalho Prático: Viagens virtuais da escola Novos Horizontes
-- Povoamento da Base de Dados
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2025, Novembro/Dezembro
-- --

-- Povoamento da tabela Professor
INSERT INTO Professor (id_professor, nome)
    VALUES
        (5001, 'Marcelo Almeida'),
        (5002, 'Sofia Nunes'),
        (5003, 'Rita Carvalho'),
        (5004, 'Pedro Mendes')
;

-- Povoamento da tabela Aluno
INSERT INTO Aluno (id_aluno, nome, genero, ano, letra)
    VALUES
        (2001, 'Ana Silva', 'F', 9, 'A'),
        (2002, 'Bruno Costa', 'M', 6, 'B'),
        (2003, 'Carla Rocha', 'F', 11, 'A'),
        (2004, 'Diogo Pereira', 'M', 7, 'C'),
        (2005, 'Eva Martins', 'F', 6, 'B'),
        (2006, 'Fábio Santos', 'M', 12, 'A'),
        (2007, 'Gabriela Lopes', 'F', 10, 'C'),
        (2008, 'Henrique Dias', 'M', 12, 'A'),
        (2009, 'Inês Faria', 'F', 7, 'B'),
        (2010, 'João Neves', 'M', 6, 'C')
;

-- Povoamento da tabela Viagem
INSERT INTO Viagem (titulo, data_publicacao, resumo, id_professor)
    VALUES
        ('Lisboa Histórica', '2024-03-12', 'Exploração aprofundada da história de Lisboa, analisando os seus monumentos, evolução urbana e impacto cultural ao longo dos séculos.', 5001),
        ('Porto Animal', '2024-03-20', 'Viagem educativa dedicada ao estudo da fauna, abordando biodiversidade, habitats naturais e a importância da preservação das espécies.', 5002),
        ('Madrid Artística', '2024-04-05', 'Percurso cultural pelos principais museus e espaços artísticos de Madrid, contextualizando as obras e os seus autores.', 5003),
        ('Paris Monumental', '2024-04-18', 'Viagem interdisciplinar que relaciona matemática, arquitetura e história através da análise dos monumentos icónicos de Paris.', 5001),
        ('Roma Antiga', '2024-05-01', 'Exploração detalhada da civilização romana, destacando arquitetura, política e legado cultural da Roma Antiga.', 5004),
        ('Berlim Contemporânea', '2024-05-15', 'Análise da história recente de Berlim, com foco na divisão da cidade, na Guerra Fria e na reunificação alemã.', 5003),
        ('Ciência em Munique', '2024-05-25', 'Viagem virtual dedicada à ciência e tecnologia, explorando museus científicos e inovações desenvolvidas em Munique.', 5002),
        ('Barcelona Criativa', '2024-06-05','Exploração artística e arquitetónica da cidade de Barcelona, com destaque para as obras de Antoni Gaudí.',5001)
;

-- Povoamento da tabela Aluno_Viagem
INSERT INTO Aluno_Viagem (id_aluno, id_viagem, avaliacao, comentario, data_realizacao)
    VALUES
        (2001, 1, 10, 'Viagem extremamente enriquecedora que ajudou a compreender melhor a história e identidade cultural de Lisboa.', '2024-03-13'),
        (2001, 4, 8, 'Gostei muito da ligação entre matemática e arquitetura, especialmente na análise dos monumentos parisienses.', '2024-04-19'),
        (2002, 1, 9, 'Atividade bastante interessante que reforçou os meus conhecimentos sobre a história de Portugal.', '2024-03-13'),
        (2002, 2, 10, 'Experiência educativa e envolvente, com conteúdos bem explicados sobre os animais e os seus habitats.', '2024-03-21'),
        (2003, 2, 8, 'Aprendi bastante sobre biodiversidade e preservação ambiental ao longo da viagem.', '2024-03-21'),
        (2003, 3, 9, 'Viagem cultural muito inspiradora que despertou ainda mais o meu interesse pela arte.', '2024-04-06'),
        (2004, 3, 7, 'Conteúdos bem estruturados que ajudaram a compreender melhor o contexto artístico de Madrid.', '2024-04-06'),
        (2005, 5, 10, 'Excelente abordagem à história romana, com explicações claras e exemplos bem escolhidos.', '2024-05-02'),
        (2005, 8, 7, 'Gostei especialmente da arquitetura de Gaudí e da forma criativa como os conteúdos foram apresentados.', '2024-06-06'),
        (2006, 2, 8, 'Viagem muito bem organizada e educativa, com exemplos claros e interessantes.', '2024-03-21'),
        (2006, 7, 8, 'Experiência bastante interessante que mostrou a importância da ciência e da inovação.', '2024-05-26'),
        (2007, 4, 9, 'A ligação entre diferentes disciplinas tornou a viagem muito mais interessante.', '2024-04-19'),
        (2008, 3, 8, 'Viagem cultural rica e bem contextualizada, com bons exemplos artísticos.', '2024-04-06'),
        (2008, 6, 9, 'Gostei muito da forma como a história recente de Berlim foi explicada.', '2024-05-16'),
        (2009, 5, 7, 'Aprendi bastante sobre a civilização romana e o seu impacto na atualidade.', '2024-05-02'),
        (2010, 1, 8, 'Viagem interessante e bem organizada, com conteúdos claros e acessíveis.', '2024-03-13')
;

-- Povoamento da tabela Disciplina
INSERT INTO Disciplina (nome, ano)
    VALUES     
        ('Educação Visual', 5),
        ('História', 6),
        ('Matemática', 7),
        ('Ciências Naturais', 8),
        ('Física e Química', 9),
        ('Português', 10)
;

-- Povoamento da tabela Viagem_Disciplina
INSERT INTO Viagem_Disciplina (id_viagem, id_disciplina)
    VALUES
        (1,2),
        (2,4),
        (3,1),
        (3,2),
        (4,2),
        (4,3),
        (5,2),
        (6,2),
        (7,5),
        (8,1)
;

-- Povoamento da tabela Pais
INSERT INTO Pais (pais)
    VALUES 
        ('Portugal'),
        ('Espanha'),
        ('França'),
        ('Itália'),
        ('Alemanha')
;

-- Povoamento da tabela Cidade
INSERT INTO Cidade (cidade, id_pais)
    VALUES
        ('Lisboa', 1),
        ('Porto', 1),
        ('Madrid', 2),
        ('Barcelona', 2),
        ('Paris', 3),
        ('Marselha', 3),
        ('Roma', 4),
        ('Milão', 4),
        ('Berlim', 5),
        ( 'Munique', 5)
;

-- Povoamento da tabela Localizacao
INSERT INTO Localizacao (nome, id_cidade)
    VALUES
        ('Torre de Belém', 1),
        ('Zoológico', 1),
        ('Ribeira', 2),
        ('Sé do Porto', 2),
        ('Museu do Prado', 3),
        ('Parque Güell', 4),
        ('Torre Eiffel', 5),
        ('Louvre', 5),
        ('Coliseu', 7),
        ('Porta de Brandemburgo', 9)
;

-- Povoamento da tabela Conteudo
INSERT INTO Conteudo (url, descricao, titulo, tipo, data_captura, id_viagem, id_localizacao)
    VALUES
        ('https://img1.jpg', 'Fotografia detalhada da Torre de Belém, evidenciando os elementos arquitetónicos manuelinos.', 'Torre de Belém', 'F', '2024-03-12', 1, 1),
        ('https://vid1.mov', 'Vídeo educativo sobre o Oceanário de Lisboa, mostrando diversas espécies marinhas.', 'Oceanário de Lisboa', 'V', '2024-03-12', 1, 2),
        ('https://img2.jpg', 'Imagem panorâmica da Ribeira do Porto, destacando a arquitetura tradicional.', 'Ribeira do Porto', 'F', '2024-03-20', 2, 3),
        ('https://img3.jpg', 'Fotografia da Sé do Porto ao entardecer, evidenciando o seu valor histórico.', 'Sé do Porto', 'F', '2024-03-20', 2, 4),
        ('https://img4.jpg', 'Imagem do Museu do Prado com destaque para a sua importância artística.', 'Museu do Prado', 'F', '2024-04-05', 3, 5),
        ('https://vid2.mov', 'Vídeo panorâmico do Parque Güell, destacando a arquitetura modernista.', 'Parque Güell', 'V', '2024-06-05', 8, 6),
        ('https://img5.jpg', 'Fotografia noturna da Torre Eiffel iluminada.', 'Torre Eiffel', 'F', '2024-04-18', 4, 7),
        ('https://vid3.mov', 'Vídeo da entrada do Museu do Louvre, mostrando a pirâmide central.', 'Museu do Louvre', 'V', '2024-04-18', 4, 8),
        ('https://vid4.mov', 'Vídeo ilustrativo do Coliseu Romano, explorando a sua estrutura.', 'Coliseu Romano', 'V', '2024-05-01', 5, 9),
        ('https://img6.jpg', 'Fotografia da Porta de Brandemburgo, símbolo histórico de Berlim.', 'Porta de Brandemburgo', 'F', '2024-05-15', 6, 10)
;

-- <fim>
-- Afonso Barros a112178
-- Luís Pedrosa a112081
-- Diogo Pedrosa a103178
-- Matheus Azevedo a111430
