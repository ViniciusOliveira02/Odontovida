-- 3 Criando Tablelas
CREATE TABLE Paciente (
  paciente_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  data nascimento DATE NOT NULL,
  telefone VARCHAR(20),
  endereco TEXT,
  email VARCHAR(100)

CREATE TABLE Dentista (
  dentista_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL, 
  especialidade VARCHAR(50),
  telefone VARCHAR(20),
  email VARCHAR (100)
);

CREATE TABLE Consulta (
  consulta_id INT AUTO_INCREMENT PRIMARY KEY,
  paciente id INT,
  dentista_id INT, 
  data_consulta DATETIME,
  FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_ id),
  FOREIGN KEY (dentista_id) REFERENCES Dentista(dentista_id)

CREATE TABLE Tratamento (
  tratamento_id INT AUTO_INCREMENT PRIMARY KEY,
  consulta_ id INT, 
  descricao TExT,
  data_inicIo DATE, 
  data_fin DATE,
  FOREIGN KEY (consulta_ id) REFERENCES Consulta (consulta_id)
);
