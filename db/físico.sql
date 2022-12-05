CREATE TABLE `Artigo` (
	`id_artigo` int(11) NOT NULL,
	`titulo` varchar(45) NOT NULL,
	`email` varchar(50) NOT NULL,
	PRIMARY KEY (`id_artigo`)
);

CREATE TABLE `Atividade` (
	`data` DATE NOT NULL,
	`horario` TIME NOT NULL,
	`id_atividade` TIME NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id_atividade`)
);

CREATE TABLE `Local` (
	`nome` varchar(40) NOT NULL,
	`capacidade` int(3) NOT NULL,
	`id_local` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id_local`)
);

CREATE TABLE `Minicurso` (
	`titulo` varchar(45) NOT NULL,
	`descricao` varchar(45) NOT NULL,
	`taxa` FLOAT NOT NULL,
	`vagas_disp` int(3) NOT NULL,
	`id_atividade` int(11) NOT NULL,
	`id_participante` int(11) NOT NULL
);

CREATE TABLE `Palestra` (
	`id_atividade` TIME NOT NULL,
	`titulo` varchar(50) NOT NULL,
	`id_participante` int(11) NOT NULL
);

CREATE TABLE `Participante` (
	`id_participante` int(11) NOT NULL AUTO_INCREMENT,
	`nome` varchar(45) NOT NULL,
	`instituicao` varchar(45) NOT NULL,
	PRIMARY KEY (`id_participante`)
);

CREATE TABLE `Revisor` (
	`id_revisor` int(11) NOT NULL AUTO_INCREMENT,
	`nome` varchar(45) NOT NULL,
	`instituicao` varchar(45) NOT NULL,
	`end_rua` varchar(50) NOT NULL,
	`end_num` varchar(5) NOT NULL,
	`end_bairro` varchar(30) NOT NULL,
	`end_cidade` varchar(25) NOT NULL,
	`end_uf` varchar(2) NOT NULL,
	PRIMARY KEY (`id_revisor`)
);

CREATE TABLE `Sessao_tecnica` (
	`titulo` varchar(50) NOT NULL,
	`descricao` varchar(45) NOT NULL,
	`id_atividade` int(11) NOT NULL,
	`id_artigo` int(11) NOT NULL
);

CREATE TABLE `Especialiade` (
	`id_especialidade` int NOT NULL,
	`nome_area` varchar NOT NULL DEFAULT '100',
	`id_revisor` int(11) NOT NULL,
	PRIMARY KEY (`id_especialidade`)
);

CREATE TABLE `Contato` (
	`id_revisor` int(11) NOT NULL,
	`id_contato` int(11) NOT NULL,
	`telefone` int(12) NOT NULL,
	`fax` int(11) NOT NULL,
	PRIMARY KEY (`id_contato`)
);

CREATE TABLE `Artigo_Revisor` (
	`id_artigo` int(11) NOT NULL,
	`id_revisor` int(11) NOT NULL,
	`nota` int(3) NOT NULL
);

CREATE TABLE `Autor` (
	`id_participante` int(11) NOT NULL AUTO_INCREMENT,
	`email` varchar(50) NOT NULL AUTO_INCREMENT,
	`id_artigo` int(11) NOT NULL AUTO_INCREMENT
);

CREATE TABLE `Palavras_Chave` (
	`id_artigo` int(11) NOT NULL,
	`palavras_chave` varchar(30)
);

CREATE TABLE `Local_Atividade` (
	`id_local` int(11) NOT NULL,
	`id_atividade` int(11) NOT NULL,
	`coordenador` varchar(25) NOT NULL
);

CREATE TABLE `Inscrito` (
	`id_participante` int(11) NOT NULL,
	`categoria` enum(4) NOT NULL,
	`email` varchar(50) NOT NULL,
	`endereco` varchar(100) NOT NULL,
	`telefone` int(12) NOT NULL
);

CREATE TABLE `Cientista` (
	`id_participante` int(11) NOT NULL,
	`cod_voo` varchar(20) NOT NULL,
	`cia_voo` varchar(30) NOT NULL,
	`dt_voo_ida` DATE NOT NULL,
	`dt_voo_volta` DATE NOT NULL,
	`hr_voo_ida` TIME NOT NULL,
	`hr_voo_volta` TIME NOT NULL
);

ALTER TABLE `Minicurso` ADD CONSTRAINT `Minicurso_fk0` FOREIGN KEY (`id_atividade`) REFERENCES `Atividade`(`id_atividade`);

ALTER TABLE `Minicurso` ADD CONSTRAINT `Minicurso_fk1` FOREIGN KEY (`id_participante`) REFERENCES `Cientista`(`id_participante`);

ALTER TABLE `Palestra` ADD CONSTRAINT `Palestra_fk0` FOREIGN KEY (`id_atividade`) REFERENCES `Cientista`(`id_participante`);

ALTER TABLE `Palestra` ADD CONSTRAINT `Palestra_fk1` FOREIGN KEY (`id_participante`) REFERENCES `Cientista`(`id_participante`);

ALTER TABLE `Sessao_tecnica` ADD CONSTRAINT `Sessao_tecnica_fk0` FOREIGN KEY (`id_atividade`) REFERENCES `Atividade`(`id_atividade`);

ALTER TABLE `Sessao_tecnica` ADD CONSTRAINT `Sessao_tecnica_fk1` FOREIGN KEY (`id_artigo`) REFERENCES `Artigo`(`id_artigo`);

ALTER TABLE `Especialiade` ADD CONSTRAINT `Especialiade_fk0` FOREIGN KEY (`id_revisor`) REFERENCES `Revisor`(`id_revisor`);

ALTER TABLE `Contato` ADD CONSTRAINT `Contato_fk0` FOREIGN KEY (`id_revisor`) REFERENCES `Revisor`(`id_revisor`);

ALTER TABLE `Artigo_Revisor` ADD CONSTRAINT `Artigo_Revisor_fk0` FOREIGN KEY (`id_artigo`) REFERENCES `Artigo`(`id_artigo`);

ALTER TABLE `Artigo_Revisor` ADD CONSTRAINT `Artigo_Revisor_fk1` FOREIGN KEY (`id_revisor`) REFERENCES `Revisor`(`id_revisor`);

ALTER TABLE `Autor` ADD CONSTRAINT `Autor_fk0` FOREIGN KEY (`id_participante`) REFERENCES `Participante`(`id_participante`);

ALTER TABLE `Autor` ADD CONSTRAINT `Autor_fk1` FOREIGN KEY (`id_artigo`) REFERENCES `Artigo`(`id_artigo`);

ALTER TABLE `Palavras_Chave` ADD CONSTRAINT `Palavras_Chave_fk0` FOREIGN KEY (`id_artigo`) REFERENCES `Artigo`(`id_artigo`);

ALTER TABLE `Local_Atividade` ADD CONSTRAINT `Local_Atividade_fk0` FOREIGN KEY (`id_local`) REFERENCES `Local`(`id_local`);

ALTER TABLE `Local_Atividade` ADD CONSTRAINT `Local_Atividade_fk1` FOREIGN KEY (`id_atividade`) REFERENCES `Atividade`(`id_atividade`);

ALTER TABLE `Inscrito` ADD CONSTRAINT `Inscrito_fk0` FOREIGN KEY (`id_participante`) REFERENCES `Participante`(`id_participante`);

ALTER TABLE `Cientista` ADD CONSTRAINT `Cientista_fk0` FOREIGN KEY (`id_participante`) REFERENCES `Participante`(`id_participante`);

















