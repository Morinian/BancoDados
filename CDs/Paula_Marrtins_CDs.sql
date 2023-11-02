create database DB_CDS;
use DB_CDS;

-- 1
create table tb_artista (
    cod_art int primary key not null auto_increment,
    nome_art varchar (100) not null unique key
);

-- 2
create table tb_gravadora(
    cod_gray int not null primary key,
    nome_grav varchar (50) not null unique key
);

-- 3
create table tb_categoria (
    cod_cat int not null primary key,
    nome_cat varchar (50) not null unique key
);

-- 4
create table estado(
PK_sigla_est char(02) primary key not null,
nome_est char (50) unique 
);

-- 5
create table cidade(
PK_cod_cid int primary key not null,
nome_cid varchar(100) not null,
sigla_est char(2) not null,

foreign key (sigla_est) references estado(PK_sigla_est)
);

-- 6
create table cliente(
cod_cli int not null primary key,
cod_cid int not null , -- chave estrangeira
nome_cli varchar(100) not null,
end_cli varchar(100) not null,
renda_cli decimal(10,2) not null default 0 check (renda_cli >= 0),
sexo_cli char(1) not null default 'F' check (sexo_cli in ('F', 'M')),

foreign key (cod_cid) references cidade(PK_cod_cid)
);

-- 7
create table Conjuge(
    cod_cli int primary key not null,
    nome_conj varchar(100) not null,
    renda_conj decimal(10,2) not null default 0 check (renda_conj >= 0),
    sexo_conj char(1) not null default 'M' check (sexo_conj in ('F', 'M')),

    foreign key (cod_cli) references cliente(cod_cli)
);

-- 8
create table funcionario(
    cod_func int primary key not null,
    nome_func varchar(100) not null,
    end_func varchar(200) not null,
    sal_func decimal(10,2) not null default 0 check (sal_func >= 0),
    sexo_func char(1) not null default 'M' check (sexo_func in ('F', 'M'))
);

-- 9
create table dependente (
    cod_dep int not null primary key,
    cod_func int not null,
    nome_dep varchar (100) not null,
    sexo_dep char(1) not null default 'M' check (sexo_dep in ('F', 'M')),

    foreign key (cod_func) references funcionario (cod_func)
);

-- 10
create table Titulo (
	cod_tit int not null primary key,
    cod_cat int not null, -- chave estrangeira
    cod_grav int not null, -- chave estrangeira
    nome_cd varchar(100) not null unique,
    val_cd decimal(10,2) not null DEFAULT 0 CHECK (val_cd > 0),
    qtd_estq int not null DEFAULT 0 CHECK (qtd_estq >= 0),
    
    foreign key (cod_cat) references tb_categoria(cod_cat),
    foreign key (cod_grav) references tb_gravadora(cod_gray)
);


-- 11
create table Pedido(
	num_Ped int primary key not null, 
    cod_cli int not null, -- chave estrangeira
    cod_func int not null, -- chave estrangeira
    data_ped datetime not null,
    val_ped decimal(10,2) not null default 0 check (val_ped >= 0),
    
	foreign key (cod_cli) references cliente(cod_cli),
    foreign key (cod_func) references funcionario(cod_func)
);

-- 12
create table  Titulo_Pedido (
    num_ped INT NOT NULL,
    cod_Tit INT NOT NULL,
    qtd_CD INT NOT NULL CHECK (qtd_CD >= 1),
    val_CD DECIMAL(10,2) NOT NULL CHECK (val_CD > 0),
    
    PRIMARY KEY (num_ped, cod_Tit),
    FOREIGN KEY (num_ped) REFERENCES Pedido(num_Ped),
    FOREIGN KEY (cod_Tit) REFERENCES Titulo(cod_tit)
);


-- 13
create table Titulo_Artista(
	cod_tit int not null,
    cod_art int not null,
    
	PRIMARY KEY (cod_tit, cod_art),
	FOREIGN KEY (cod_tit) REFERENCES Titulo(cod_tit),
    FOREIGN KEY (cod_art) REFERENCES tb_artista(cod_art)
);
