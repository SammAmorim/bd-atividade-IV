Use Atividade5;

-- Criação da tabela "funcionarios"
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(255),
    salario DECIMAL(10, 2)
);

-- Criação da tabela "vendas"
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_funcionario INT,
    data_venda DATE,
    valor_venda DECIMAL(10, 2),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

-- Inserir registros na tabela "funcionarios"
INSERT INTO funcionarios (id_funcionario, nome, cargo, salario)
VALUES
    (1, 'Mohamed Salah', 'Vendedor', 1500.00),
    (2, 'Cristiano Ronaldo', 'Vendedor', 2000.00),
    (3, 'Luis Suárez', 'Gerente', 4500.00),
    (4, 'Neymar Jr', 'Vendedor', 3700.00);

-- Inserir registros na tabela "vendas"
INSERT INTO vendas (id_venda, id_funcionario, data_venda, valor_venda)
VALUES
    (1, 1, '2023-05-05', 1000.00),
    (2, 2, '2023-06-06', 2000.00),
    (3, 1, '2023-07-07', 3000.00),
    (4, 3, '2023-08-08', 4000.00),
    (5, 4, '2023-19-09', 5000.00);

-- Criação da view "relatorio_vendas_funcionario"
CREATE VIEW relatorio_vendas_funcionario AS
SELECT
    f.nome AS nome_do_funcionario,
    COUNT(v.id_venda) AS numero_de_vendas,
    SUM(v.valor_venda) AS valor_total_vendas
FROM
    funcionarios f
LEFT JOIN
    vendas v ON f.id_funcionario = v.id_funcionario
GROUP BY
    f.id_funcionario;

SELECT * FROM relatorio_vendas_funcionario;
