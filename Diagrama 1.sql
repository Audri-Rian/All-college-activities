CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
CREATE TABLE endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL
);
CREATE TABLE restaurante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_categoria INT,
    endereco_id INT,
    telefone VARCHAR(15),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);
CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    id_restaurante INT,
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id)
);
CREATE TABLE promo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    desconto DECIMAL(5, 2) NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    id_restaurante INT,
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id)
);
CREATE TABLE avaliacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nota INT CHECK(nota >= 1 AND nota <= 5),
    comentario TEXT,
    id_restaurante INT,
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id)
);
CREATE TABLE acompanhamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);
CREATE TABLE status_entrega (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE forma_pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME NOT NULL,
    id_cliente INT,
    id_status INT,
    forma_pagamento_id INT,
    FOREIGN KEY (id_status) REFERENCES status_entrega(id),
    FOREIGN KEY (forma_pagamento_id) REFERENCES forma_pagamento(id)
);


CREATE TABLE restaurante_pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_restaurante INT,
    forma_pagamento_id INT,
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id),
    FOREIGN KEY (forma_pagamento_id) REFERENCES forma_pagamento(id)
);
CREATE TABLE produto_carrinho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_carrinho INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id),
    FOREIGN KEY (id_carrinho) REFERENCES carrinho(id)
);
CREATE TABLE carrinho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT
);
CREATE TABLE historico_pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    data_pagamento DATETIME NOT NULL,
    valor_pago DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id)
);
CREATE TABLE historico_entrega (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    data_entrega DATETIME NOT NULL,
    status_entrega VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id)
);
CREATE TABLE historico_entrega (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    data_entrega DATETIME NOT NULL,
    status_entrega VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id)
);
CREATE TABLE produto_carrinho_acompanhamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto_carrinho INT,
    id_acompanhamento INT,
    FOREIGN KEY (id_produto_carrinho) REFERENCES produto_carrinho(id),
    FOREIGN KEY (id_acompanhamento) REFERENCES acompanhamento(id)
);
CREATE TABLE produto_acompanhamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_acompanhamento INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id),
    FOREIGN KEY (id_acompanhamento) REFERENCES acompanhamento(id)
);

show tables
