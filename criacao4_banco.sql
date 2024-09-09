/*
SENAC DF - CEP Dessé Freire
2024.07.276 - Aprendizagem Profissional de Qualificação em Desenvolvimento de Softwares
Profe Hudson Neves
Projeto Final - Implementação de Banco de Dados Relacional com MysQl
Projeto - Clinica Odontológica OdontoVida */
-- Consultas e joins
/*
Esta consulta lista os detalhes das consultas, incluindo o nome do paciente e o nome do dentista responsável por cada consulta.
*/
SELECT
c.consulta_id,
p.nome AS paciente_nome,
d.nome AS dentista_nome,
c.data_consuLta
FROM
Consulta c
iNNER JOIN
Paciente p ON c.paciente_id = p.paciente_id
iNNER JOIN
Dentista d ON c.dentista_id = d.dentista_id;

/*
Esta consulta mostra todos os tratamentos realizados, junto com os procedimentos associados a cada tratamento e o custo total de cada procedimento.
*/
SELECT
t.tratamento_id,
t.descricao AS tratamento_descricao,
p.nome AS procedimento_nome,
tp.quantidade,
pr.custo,
(tp.quantidade * pr.custo) AS custo_total
FROM
Tratamento t
INNER JOIN
Tratamento_Procedimento tp ON t.tratamento_id = tp.tratamento_id
INNER JOIN
Procedimento pr ON tp.procedimento_id = pr.procedimento_id;


/*
Esta consulta fornece informações sobre os pagamentos efetuados, incluindo o valor pago, a data do pagamento e a descrinção do tratamento assosiado
*/
SELECT
p.pagamento_id,
t.descricao AS tratamento_descricao,
p.valor AS valor_pago,
p.data_pagamento
FROM
Pagamento P
INNER JOIN
Tratamento t ON p.tratamento_id = t.tratamento_id;


/*
Sempre que um novo procedimento é inserido na tabela Tratamento_Procedimento, a trigger atualizará o custo total do tratamento correspondente na tabela Tratamento.
*/
DELIMITER //
CREATE TRIGGER AtualizarCustoTratamento
AFTER INSERT ON Tratamento_Procedimento
FOR EACH ROW
BEGIN
DECLARE custo_total DECIMAL (10, 2);
-- Calcula o custo total do tratamento

SELECT SUM(tp-quantidade * p-custo) INTO custo_total
FROM Tratamento_Procedimento tp
JOIN Procedimento p ON tp-procedimento_id = p-procedimento_id
WHERE tp.tratamento_id = NEW.tratamento_id;

-- Atualiza o valor total do tratamento na tabela Tratamento
UPDATE Tratamento
SET valor_total = custo_total
WHERE tratamento_id = NEW.tratamento_id;
END//
DELIMITER ;


/*
Vamos criar uma procedure para gerar um relatório de todas as consultas de um paciente específico, incluindo informações sobre o paciente, dentista e data da consulta. Essa procedure pode ser útil para consultas rápidas de histórico de atendimento de um paciente.
*/
DELIMITER //
CREATE PROCEDURE RelatorioConsultasPaciente(IN pacienteld INT)
BEGIN
-- Seleciona detalhes das consultas do paciente
SELECT
c.consulta id,
p.nome AS paciente_nome,
d.nome As dentista_nome,
c.data_consulta
FROM
Consulta c
INNER JOIN
Paciente P ON c.paciente_id = p.paciente_id
INNER JOIN
Dentista d ON c.dentista_id = d.dentista_id
WHERE
p.paciente_id = pacienteId;
END//

DELIMITER;
