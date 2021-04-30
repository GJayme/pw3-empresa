# pw3-empresa

##Scrip BD:


create database empresa;
use empresa;

create table users (
	id int auto_increment not null,
    nome varchar(30) not null,
    email varchar(50),
    cpf varchar(15),
    username varchar(10),
    password varchar(60),
    primary key(id)
);

insert into users(nome, email, cpf, username, password) values('gabriel', 'gabriel@mail.com', 11111111111, 'gabriel', MD5('gabriel'));

select * from users;
