CREATE DATABASE SistemaB;

DROP DATABASE SistemaB;

USE SistemaB;

CREATE TABLE Livro(
IdLivro INT AUTO_INCREMENT PRIMARY KEY,
Titulo VARCHAR(50) NOT NULL,
Autor VARCHAR(255) NOT NULL,
QntdE INT NOT NULL
);

INSERT INTO Livro (Titulo, Autor, QntdE) VALUES ('Pé de Laranja Lima', 'Felipe Morais', 15);
INSERT INTO Livro (Titulo, Autor, QntdE) VALUES ('Diários de uma adolescente', 'Amanda de Paula', 20);

CREATE TABLE Emprestimo(
IdEmprestimo INT AUTO_INCREMENT PRIMARY KEY,
LivroId INT,
FOREIGN KEY (LivroId) REFERENCES Livro (IdLivro),
DataEmprestimo DATETIME,
DataDevolucao DATETIME 
);

INSERT INTO Emprestimo (LivroId, DataEmprestimo, DataDevolucao) VALUES (1, '2023-07-15 15:05:10', '2023-08-15 16:55:02');
INSERT INTO Emprestimo (LivroId, DataEmprestimo, DataDevolucao) VALUES (2, '2023-08-20 17:45:04', '2023-09-20 14:25:08');


DELIMITER //

CREATE TRIGGER atualizar_quantidade_estoque
AFTER INSERT ON Emprestimo
FOR EACH ROW
	BEGIN
	UPDATE Livro
	SET QntdE = QntdE -1
	WHERE IdLivro = NEW.LivroId;
END;

// DELIMITER ;

SELECT * FROM Livro;