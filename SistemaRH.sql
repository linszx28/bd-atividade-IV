CREATE DATABASE RH;

DROP DATABASE RH;

USE RH;

CREATE TABLE Funcionarios(
IdFun INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
DataAdmissao DATE,
DataAtual DATE 
);

INSERT INTO Funcionarios (Nome, DataAdmissao, DataAtual) VALUES ('João Silva', '2023-11-10', '2023-11-09');
INSERT INTO Funcionarios (Nome, DataAdmissao, DataAtual) VALUES ('Maria Santos', '2023-11-09', '2023-11-09');

DELIMITER //
CREATE TRIGGER verifica_data_admissao
BEFORE INSERT ON Funcionarios
FOR EACH ROW
BEGIN
    IF NEW.DataAdmissao <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A data de admissão deve ser maior que a data atual.';
    END IF;
END;
//
DELIMITER ;

SELECT * FROM Funcionarios;
