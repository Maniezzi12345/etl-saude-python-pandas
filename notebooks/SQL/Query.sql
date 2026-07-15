-- Quero saber quantas consultas foram 
-- realizadas por cada especialidade, 
-- ordenado da mais consultada para a menos.

SELECT
      COUNT(*) AS quantidade_consulta,
      especialidade
FROM
      consultas
GROUP BY especialidade
ORDER BY quantidade_consulta DESC;


-- Quero saber o valor total arrecadado por cada médico, 
-- considerando apenas consultas realizadas,
-- ordenado do maior para o menor.

SELECT
    medico,
    SUM(Valor) AS valor_ganho
FROM
    consultas
WHERE
     status = 'realizada'
GROUP BY medico
ORDER BY  valor_ganho DESC;


-- Quero saber quantos pacientes cada plano 
-- tem e qual a idade média de cada plano.

SELECT
    plano,
    COUNT (*) AS quantidade_pacientes,
    AVG(idade) AS media_idade
FROM
    pacientes
GROUP BY
    plano
ORDER BY media_idade DESC;


-- Quero saber o total de consultas e o valor 
-- total arrecadado por especialidade, 
-- considerando apenas consultas realizadas.

SELECT 
     especialidade,
     COUNT(id_paciente) AS quantidade_consulta,
     SUM(Valor) AS valor_totaL
FROM
    consultas
WHERE
    status = 'realizada'
GROUP BY 
    especialidade
ORDER BY  valor_totaL;   


-- Quero cruzar as duas tabelas e saber
-- quantas consultas cada paciente fez,
-- mostrando o nome do paciente, a cidade e o plano.


SELECT 
     p.nome AS nome_paciente,
     P.cidade AS cidade_paciente,
     P.plano AS plano_paciente,
     COUNT(C.id) AS quantidade_consulta
FROM
    consultas AS C
JOIN   
    pacientes AS P ON C.id_paciente = P.id
GROUP BY
    nome_paciente,cidade_paciente,plano_paciente
ORDER BY  quantidade_consulta DESC;


-- Quero ver o nome do paciente, o médico, a especialidade e o valor,
-- apenas das consultas realizadas, ordenado pelo valor do maior para o menor.

SELECT
     P.nome AS nome_paciente,
     C.medico  AS nome_medico,
     C.especialidade ,
     C.valor AS valor_consulta
FROM
    pacientes as P
JOIN
    consultas as C ON P.id = C.id_paciente
WHERE
     C.status = 'realizada'

ORDER BY valor_consulta DESC ;


-- Quero ver o nome do paciente, 
-- a cidade, e o valor total que 
-- cada paciente gastou em consultas realizadas,
-- ordenado do maior para o menor.

SELECT
     P.nome AS nome_paciente,
     p.cidade AS nome_cidade,
     SUM(C.valor) AS valor_consulta
FROM
    pacientes as P
JOIN
    consultas as C ON P.id = C.id_paciente
WHERE
     C.status = 'realizada'

GROUP BY
       nome_paciente,nome_cidade
ORDER BY valor_consulta DESC ;


-- Quero ver o nome do paciente, o plano, a especialidade e o valor, 
-- apenas de pacientes com plano premium e consultas realizadas,
-- ordenado pelo valor.

SELECT
     P.nome AS nome_paciente,
     P.plano AS plano_paciente,
     C.especialidade AS especialidade_medica,
     C.valor AS valor_plano
FROM
    pacientes as P
JOIN
    consultas as C ON P.id = C.id_paciente
WHERE
     plano = 'premium' AND status = 'realizada'    
ORDER  BY valor_plano DESC;

-- Quero ver quantas consultas cada paciente fez por especialidade, 
-- mostrando nome, especialidade e quantidade, apenas pacientes com plano premium.

SELECT
    P.nome,
    C.especialidade,
    COUNT(C.id_paciente) AS quantidade_consulta
FROM consultas AS C
JOIN pacientes AS P ON C.id_paciente = P.id
WHERE P.plano = 'premium'
GROUP BY P.nome, C.especialidade
ORDER BY quantidade_consulta DESC;


-- Quero saber qual médico teve mais
-- consultas canceladas, mostrando o nome 
-- do médico e a quantidade.


SELECT
    medico,
    COUNT(id_paciente) AS quantidade_consulta
FROM consultas
WHERE status = 'cancelada'
GROUP BY medico
ORDER BY quantidade_consulta DESC;


-- Quero ver o nome do paciente, a cidade, o médico e o valor, 
-- apenas de pacientes com mais de 40 anos que tiveram consultas 
-- realizadas,  ordenado pela idade do mais velho para o mais novo.

SELECT 
     C.medico AS nome_medico,
     C.valor AS valor_total,
     P.nome AS nome_paciente,
     P.cidade AS cidade_paciente
FROM 
    consultas as C 
JOIN  
    pacientes as P  ON  C.id_paciente  = P.id 
WHERE 
     P.idade > 40 AND C.status = 'realizada'
ORDER BY P.idade DESC;

-- Quero saber qual cidade tem mais pacientes com
--  plano premium, mostrando a cidade e a quantidade.

SELECT
    P.cidade            AS cidade_paciente,
    COUNT(C.id_paciente) AS quantidade_pacientes
FROM consultas AS C
JOIN pacientes AS P ON C.id_paciente = P.id
WHERE P.plano = 'premium'
GROUP BY cidade_paciente
ORDER BY quantidade_pacientes DESC;