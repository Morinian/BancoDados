create database db_consultorio;
use db_consultorio;

create table tb_consulta(
	PK_idcons int primary key not null auto_increment,
    data_cons datetime,
    exames_cons varchar(50)
);

create table tb_medico(
	PK_idmedic int primary key not null auto_increment,
    nome_medic varchar(45),
    telef_medic varchar(9),
    crm_medic  varchar(13),
    endereco_medic varchar(50),
    dnasci_medic date
);
create table tb_paciente(
	PK_idpaci int primary key not null auto_increment,
    nome_paci varchar(45),
    telef_paci varchar(12),
    convenio_paci  varchar(45),
    endereco_paci varchar(50),
    dnasci_paci date
);
create table tb_receita(
	PK_idreceita int primary key not null auto_increment,
	descricao_receita varchar(45),
    remedio_receita varchar(200),
    data_receita date,
    vence_receita date,
    num_receita varchar(11)
);

describe tb_consulta;
select * from tb_medico,tb_paciente, tb_consulta,tb_receita;

/*Chaves estrangeiras*/
alter table tb_consulta add column FK_idmedic int; 
alter table tb_consulta add column FK_idpaci int; 
alter table tb_consulta add column FK_idreceita int; 

alter table tb_consulta
add constraint FK_idmedic
foreign key (FK_idmedic) references tb_medico(PK_idmedic);

alter table tb_consulta
add constraint FK_idpaci
foreign key (FK_idpaci) references tb_paciente(PK_idpaci);

alter table tb_consulta
add constraint FK_idreceita
foreign key (FK_idreceita) references tb_receita(PK_idreceita);


