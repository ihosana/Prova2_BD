/Ihosana de Assis, Silvio Gomes/
drop TABLE paciente;
/-----CRIAÇÃO DAS TABELAS-----/

/PACIENTE/
CREATE TABLE paciente(
ID SERIAL PRIMARY KEY,
nome TEXT,
data_nascimento DATE,
endereco TEXT,
cpf VARCHAR(14))

SELECT* FROM paciente;

/PRONTUARIO/
CREATE TABLE prontuario(
ID SERIAL PRIMARY KEY,
data_internacao DATE,
duracao_internacao INT,
motivo_internacao TEXT,
status TEXT,
fk_paciente INT,
FOREIGN KEY (fk_paciente) REFERENCES paciente (ID))

SELECT* FROM prontuario;


/MEDICO/
CREATE TABLE Medico(
ID SERIAL PRIMARY KEY,
nome TEXT,
especialidade TEXT,
crm INT)

SELECT* FROM medico;

/ANOTAÇÕES PRONTUARIO/
CREATE TABLE AnotacaoProntuario(
ID SERIAL PRIMARY KEY,
data DATE,
informacoes TEXT,
fk_medico INT,
FOREIGN KEY (fk_medico) REFERENCES medico(ID),
fk_prontuario INT,
FOREIGN KEY (fk_prontuario) REFERENCES prontuario(ID)
)

SELECT* FROM anotacaoprontuario;



/-----PREENCHIMENTO DAS TABELAS-----/

/INSERT EM MEDICOS/
INSERT INTO Medico(nome,especialidade,crm)VALUES('Danilo','Cirugião',06545);
INSERT INTO Medico(nome,especialidade,crm)VALUES('Pedro', 'Pisiquiatra',065945);
INSERT INTO Medico(nome,especialidade,crm)VALUES('Joana','Enfermeira',08045);
INSERT INTO Medico(nome,especialidade,crm)VALUES(' Ana','Cirugião',0765775);
INSERT INTO Medico(nome,especialidade,crm)VALUES('Jonas','Enfermeiro',008845);

/INSERT EM PACIENTES/
INSERT INTO Paciente(nome,data_nascimento, endereco,cpf)VALUES('Carla Fernandes', '20/04/1990','UfrnMacaiba',0078996545);
INSERT INTO Paciente(nome,data_nascimento, endereco,cpf)VALUES('Camila Castro', '21/04/1990','Rua das majestades',005596545);
INSERT INTO Paciente(nome,data_nascimento, endereco,cpf)VALUES('Júlia Anacleto', '02/04/1990','Bairro de Pedra',00808045);
INSERT INTO Paciente(nome,data_nascimento, endereco,cpf)VALUES(' Ana Cecília Nascimento', '12/04/1990','Rua das dores',007776545);
INSERT INTO Paciente(nome,data_nascimento, endereco,cpf)VALUES('Juliana Pedrosa', '05/04/1990','Rua das tulipas',000666545);

/INSERT PRONTUARIO/
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('20/11/2021',3,'overdose',1,'ativo');
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('23/12/2021',1,'Manchao Pulmão',1,'ativo');
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('02/01/2022',2,'cirrose',1,'ativo');
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('10/06/2022',3,'overdose',1,'ativo');
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('20/07/2022',6,'overdose',1,'ativo');

INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('2/11/2021',7,'parada cardíaca',2,'ativo');
INSERT INTO Prontuario(data_internacao, duracao_internacao, motivo_internacao, fk_paciente,
status)VALUES('10/11/2021',3,'gripe',3,'ativo');

UPDATE Prontuario set data_internacao='05/10/2022' where data_internacao='2021-11-02'
/ANOTAÇÃO PRONTUARIO/
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',1,1);
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',2,1);
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',3,1);
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',1,1);
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',3,1);
INSERT INTO AnotacaoProntuario(data,informacoes, fk_medico,fk_prontuario)VALUES('05/10/2022','Apenas um surto diabetico',,7);

select*from medico
/SELECTS/
/1/UPDATE prontuario SET status='inativo' WHERE id=1;
/1.1/UPDATE prontuario SET status='inativo' WHERE id=7;
/2/UPDATE paciente SET cpf= '01323344599' WHERE cpf='78996545';
/3/DELETE FROM medico anotacaoprontuario WHERE medico.id=anotacaoprontuario.fk_medico AND  medico.id=2 ;
/4/SELECT * FROM paciente WHERE nome LIKE '%C%'
/5/SELECT nome FROM prontuario, paciente where prontuario.status='ativo' AND prontuario.fk_paciente=paciente.id;
/6/SELECT AVG(duracao_internacao) FROM prontuario;
/7/SELECT AVG(duracao_internacao) FROM prontuario WHERE status='inativo';
/8/SELECT duracao_prontuario FROM prontuario WHERE duracao_prontuario = (SELECT MAX(duracao_prontuario) FROM prontuario);
/8.1/SELECT duracao_prontuario  FROM prontuario WHERE duracao_prontuario = (SELECT MIN(duracao_pruntuario) FROM prontuario);
/9/SELECT duracao_internacao, nome FROM prontuario, paciente WHERE paciente.id=prontuario.id;
/10/SELECT fk_prontuario, fk_medico FROM anotacaoprontuario,prontuario, medico WHERE fk_medico=medico.id AND fk_prontuario=prontuario.id;

/13/SELECT medico.nome  FROM medico,prontuario,anotacaoprontuario WHERE prontuario.fk_paciente=1 AND anotacaoprontuario.fk_prontuario=prontuario.id AND medico.id=anotacaoprontuario.fk_medico;
/13.1/SELECT medico.nome FROM medico,prontuario,anotacaoprontuario,paciente WHERE prontuario.fk_paciente!=2 AND prontuario.fk_paciente=1  AND anotacaoprontuario.fk_prontuario=prontuario.id AND medico.id=anotacaoprontuario.fk_medico;
/14/SELECT medico.nome FROM medico, prontuario WHERE prontuario.fk_paciente=1 AND  prontuario.fk_paciente!=2;
/15/SELECT paciente.nome, paciente.id FROM paciente ORDER BY nome;
/16/SELECT medico.nome from medico, anotacaoprontuario WHERE anotacaoprontuario.data='05/10/2022' AND anotacaoprontuario.fk_medico=medico.id
select*from anotacaoprontuario
select*from paciente