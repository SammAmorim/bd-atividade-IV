Create Database Atividade6;
Use Atividade6;


CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(255),
    descricao VARCHAR(255)
);


CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);


INSERT INTO categorias (id_categoria, nome_categoria, descricao)
VALUES
    (1, 'Eletrônicos', 'Produtos eletrônicos '),
    (2, 'Roupas', 'Vestuário e Roupagem'),
    (3, 'Móveis', 'Móveis Gerais'),
    (4, 'Alimentos', 'Produtos alimentícios');


INSERT INTO produtos (id_produto, nome, preco_unitario, id_categoria)
VALUES
    (1, 'Frigideira', 100.00, 1),
    (2, 'Batedeira', 50.00, 1),
    (3, 'Poncho', 20.00, 2),
    (4, 'Cama', 300.00, 3),
    (5, 'Cerveja', 10.00, 4),
    (6, 'Bolacha', 25.00, 4),
    (7, 'Calça', 30.00, 2);


CREATE VIEW relatorio_produtos_categoria AS
SELECT
    c.nome_categoria AS nome_da_categoria,
    COUNT(p.id_produto) AS quantidade_de_produtos
FROM
    categorias c
LEFT JOIN
    produtos p ON c.id_categoria = p.id_categoria
GROUP BY
    c.id_categoria;

SELECT * FROM relatorio_produtos_categoria;
