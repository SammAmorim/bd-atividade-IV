Use Atividade4;

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    data_admissao DATE
);

DELIMITER //

-- Criação do trigger
CREATE TRIGGER verificar_data_admissao
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN
    -- Verifica se a data de admissão é maior que a data atual
    IF NEW.data_admissao <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: A data de admissão deve ser maior que a data atual';
    END IF;
END;
//

DELIMITER ;

-- Inserção de um novo funcionário (data de admissão válida)
INSERT INTO funcionarios (id_funcionario, nome, data_admissao)
VALUES (1, 'Robert Lewandoswki', '2023-01-01');

-- Tente inserir um novo funcionário com data de admissão inválida (antes da data atual)
INSERT INTO funcionarios (id_funcionario, nome, data_admissao)
VALUES (2, 'Aitana Bonmatí', '2021-01-01');

select * from funcionarios;