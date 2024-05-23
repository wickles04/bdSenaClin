INSERT INTO paciente
VALUES(
	'1',
	'Eliane Joana Mirella Aragão',
	'01080616632',
	'rua',
	'Alameda Moema',
	'122',
	NULL,
	'1345678954',
	'santos');	
INSERT INTO paciente
VALUES(
	'2',
	'Luís Thiago Mendes',
	'01035646632',
	'rua',
	'Rio Alalaú',
	'52',
	NULL,
	'13155648625',
	'santos');
INSERT INTO paciente
VALUES(
	'3',
	'André Benedito Fernandes',
	'01087846982',
	'avenida',
	'Gláucia Maria dos Santos Gouveia',
	'670',
	NULL,
	'13456496285',
	'São Vicente');	
INSERT INTO paciente
VALUES(
	'4',
	'Arthur Nelson Martins',
	'14290732763',
	'estrada',
	'Travessa Cirino de Almeida',
	'5554',
	NULL,
	'13456494862',
	'São Vicente');
INSERT INTO paciente
VALUES(
	'5',
	'Stefany Beatriz Gabriela Galvão',
	'71301843709',
	'avenida',
	' Aporé',
	'168',
	NULL,
	'13616871965',
	'santos');
INSERT INTO paciente
VALUES(
	'6',
	'Sérgio Benício Sales',
	'84193865029',
	'estrada',
	'Ipu',
	'651',
	NULL,
	'13415496285',
	'guarujá');
	
	
INSERT INTO dentista (nomedentista, cro, especialidade, celular)
VALUES(
	'Luciana Joana Pietra Silva',
	'555555RJ',
	'Ortodontia',
	'13995153447');

INSERT INTO dentista (nomedentista, cro, especialidade, celular)
VALUES(
	'Luana Gabrielly Clarice Nunes',
	'111111SP',
	'Periodontia',
	'13995112654');
	
INSERT INTO dentista (nomedentista, cro, especialidade, celular)
VALUES(
	'Marlene Jennifer Baptista',
	'222222RJ',
	'Geral',
	'13991546847');
	
INSERT INTO dentista (nomedentista, cro, especialidade, celular)
VALUES(
	'Patrícia Marcela Duarte',
	'333333MG',
	'Implantodontia',
	'13154687294');
	
INSERT INTO consulta (dataconsulta, hora, tipoconsulta, idpaciente, iddentista)
VALUES(
	'2024-06-01',
	'08:00:00',
	'avaliação',
	'1',
	'1'
);

INSERT INTO consulta (dataconsulta, hora, tipoconsulta, idpaciente, iddentista)
VALUES(
	'2024-06-02',
	'09:00:00',
	'avaliação',
	'2',
	'3'
);

INSERT INTO consulta (dataconsulta, hora, tipoconsulta, idpaciente, iddentista)
VALUES(
	'2024-06-03',
	'10:00:00',
	'avaliação',
	'3',
	'3'
);

UPDATE `senaclin`.`dentista` 
SET `especialidade`='Geral', `celular`='13154681114' 
WHERE  `idDentista`=4;

UPDATE `senaclin`.`consulta` 
SET `dataConsulta`='2024-06-04', `hora`='11:00:00' 
WHERE  `idconsulta`=2;

UPDATE `senaclin`.`consulta` 
SET `tipoconsulta`='tratamento', `observaçao`='Tratamento será realizado em 10 consultas. Prioridade: Moderada. Remédio aplicado: Ponstan, caso sinta dores' 
WHERE  `idconsulta`=1;

SELECT nome, telefone FROM paciente
WHERE cidade = 'santos'
ORDER BY nome ASC;

SELECT d.nomedentista AS 'dentista', dataconsulta, p.nomepaciente AS 'paciente', p.telefone AS 'telefone do paciente' FROM dentista d
inner JOIN consulta c ON d.idDentista = c.iddentista
inner JOIN paciente p ON c.idpaciente = p.idpaciente;

SELECT d.nomedentista AS 'dentista', dataconsulta, tipoconsulta FROM dentista d
left JOIN consulta c ON d.idDentista = c.iddentista;

SELECT COUNT(iddentista), especialidade FROM dentista 
GROUP BY especialidade
ORDER BY especialidade ASC;

SELECT COUNT(idconsulta) AS 'quantidade', MONTH(dataconsulta) 'mes'FROM consulta
WHERE MONTH(dataconsulta) = 6
GROUP BY MONTH(dataconsulta);

SELECT tipoconsulta, COUNT(idconsulta) FROM consulta
GROUP BY tipoconsulta;

SELECT COUNT(idpaciente) FROM paciente;

SELECT idconsulta, d.nomedentista, cro, dataconsulta, p.nomepaciente FROM consulta c
INNER join dentista d ON c.iddentista = d.idDentista
INNER JOIN paciente p ON c.idpaciente = p.idpaciente
WHERE d.idDentista = 'implantodontia'
ORDER BY dataconsulta DESC;


SELECT COUNT(idconsulta) AS 'quantidade de consultas',d.idDentista  FROM consulta c
INNER JOIN dentista d ON d.idDentista = c.iddentista
GROUP BY c.iddentista
