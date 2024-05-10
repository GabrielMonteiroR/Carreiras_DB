create table especie(
	id_especie int not null primary key auto_increment,
	nome varchar(60)
);

insert into especie values(null, 'gato');
insert into especie values(null, 'cachorro');

create table raca(
	id_raca int not null primary key auto_increment,
	nome varchar(60)
);

insert into raca values
(null, 'vira lata'),
(null, 'pastor alemao'),
(null, 'pitbull'),
(null, 'ilhasa');

alter table raca add column id_especie int;

alter table raca
add constraint FK_id_especie
foreign key (id_especie) references especie(id_especie);

insert into raca values
(null, 'siames', 2);

create table animal (
	id int not null primary key auto_increment,
	nome varchar(100),
	porte char(1),
	sexo char(1),
	peso decimal(15,2),
	id_raca int not null,
	foreign key (id_raca) references raca(id_raca)
);

insert into animal values(null, 'neguin', 'M', 'M', 15.5, 1);
insert into animal values(null, 'betovem', 'G', 'M', 30, 1);
insert into animal values(null, 'caramelo', 'P', 'F', 9, 1);
insert into animal values(null, 'bixano', 'P', 'M', 10, 2);

insert into animal values(null, 'ALFREDO', 'G', 'M', 20, 1);
insert into animal values(null, 'Beterraba', 'P', 'F', 8, 1);
insert into animal values(null, 'Linguado', 'P', 'M', 5, 2);
insert into animal values(null, 'QUINTANA', 'P', 'F', 6, 2);
insert into animal values(null, 'carlos', 'P', 'M', 9, 2);


INSERT INTO animal (nome, porte, sexo, peso, id_raca)
VALUES ('Rex', 'M', 'M', 20.5, 2),
       ('Luna', 'P', 'F', 8.2, 1),
       ('Max', 'G', 'M', 35.7, 3),
       ('Bela', 'M', 'F', 18.9, 4),
       ('Thor', 'G', 'M', 42.3, 2),
       ('Mia', 'P', 'F', 7.5, 1),
       ('Rocky', 'M', 'M', 23.1, 3),
       ('Lola', 'P', 'F', 9.8, 1),
       ('Bruno', 'G', 'M', 38.6, 2),
       ('Daisy', 'M', 'F', 16.4, 4),
       ('Zeus', 'G', 'M', 44.8, 2),
       ('Bella', 'P', 'F', 6.3, 1),
       ('Charlie', 'M', 'M', 25.9, 3),
       ('Molly', 'P', 'F', 8.7, 1),
       ('Buddy', 'G', 'M', 40.2, 2),
       ('Lucy', 'M', 'F', 14.5, 4),
       ('Cooper', 'G', 'M', 47.6, 2),
       ('Sophie', 'P', 'F', 5.9, 1),
       ('Bailey', 'M', 'M', 28.3, 3),
       ('Maggie', 'P', 'F', 7.1, 1),
       ('Jack', 'M', 'M', 22.4, 2),
       ('Chloe', 'P', 'F', 7.3, 1),
       ('Duke', 'G', 'M', 39.1, 3),
       ('Zoe', 'M', 'F', 17.8, 4),
       ('Sam', 'G', 'M', 43.5, 2),
       ('Coco', 'P', 'F', 6.6, 1),
       ('Toby', 'M', 'M', 26.7, 3),
       ('Sasha', 'P', 'F', 8.1, 1),
       ('Maximus', 'G', 'M', 45.2, 2),
       ('Lilly', 'M', 'F', 15.2, 4),
       ('Oscar', 'G', 'M', 50.9, 2),
       ('Rosie', 'P', 'F', 5.5, 1),
       ('Leo', 'M', 'M', 29.8, 3),
       ('Pepper', 'P', 'F', 6.9, 1),
       ('Bear', 'G', 'M', 48.7, 2),
       ('Lulu', 'M', 'F', 13.6, 4),
       ('Riley', 'G', 'M', 55.3, 2),
       ('Sadie', 'P', 'F', 7.8, 1),
       ('Jake', 'M', 'M', 32.1, 3),
       ('Ruby', 'P', 'F', 6.2, 1),
       ('Maxwell', 'G', 'M', 46.8, 2),
       ('Misty', 'M', 'F', 16.7, 4),
       ('Buster', 'G', 'M', 52.1, 2),
       ('Nala', 'P', 'F', 5.4, 1),
       ('Bentley', 'M', 'M', 34.6, 3),
       ('Penny', 'P', 'F', 6.8, 1),
       ('Rocky', 'G', 'M', 49.5, 2),
       ('Milo', 'M', 'M', 31.5, 3),
       ('Lucky', 'P', 'F', 7.2, 1),
       ('Shadow', 'G', 'M', 56.2, 2);










