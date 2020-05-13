-- 1. Exiba a placa e o nome dos donos de todos os veículos.
select 
    v.vei_placa,
    c.cli_nome
FROM
    veiculo v
inner JOIN cliente c ON v.cli_cpf = c.cli_cpf;

-- 2. Exiba o CPF e o nome do cliente que possui o veículo de placa 'DEF-4567'.

select
    c.cli_cpf,
    c.cli_nome
from 
    client c
inner join veiculo v ON v.cli_cpf = c.cli_cpf
WHERE 
    v.vei_placa = 'DEF-4567';

-- 3. Exiba a placa e a cor dos veículos que possuem o código de pátio igual a 1.

SELECT
    v.vei_placa,
    v.vei_cor
FROM veiculo v
INNER JOIN estaciona e on v.vei_placa = e.vei_placa and e.pat_codigo = 1;

-- 4. Exiba a placa e o ano dos veículos que possuem o código de pátio igual a 1.

SELECT
    v.vei_placa,
    v.vei_ano
FROM veiculo v
INNER JOIN estaciona e on v.vei_placa = e.vei_placa and e.pat_codigo = 1;

--5. Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2013.
SELECT
    v.vei_placa,
    v.vei_ano,
    m.mod_descricao
FROM veiculo v
INNER JOIN modelo m on v.mod_codigo = m.mod_codigo
WHERE
    v.vei_ano >= 2013;

--6. Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa “EFG-5678”.
SELECT
    p.pat_endereco,
    e.dt_entrada,
    e.dt_saida
FROM estaciona e
Inner join patio p on e.pat_codigo  = p.pat_codigo
WHERE e.vei_placa = 'EFG-5678';

--7. Exiba a quantidade de vezes que veículos de cor verde estacionaram.
select 
    count(vei_placa) as quantidade
FROM
    estaciona
WHERE
    vei_placa in (select distinct vei_placa from veiculo v where vei_cor = 'verde');

--8. Liste o nome de todos os clientes que possuem carro de modelo 1.
SELECT 
    cli_nome
FROM
    cliente
WHERE
    cli_cpf in (select cli_cpf from veiculo where mod_codigo = 1);

--9. Liste as placas e os horários de entrada e saída dos veículos de cor verde.
SELECT
    vei_placa,
    hr_entrada,
    hr_saida
FROM
    estaciona
WHERE
    vei_placa in (select distinct vei_placa from veiculo v where vei_cor = 'verde');

--10. Liste todos os dados dos estacionamentos do veículo de placa “BCD-2345”.
SELECT
    *
FROM
    estaciona
where
    vei_placa = 'BCD-2345';

--11. Exiba o nome dos clientes que já estacionaram seu veículo no pátio 2.
SELECT
    cli_nome
From cliente c
inner JOIN veiculo v on c.cli_cpf = v.cli_cpf
inner join estaciona e on v.vei_placa = e.vei_placa
where e.pat_codigo = 2;


--12. Exiba o CPF do cliente que estacionou no pátio 3.
SELECT
    c.cli_cpf
From cliente c
inner JOIN veiculo v on c.cli_cpf = v.cli_cpf
inner join estaciona e on v.vei_placa = e.vei_placa
where e.pat_codigo = 3;

--13. Exiba a descrição do modelo do veículo que estacionou no pátio 2.
SELECT
    mod_descricao
From modelo m
inner JOIN veiculo v on m.mod_codigo = v.mod_codigo
inner join estaciona e on v.vei_placa = e.vei_placa
where e.pat_codigo = 2;

--14. Exiba as placas e os nomes dos donos juntamente com a descrição dos modelos de seus veículos.
SELECT
    vei_placa,
    cli_nome,
    mod_descricao
FROM
    veiculo v
INNER JOIN modelo m on v.mod_codigo = m.mod_codigo
inner join cliente c on c.cli_cpf = v.cli_cpf;

--15. Liste o nome de todos os clientes que possuem carro modelo celta.
SELECT
    cli_nome
FROM
    cliente c
inner join veiculo v on c.cli_cpf = v.cli_cpf
INNER JOIN modelo m on v.mod_codigo = m.mod_codigo
where 
m.mod_descricao = 'celta';

