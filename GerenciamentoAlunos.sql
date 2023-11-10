CREATE DATABASE GerenciamentoA;

DROP DATABASE GerenciamentoA;

USE GerenciamentoA;

CREATE TABLE Alunos(
IdAluno INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
DataNascimento Date NOT NULL,
Serie INT
);

INSERT INTO Alunos (Nome, DataNascimento, Serie) VALUES ('João Silva', '2005-05-15', 5);
INSERT INTO Alunos (Nome, DataNascimento, Serie) VALUES ('Maria Oliveira', '2006-08-20', 4);
INSERT INTO Alunos (Nome, DataNascimento, Serie) VALUES ('Carlos Santos', '2004-03-10', 6);

CREATE TABLE Matriculas(
IdMatricua INT AUTO_INCREMENT PRIMARY KEY,
AlunoId INT,
FOREIGN KEY (AlunoId) REFERENCES Alunos(IdAluno),
DataMatricula DATE NOT NULL,
Status VARCHAR(20) NOT NULL
);

INSERT INTO Matriculas (AlunoId, DataMatricula, Status) VALUES (1, '2023-09-01', 'Ativa');
INSERT INTO Matriculas (AlunoId, DataMatricula, Status) VALUES (2, '2023-09-05', 'Ativa');
INSERT INTO Matriculas (AlunoId, DataMatricula, Status) VALUES (3, '2023-08-28', 'Ativa');

DELIMITER //

CREATE TRIGGER verificar_idade_minima
BEFORE INSERT ON matriculas
FOR EACH ROW
BEGIN
    DECLARE idade_aluno INT;
    SELECT TIMESTAMPDIFF(YEAR, alunos.data_nascimento, CURDATE()) INTO idade_aluno
    FROM alunos
    WHERE IdAluno = NEW.AlunoId;
    IF NEW.Serie = 1 AND idade_aluno < 6 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Aluno não atende aos requisitos de idade para a série 1. Idade mínima: 6 anos.';
    ELSEIF NEW.Serie = 2 AND idade_aluno < 7 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Aluno não atende aos requisitos de idade para a série 2. Idade mínima: 7 anos.';
    END IF;
END;

//DELIMITER ;

