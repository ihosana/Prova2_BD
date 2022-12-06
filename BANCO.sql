drop TABLE paciente;
/*-----CRIAÇÃO DAS TABELAS-----*/

/*PACIENTE*/
CREATE TABLE paciente(
ID SERIAL PRIMARY KEY,
nome TEXT,
data_nascimento DATE,
endereco TEXT,
cpf VARCHAR(14))ALL
SELECT* FROM paciente;

/*PRONTUARIO*/
CREATE TABLE prontuario(
ID SERIAL PRIMARY KEY,
data_internacao DATE,
duracao_internacao TEXT,
motivo_internacao TEXT,
status BOOLEAN,
fk_paciente INT)
SELECT* FROM prontuario;

/*MEDICO*/
CREATE TABLE Medico(
ID SERIAL PRIMARY KEY,
nome TEXT,
especialidade TEXT,
crm INT)
SELECT* FROM medico;

/*ANOTAÇÕES PRONTUARIO*/
CREATE TABLE AnotacaoProntuario(
ID SERIAL PRIMARY KEY,
data DATE,
informacoes TEXT,
fk_medico INT,
fk_prontuario INT) 
SELECT* FROM anotacaoprontuario;



/*-----PREENCHIMENTO DAS TABELAS-----*/

/*INSERT EM MEDICOS*/
INSERT INTO Medico(nome,especialidade,crm)VALUES('Danilo','Cirugião',06545);
INSERT INTO Medico(nome,especialidade,crm)VALUES('Pedro', 'Pisiquiatra',065945);
INSERT INTO Medico(nome,especialidade,crm)VALUES('Joana','Enfermeira',08045);
INSERT INTO Medico(nome,especialidade,crm)VALUES(' Ana','Cirugião',0765775);
INSERT INTO Medico(nome,especialidade,crm)VALUES('Jonas','Enfermeiro',008845);

/*INSERT EM PACIENTES*/
INSERT INTO Paciente(nome,data_nascimento, endereco,cpf)VALUES('Carla Fernandes', '20/04/1990','UfrnMacaiba',0078996545);
INSERT INTO Paciente(nome,data_nascimento, endereco,cpf)VALUES('Camila Castro', '21/04/1990','Rua das majestades',005596545);
INSERT INTO Paciente(nome,data_nascimento, endereco,cpf)VALUES('Júlia Anacleto', '02/04/1990','Bairro de Pedra',00808045);
INSERT INTO Paciente(nome,data_nascimento, endereco,cpf)VALUES(' Ana Cecília Nascimento', '12/04/1990','Rua das dores',007776545);
INSERT INTO Paciente(nome,data_nascimento, endereco,cpf)VALUES('Juliana Pedrosa', '05/04/1990','Rua das tulipas',000666545);

/*INSERT PRONTUARIO*/
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('20/11/2021','3dias','overdose',1,'ativo');
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('23/12/2021','1dias','Manchao Pulmão',1,'ativo');
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('02/01/2022','2dias','cirrose',1,'ativo');
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('10/06/2022','3dias','overdose',1,'ativo');
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('20/07/2022','6dias','overdose',1,'ativo');

INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('2/11/2021','7dias','parada cardíaca',2,'ativo');
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('10/11/2021','3dias','gripe',3,'ativo');

/*ANOTAÇÃO PRONTUARIO*/
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',1,1);
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',2,1);
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',3,1);
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',1,1);
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',3,1);

INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',4,7);


