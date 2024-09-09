CREATE TABLE Procedimento (
  procedimento_id INT AUTO_INCREMENT PRIMARY KEY
  nome VARCHAR(180) NOT NULL, 
  custo DECIMAL (20, 2) NOT NULL
);

CREATE TABLE Tratamento Procedimento (
  tratamento_ 1d INT, procedimento_id INT,
  quantidade INT DEFAULT 1
  PRIMARY KEY (tratamento id, procedimento id),
  FOREIGN KEY (tratamento_id) REFERENCES Tratamento(tratamento_ id), 
  FOREIGN KEY (procedimento_id) REFERENCES Procedimento (procedimento_ id)

CREATE TABLE Pagamento (
  pagamento_ id INT AUTO INCREMENT PRIMARY KEY, 
  tratamento_id INT, 
  valor DECIMAL (18, 2) NOT NULL,
  data pagamento DATE,
  FOREIGN KEY (tratamento_id) REFERENCES Tratamento (tratamento_id)
  );
