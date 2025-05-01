-- TABELAS
CREATE TABLE Curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    duracao VARCHAR(50)
);

CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Curso(id_curso)
);

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    email VARCHAR(100)
);

CREATE TABLE Disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    carga_horaria INT,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Curso(id_curso)
);

CREATE TABLE Professor_Disciplina (
    id INT PRIMARY KEY AUTO_INCREMENT,
    professor_id INT,
    disciplina_id INT,
    FOREIGN KEY (professor_id) REFERENCES Professor(id_professor),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id_disciplina)
);

CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    disciplina_id INT,
    nota DECIMAL(4,2),
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id_disciplina)
);

-- DADOS DE EXEMPLO

-- Curso de TI
INSERT INTO Curso (nome, duracao)
VALUES ('Análise e Desenvolvimento de Sistemas', '2 anos');

-- Aluno (novo nome e e-mail)
INSERT INTO Aluno (nome, email, telefone, curso_id)
VALUES ('Larissa Almeida Rocha', 'larissa.rocha@exemplo.com', '(31) 98765-4321', 1);

-- Professor
INSERT INTO Professor (nome, cpf, email)
VALUES ('Carlos Henrique da Silva', '123.456.789-00', 'carlos.silva@faculdade.edu.br');

-- Disciplina
INSERT INTO Disciplina (nome, carga_horaria, curso_id)
VALUES ('Banco de Dados I', 60, 1);

-- Matricula (nota entre 0 e 10)
INSERT INTO Matricula (aluno_id, disciplina_id, nota)
VALUES (1, 1, 9.2);

-- Professor ensina disciplina
INSERT INTO Professor_Disciplina (professor_id, disciplina_id)
VALUES (1, 1);
