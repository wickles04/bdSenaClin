USE senaclin; 

CREATE TABLE paciente (
 idpaciente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nomePaciente VARCHAR(100) NOT NULL,
 cpf VARCHAR(11) NOT NULL UNIQUE ,
 tipologradouro VARCHAR(50) NOT NULL,
 nomelogradouro VARCHAR(50) NOT NULL,
 numero VARCHAR(6) NOT NULL,
 complemento varchar(30) DEFAULT 'não existe',
 telefone CHAR(11),
 CONSTRAINT ck_tipoLogradouro CHECK (tipoLogradouro='Praça' OR tipoLogradouro='Rua' OR tipoLogradouro='Avenida' OR tipoLogradouro='Estrada')
 );
 
CREATE TABLE dentista (
idDentista INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
nomedentista VARCHAR(100) NOT NULL,
cro CHAR(8) NOT NULL UNIQUE,
especialidade VARCHAR(14) DEFAULT 'geral',
telefone CHAR(10),
celular CHAR(11),
CONSTRAINT ck_especialidade CHECK (especialidade= 'Ortodontia' OR especialidade= 'geral' OR especialidade= 'periodontia' OR especialidade= 'implantodontia')
);

 CREATE TABLE consulta (
 idconsulta INT AUTO_INCREMENT PRIMARY KEY,
 dataConsulta DATE NOT NULL ,
 hora TIME NOT NULL,
 tipoconsulta VARCHAR(10) NOT NULL,
 idpaciente INT NOT NULL,
 iddentista INT NOT NULL,
 observaçao VARCHAR(250),
 CONSTRAINT FK_Consulta_Paciente FOREIGN KEY (idpaciente) REFERENCES paciente(idpaciente),
 CONSTRAINT FK_Consulta_Dentista FOREIGN KEY (idDentista) REFERENCES Dentista(idDentista)
 );



ALTER TABLE `paciente`
 
ADD COLUMN `cidade` VARCHAR(80) NOT NULL;


