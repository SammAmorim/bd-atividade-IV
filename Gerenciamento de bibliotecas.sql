create database Atividade4;
Use atividade4;

CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    quantidade_estoque INT
);

-- Criação da tabela "emprestimos"
CREATE TABLE emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_livro INT,
    data_emprestimo DATETIME,
    data_devolucao DATETIME,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

-- Criação do trigger para atualizar o estoque ao inserir um novo empréstimo
DELIMITER //
CREATE TRIGGER atualizar_estoque_emprestimo
AFTER INSERT ON emprestimos
FOR EACH ROW
BEGIN
    -- Subtrai 1 da quantidade_estoque do livro correspondente
    UPDATE livros
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE id_livro = NEW.id_livro;
END;
//
DELIMITER ;

INSERT INTO livros (id_livro, titulo, autor, quantidade_estoque)
VALUES (1, 'Duna', 'Frank Hebert', 10),
(2, '1984','George Orwell', 10);

-- Inserir um novo empréstimo na tabela "emprestimos"
INSERT INTO emprestimos (id_emprestimo, id_livro, data_emprestimo, data_devolucao)
VALUES (2, 1, '2023-11-11 20:00:00', '2023-11-14 12:00:00'),
(3, 2, '2023-10-11 15:00:00', '2023-12-14 14:00:00');

select * from livros;
select * from emprestimos;

