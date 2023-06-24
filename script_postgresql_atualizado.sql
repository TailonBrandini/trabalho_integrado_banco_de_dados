--Cria tabela categorias e suas colunas;
CREATE TABLE categorias (
                id_categoria   NUMERIC(38)  NOT NULL,
                nome_categoria VARCHAR(255) NOT NULL,
                --Cria chave primária da tabela categorias;
                CONSTRAINT pk_categorias PRIMARY KEY (id_categoria)
);
--Adciona restrições às colunas da tabela categorias;
ALTER TABLE categorias ADD CONSTRAINT check_id_categoria_valido CHECK (id_categoria > 0);

--Adciona comentários às colunas da tabela categorias;
COMMENT ON TABLE  categorias                IS 'Essa é uma tabela que serve para cadastrar os nomes das categorias.';
COMMENT ON COLUMN categorias.id_categoria   IS 'Essa é uma coluna que serve como uma PK (primary key) para identificar as categorias cadastradas.';
COMMENT ON COLUMN categorias.nome_categoria IS 'Essa é uma coluna que serve para cadastrar os nomes das categorias.';

--Cria tabela habilidades e suas colunas;
CREATE TABLE habilidades (
                id_habilidade      NUMERIC(38)  NOT NULL,
                nome_habilidade    VARCHAR(255) NOT NULL,
                tipo_de_habilidade VARCHAR(255) NOT NULL,
                --Cria chave primária da tabela habilidades;
                CONSTRAINT pk_habilidades PRIMARY KEY (id_habilidade)
);

--Adciona restrições às colunas da tabela habilidades;
ALTER TABLE habilidades ADD CONSTRAINT check_id_habilidade_valido      CHECK (id_habilidade > 0);
ALTER TABLE habilidades ADD CONSTRAINT check_tipo_de_habilidade_valido CHECK (tipo_de_habilidade IN('SOFTSKILL', 'HARDSKILL', 'HOBBIE'));

--Adciona comentários às colunas da tabela habilidades;
COMMENT ON TABLE  habilidades                    IS 'A coluna "habilidades" será responsavel por informar as habilidade (hard e soft) dos funcionários.';
COMMENT ON COLUMN habilidades.id_habilidade      IS 'A coluna "id_habilidade" é a PK da tabela "habilidades".';
COMMENT ON COLUMN habilidades.nome_habilidade    IS 'A coluna "nome_habilidade" vai guardar o nome da habilidade do funcionário.';
COMMENT ON COLUMN habilidades.tipo_de_habilidade IS 'Essa coluna serve para informar o tipo de habilidade do funcionário, suportando apenas os valores "SOFTSKILL", "HARDSKILL" ou "HOBBIE".';

--Cria tabela comunidades e suas colunas;
CREATE TABLE comunidades (
                id_comunidade   NUMERIC(38)  NOT NULL,
                nome_comunidade VARCHAR(255) NOT NULL,
                --Cria chave primária da tabela comunidades;
                CONSTRAINT pk_comunidades PRIMARY KEY (id_comunidade)
);

--Adciona restrições às colunas da tabela comunidades;
ALTER TABLE comunidades ADD CONSTRAINT check_id_comunidade_valido CHECK (id_comunidade > 0);

--Adciona comentários às colunas da tabela comunidades;
COMMENT ON TABLE  comunidades                 IS 'A tabela "comunidades" será responsavel por guardar o nome de cada comunidade, assim como sua categoria e um identificador único.';
COMMENT ON COLUMN comunidades.id_comunidade   IS 'A coluna "id_comunidade" será a pk da tabela "comunidades", onde irá armazenar o id de cada uma das comunidades, de forma exclusiva,sendo assim o identificador da tabela.';
COMMENT ON COLUMN comunidades.nome_comunidade IS 'A coluna "nome_comunidade" vai armazenar o nome de cada comunidade.';

--Cria tabela comunidades_categorias e suas colunas;
CREATE TABLE comunidades_categorias (
                id_comunidade_categoria NUMERIC(38) NOT NULL,
                id_categoria            NUMERIC(38) NOT NULL,
                id_comunidade           NUMERIC(38) NOT NULL,
                --Cria chave primária da tabela comunidades_categorias;
                CONSTRAINT pk_comunidades_categorias PRIMARY KEY (id_comunidade_categoria, id_categoria, id_comunidade)
);

--Adciona restrições às colunas da tabela comunidades_categorias;
ALTER TABLE comunidades_categorias ADD CONSTRAINT check_id_comunidade_categoria_valido CHECK (id_comunidade_categoria > 0);
ALTER TABLE comunidades_categorias ADD CONSTRAINT check_id_categoria_valido            CHECK (id_categoria            > 0);
ALTER TABLE comunidades_categorias ADD CONSTRAINT check_id_comunidade_valido           CHECK (id_comunidade           > 0);

--Adciona comentários às colunas da tabela comunidades_categorias;
COMMENT ON TABLE  comunidades_categorias                         IS 'Essa é uma tabela que serve como intermediaria entre as tabelas "comunidades" e "categorias".';
COMMENT ON COLUMN comunidades_categorias.id_comunidade_categoria IS 'Essa é uma coluna que serve para a identificação da tabela intermediaria (comunidade_categoria) entre as tabelas "comunidades" e "categorias".';
COMMENT ON COLUMN comunidades_categorias.id_categoria            IS 'Essa é uma coluna que serve como uma PK (primary key) para identificar as categorias cadastradas.';
COMMENT ON COLUMN comunidades_categorias.id_comunidade           IS 'A coluna "id_comunidade" será a pk da tabela "comunidades", onde irá armazenar o id de cada uma das comunidades, de forma exclusiva,sendo assim o identificador da tabela.';

--Cria tabela informativos e suas colunas;
CREATE TABLE informativos (
                id_informativo     NUMERIC(38)  NOT NULL,
                titulo             VARCHAR(255) NOT NULL,
                contexto           VARCHAR      NOT NULL,
                imagem_informativo BYTEA,
                data_publicacao    DATE         NOT NULL,
                --Cria chave primária da tabela informativos;
                CONSTRAINT pk_informativos PRIMARY KEY (id_informativo)
);

--Adciona restrições às colunas da tabela informativos;
ALTER TABLE informativos ADD CONSTRAINT check_id_informativo_valido CHECK (id_informativo > 0);

--Adciona comentários às colunas da tabela informativos;
COMMENT ON TABLE  informativos                    IS 'A tabela "informativos" vai armazenar as informações que serão postadas durante o dia a dia para a visualização dos funcionários.';
COMMENT ON COLUMN informativos.id_informativo     IS 'A coluna "id_informativo" é uma pk da tabela "informativo", onde irá armazenar o id de cada informativo.';
COMMENT ON COLUMN informativos.titulo             IS 'A coluna "titulo" vai guardar o título dos devidos informativos.';
COMMENT ON COLUMN informativos.contexto           IS 'A coluna "contexto" vai guardar o conteúdo escrito no informativo.';
COMMENT ON COLUMN informativos.imagem_informativo IS 'A coluna "imagem_informativo" irá guardar as devidas imagens de cada um dos informativos.';
COMMENT ON COLUMN informativos.data_publicacao    IS 'A coluna "data_publicacao" vai guardar a data em que o informativo foi publicado.';

--Cria tabela funcionarios e suas colunas;
CREATE TABLE funcionarios (
                token_de_acesso CHAR(6)      NOT NULL,
                sexo            CHAR(1)      NOT NULL,
                nome            VARCHAR(255) NOT NULL,
                sobrenome       VARCHAR(255) NOT NULL,
                nascimento      DATE         NOT NULL,
                cargo           VARCHAR(255) NOT NULL,
                foto_de_perfil  BYTEA        NOT NULL,
                email           VARCHAR(255) NOT NULL,
                cpf             CHAR(11)     NOT NULL,
                --Cria chave primária da tabela funcionarios;
                CONSTRAINT pk_funcionarios PRIMARY KEY (token_de_acesso)
);

--Adciona comentários às colunas da tabela funcionarios;
COMMENT ON TABLE  funcionarios                 IS 'A tabela funcionarios vai armazenar características dos funcionários, como nome, token de acesso, cargo, entre outras.';
COMMENT ON COLUMN funcionarios.token_de_acesso IS 'A coluna "token_de_acesso" servirá para dar uma identificação única para essa coluna, sendo esta uma PK.';
COMMENT ON COLUMN funcionarios.sexo            IS 'A coluna "sexo" vai informar o sexo do(a) funcionário(a), podendo ser somente "M" ou "F".';
COMMENT ON COLUMN funcionarios.nome            IS 'A coluna "nome" vai guardar o nome do funcionário.';
COMMENT ON COLUMN funcionarios.sobrenome       IS 'A coluna "sobrenome" irá guardar o sobrenome do funcionário.';
COMMENT ON COLUMN funcionarios.nascimento      IS 'A coluna "nascimento" irá informar a data de nascimento do funcionário';
COMMENT ON COLUMN funcionarios.cargo           IS 'A coluna "cargo" vai informar o nome do cargo do funcionário.';
COMMENT ON COLUMN funcionarios.foto_de_perfil  IS 'A coluna "foto_de_perfil" vai armazenar a foto de perfil do usuário.';
COMMENT ON COLUMN funcionarios.email           IS 'A coluna "email" vai guardar o email do funcionário.';
COMMENT ON COLUMN funcionarios.cpf             IS 'A coluna "cpf" vai informar o cpf de cada funcionário.';

--Cria tabela comunidades_funcionarios e suas colunas;
CREATE TABLE comunidades_funcionarios (
                id_comunidade_funcionario NUMERIC(38) NOT NULL,
                token_de_acesso           CHAR(6)     NOT NULL,
                id_comunidade             NUMERIC(38) NOT NULL,
                --Cria chave primária da tabela comunidades_funcionarios;
                CONSTRAINT pk_comunidades_funcionarios PRIMARY KEY (id_comunidade_funcionario)
);

--Adciona restrições às colunas da tabela comunidades_funcionarios;
ALTER TABLE comunidades_funcionarios ADD CONSTRAINT check_id_comunidade_funcionario_valido CHECK (id_comunidade_funcionario > 0);
ALTER TABLE comunidades_funcionarios ADD CONSTRAINT check_id_comunidade_valido             CHECK (id_comunidade             > 0);

--Adciona comentários às colunas da tabela comunidades_funcionarios;
COMMENT ON TABLE  comunidades_funcionarios                           IS 'Essa é uma tabela intermediaria entre funcionários e comunidades.';
COMMENT ON COLUMN comunidades_funcionarios.id_comunidade_funcionario IS 'Essa é uma coluna que serve para a identificação da tabela intermediaria (comunidade_funcionario) entre as tabelas "funcionarios" e "comunidades".';
COMMENT ON COLUMN comunidades_funcionarios.token_de_acesso           IS 'A coluna "token_de_acesso" servirá para dar uma identificação única para essa coluna, sendo esta uma PK.';
COMMENT ON COLUMN comunidades_funcionarios.id_comunidade             IS 'A coluna "id_comunidade" será a pk da tabela "comunidades", onde irá armazenar o id de cada uma das comunidades, de forma exclusiva,sendo assim o identificador da tabela.';

--Cria tabela habilidades_funcionarios e suas colunas;
CREATE TABLE habilidades_funcionarios (
                token_de_acesso CHAR(6)     NOT NULL,
                id_habilidade   NUMERIC(38) NOT NULL,
                --Cria chave primária da tabela habilidades_funcionarios;
                CONSTRAINT pk_habilidades_funcionarios PRIMARY KEY (token_de_acesso, id_habilidade)
);

--Adciona restrições às colunas da tabela habilidades_funcionarios;
ALTER TABLE habilidades_funcionarios ADD CONSTRAINT check_id_habilidade_valido CHECK (id_habilidade > 0);

--Adciona comentários às colunas da tabela habilidades_funcionarios;
COMMENT ON TABLE  habilidades_funcionarios                 IS 'A tabela "habilidades_funcionarios" vai armazenar as habilidades dos funcionarios.';
COMMENT ON COLUMN habilidades_funcionarios.token_de_acesso IS 'A coluna "token_de_acesso" servirá para dar uma identificação única para essa coluna, sendo esta uma PFK.';
COMMENT ON COLUMN habilidades_funcionarios.id_habilidade   IS 'A coluna "id_habilidade" é uma PFK e vai informar um id pra cada habilidade.';

--Cria tabela administradores e suas colunas;
CREATE TABLE administradores (
                id_administrador NUMERIC(38) NOT NULL,
                token_de_acesso  CHAR(6)     NOT NULL,
                --Cria chave primária da tabela administradores;
                CONSTRAINT pk_administradores PRIMARY KEY (id_administrador)
);

--Adciona restrições às colunas da tabela administradores;
ALTER TABLE administradores ADD CONSTRAINT check_id_administrador_valido CHECK (id_administrador > 0);

--Adciona comentários às colunas da tabela administradores;
COMMENT ON TABLE  administradores                  IS 'A tabela "administradores" vai guardar características dos funcionarios que são administradores.';
COMMENT ON COLUMN administradores.id_administrador IS 'A coluna "id_administrador" é a PK da tabela "administradores".';
COMMENT ON COLUMN administradores.token_de_acesso  IS 'A coluna "token_de_acesso" servirá para dar uma identificação única para essa coluna, sendo esta uma PK.';

--Cria tabela eventos e suas colunas;
CREATE TABLE eventos (
                id_evento        NUMERIC(38)  NOT NULL,
                data             DATE         NOT NULL,
                hora             TIMESTAMP    NOT NULL,
                nome_evento      VARCHAR(255) NOT NULL,
                id_informativo   NUMERIC(38)  NOT NULL,
                id_administrador NUMERIC(38)  NOT NULL,
                id_comunidade    NUMERIC(38)  NOT NULL,
                --Cria chave primária da tabela eventos;
                CONSTRAINT pk_eventos PRIMARY KEY (id_evento)
);

--Adciona restrições às colunas da tabela eventos;
ALTER TABLE eventos ADD CONSTRAINT check_id_evento_valido        CHECK (id_evento        > 0);
ALTER TABLE eventos ADD CONSTRAINT check_id_informativo_valido   CHECK (id_informativo   > 0);
ALTER TABLE eventos ADD CONSTRAINT check_id_administrador_valido CHECK (id_administrador > 0);
ALTER TABLE eventos ADD CONSTRAINT check_id_comunidade_valido    CHECK (id_comunidade    > 0);

--Adciona comentários ás colunas da tabela eventos;
COMMENT ON TABLE  eventos                  IS 'A tabela "eventos" vai armazenar dados sobre os eventos que ocorrerão, como data, hora, local, entre outros.';
COMMENT ON COLUMN eventos.id_evento        IS 'A coluna "id_evento" será responsavel por armazenar um identificador único para cada evento, sendo esta a PK.';
COMMENT ON COLUMN eventos.data             IS 'A coluna "data" vai armazenar a data de cada evento que acontecerá.';
COMMENT ON COLUMN eventos.hora             IS 'A coluna "hora" irá armazenar a hora em que incia o evento.';
COMMENT ON COLUMN eventos.nome_evento      IS 'A coluna "nome_evento" irá informar qual o nome do evento.';
COMMENT ON COLUMN eventos.id_informativo   IS 'A coluna "id_informativo" é uma pk da tabela "informativo", onde irá armazenar o id de cada informativo.';
COMMENT ON COLUMN eventos.id_administrador IS 'A coluna "id_administrador" é a PK da tabela "administradores".';
COMMENT ON COLUMN eventos.id_comunidade    IS 'A coluna "id_comunidade" será a pk da tabela "comunidades", onde irá armazenar o id de cada uma das comunidades, de forma exclusiva,sendo assim o identificador da tabela.';

--Cria tabela local_eventos e suas tabelas;
CREATE TABLE local_eventos (
                id_local_evento    NUMERIC(38) NOT NULL,
                imagem_informativo BYTEA,
                id_evento          NUMERIC(38) NOT NULL,
                --Cria chave primária da tabela local_eventos;
                CONSTRAINT pk_local_eventos PRIMARY KEY (id_local_evento)
);

--Adciona restrições às colunas da tabela local_eventos;
ALTER TABLE local_eventos ADD CONSTRAINT check_id_evento_valido CHECK (id_evento > 0);

--Adciona comentários às colunas da tabela local_eventos;
COMMENT ON TABLE  local_eventos                    IS 'A tabela "local_eventos" vai armazenar o local de cada evento, informando o logradouro, numero, bairro, entre outros.';
COMMENT ON COLUMN local_eventos.imagem_informativo IS 'A coluna "imagem_informativo" vai guardar a imagem de cada informativo (endereço do local) do evento.';
COMMENT ON COLUMN local_eventos.id_evento          IS 'A coluna "id_eventos" será responsavel por armazenar um identificador único para cada evento, sendo esta a PK.';

--Cria relacionamento entre a tabela comunidades_categorias e a tabela categorias, por meio da chave estrangeira id_categoria;
ALTER TABLE    comunidades_categorias
ADD CONSTRAINT comunidades_categorias_categorias_fk
FOREIGN KEY    (id_categoria)
REFERENCES     categorias (id_categoria)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;

--Cria relacionamento entre a tabela habilidades_funcionarios e a tabela habilidades, por meio da chave estrangeira id_habilidades;
ALTER TABLE    habilidades_funcionarios
ADD CONSTRAINT habilidades_funcionarios_habilidades_fk
FOREIGN KEY    (id_habilidade)
REFERENCES     habilidades (id_habilidade)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;

--Cria relacionamento entre a tabela comunidades_categorias e a tabela comunidades, por meio da chave estrangeira id_comunidade;
ALTER TABLE    comunidades_categorias
ADD CONSTRAINT comunidades_categorias_comunidades_fk
FOREIGN KEY    (id_comunidade)
REFERENCES     comunidades (id_comunidade)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;

--Cria relacionamento entre a tabela comunidade_funcionarios e a tabela comunidades, por meio da chave estrangeira id_comunidade;
ALTER TABLE    comunidades_funcionarios
ADD CONSTRAINT comunidades_funcionarios_comunidades_fk
FOREIGN KEY    (id_comunidade)
REFERENCES     comunidades (id_comunidade)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;

--Cria relacionamento entre a tabela eventos e a tabela comunidades, por meio da chave estrangeira id_comunidade;
ALTER TABLE    eventos
ADD CONSTRAINT eventos_comunidades_fk
FOREIGN KEY    (id_comunidade)
REFERENCES     comunidades (id_comunidade)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;

--Cria relacionamento entre a tabela eventos e a tabela informativos, por meio da chave estrangeira id_informativos;
ALTER TABLE    eventos
ADD CONSTRAINT eventos_informativos_fk
FOREIGN KEY    (id_informativo)
REFERENCES     informativos (id_informativo)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;

--Cria relacionamento entre a tabela administradores e a tabela funcionarios, por meio da chave estrangeira token_de_acesso;
ALTER TABLE    administradores
ADD CONSTRAINT administradores_funcionarios_fk
FOREIGN KEY    (token_de_acesso)
REFERENCES     funcionarios (token_de_acesso)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;

--Cria relacionamento entre a tabela habilidades_funcionarios e a tabela funcionarios, por meio da chave estrangeira token_de_acesso;
ALTER TABLE    habilidades_funcionarios
ADD CONSTRAINT habilidades_funcionarios_fk
FOREIGN KEY    (token_de_acesso)
REFERENCES     funcionarios (token_de_acesso)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;

--Cria relacionamento entre a tabela comunidades_funcionarios e a tabela funcionarios, por meio da chave estrangeira token_de_acesso;
ALTER TABLE    comunidades_funcionarios
ADD CONSTRAINT comunidades_funcionarios_funcionarios_fk
FOREIGN KEY    (token_de_acesso)
REFERENCES     funcionarios (token_de_acesso)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;

--Cria relacionamento entre a tabela eventos e a tabela administradores, por meio da chave estrangeira id_administrador;
ALTER TABLE    eventos
ADD CONSTRAINT eventos_administradores_fk
FOREIGN KEY    (id_administrador)
REFERENCES     administradores (id_administrador)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;

--Cria relacionamento entre a tabela local_eventos e a tabela eventos, por meio da chave estrangeira id_eventos;
ALTER TABLE    local_eventos
ADD CONSTRAINT local_eventos_eventos_fk
FOREIGN KEY    (id_evento)
REFERENCES     eventos (id_evento)
ON DELETE      NO ACTION
ON UPDATE      NO ACTION
NOT DEFERRABLE;
