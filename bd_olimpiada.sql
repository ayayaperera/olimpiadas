drop database if exists bd_olimpiada;
create database bd_olimpiada;
use bd_olimpiada;

create table Olimpiada (
Cod_Olimpiada varchar (10) not null,
Nombre varchar (15),
Año decimal,
Edicion decimal,
primary key (Cod_Olimpiada)
);

insert into Olimpiada values(0012004,'JJ.OO. Japon 04',2004,1);
insert into Olimpiada values(0022008,'JJ.OO.Holanda08',2008,2);
insert into Olimpiada values(0032012,'JJ.OO. EEUU 12',2012,3);
insert into Olimpiada values(0042016,'JJ.OO. UK 16',2016,4);
insert into Olimpiada values(0052020,'JJ.OO. Brasil20',2020,5);

create table Ciudad (
Cod_Ciudad varchar (15) not null,
Nombre varchar (15),
Poblacion decimal,
primary key (Cod_Ciudad),
Cod_Olimpiada varchar (10) not null
);

insert into Ciudad values(111001,'Tokio','21089426',0012004);
insert into Ciudad values(212002,'Amsterdam','13574435',0022008);
insert into Ciudad values(313003,'New York','20457976',0032012);
insert into Ciudad values(414004,'Londres','16084524',0042016);
insert into Ciudad values(515005,'Janeiro','29353012',0052020);


create table Deporte (
Cod_Deporte varchar (10),
Nombre varchar (15),
Categoria varchar (15),
primary key (Cod_Deporte)
);

insert into Deporte values(01001111,'Baloncesto','Absoluta');
insert into Deporte values(02002222,'Tenis','Top10');
insert into Deporte values(03003333,'Judo','Absoluta');
insert into Deporte values(04004444,'Futbol','Sub21');
insert into Deporte values(05005555,'Vela','Top10');


create table Comisario (
DNI varchar (9) unique,
Nombre varchar (10),
Apellidos varchar (15), 
Profesion varchar (20),
primary key (DNI),
Cod_Deporte varchar (10)
);

insert into Comisario values('49023783F','Francisco','Perez','Arbitro',01001111);
insert into Comisario values('49317539G','Diego','Hernandez','Tenis',02002222);
insert into Comisario values('42094541L','Anabel','Hernandez','Vela',03003333);
insert into Comisario values('48472853R','Esteban','Lopez','Baloncesto',04004444);
insert into Comisario values('42092743W','Aday','Gutierrez','Judo',05005555);


create table Deportista (
DNI varchar (9) unique,
Nombre varchar (10),
Apellidos varchar (15),
Edad decimal,
Fecha_Nac date,
primary key (DNI)
);

insert into Deportista values('48725442T', 'Aurelio', 'Ramirez', '39','1984-05-21');
insert into Deportista values('47354524D', 'Marta', 'Gonzalez', '40','1982-09-06');
insert into Deportista values('41032473J', 'Braulio', 'Vega', '46','1976-03-09');
insert into Deportista values('42252245Z', 'Ana', 'Martinez', '27','1996-01-21');
insert into Deportista values('44326349T', 'Aitor', 'Alvarez', '39','1984-11-21');


create table Equipamiento (
Cod_Equipamiento varchar (10) not null,
Nombre varchar (10),
Cantidad decimal,
Talla varchar (2),
primary key (Cod_Equipamiento),
DNI varchar (9) unique
);

insert into Equipamiento values(10100101,'Pelota',20,'M','48725442T');
insert into Equipamiento values(20200202,'Raqueta',50,'L','47354524D');
insert into Equipamiento values(30300303,'Cinta',10,'S','41032473J');
insert into Equipamiento values(40400404,'Botas',70,'43','42252245Z');
insert into Equipamiento values(50500505,'Poleas',100,'3','44326349T');


create table Pais (
Cod_Pais varchar (10) not null,
Nombre varchar (10),
Capital varchar (15),
Poblacion decimal,
primary key (Cod_Pais)
);

insert into Pais values(83452,'España','Madrid','47294857');
insert into Pais values(45023,'Francia','Paris','67753879');
insert into Pais values(02389,'China','Pekin','1412045184');
insert into Pais values(05307,'Australia','Sidney','47294857');
insert into Pais values(63820,'Colombia','Bogota','51520572');


create table Medalla (
Cod_Medalla varchar (10) not null,
Nombre varchar (10),
Posicion varchar (10),
Premio varchar (10),
primary key (Cod_Medalla),
Cod_Pais varchar (10) not null
);

insert into Medalla values('1010101','Oro',1,10000,83452);
insert into Medalla values('2020202','Plata',2,7000,02389);
insert into Medalla values('3030303','Bronce',3,3000,45023);


create table Participan (
Cod_Deporte varchar (10),
DNI varchar (9) unique,
primary key (Cod_Deporte,DNI)
);

insert into Participan values(01001111,'48725442T');
insert into Participan values(02002222,'47354524D');
insert into Participan values(03003333,'41032473J');
insert into Participan values(04004444,'42252245Z');
insert into Participan values(05005555,'44326349T');


create table Se_Desarrollan (
Cod_Ciudad varchar (15) not null,
Cod_Deporte varchar (10),
primary key (Cod_Ciudad,Cod_Deporte)
);

insert into Se_Desarrollan values(111001,01001111);
insert into Se_Desarrollan values(212002,02002222);
insert into Se_Desarrollan values(313003,03003333);
insert into Se_Desarrollan values(414004,04004444);
insert into Se_Desarrollan values(515005,05005555);


create table Participa (
Cod_Olimpiada varchar (10) not null,
Cod_Pais varchar (10) not null,
primary key (Cod_Olimpiada,Cod_Pais)
);

insert into Participa values(0012004,83452);
insert into Participa values(0022008,45023);
insert into Participa values(0032012,02389);
insert into Participa values(0042016,05307);
insert into Participa values(0052020,63820);


alter table Participan
add constraint fk_1 foreign key (Cod_Deporte) references Deporte (Cod_Deporte)
on update cascade,
add constraint fk_2 foreign key (DNI) references Deportista (DNI)
on update cascade;
alter table Se_Desarrollan 
add constraint fk_3 foreign key (Cod_Ciudad) references Ciudad (Cod_Ciudad)
on update cascade,
add constraint fk_4 foreign key (Cod_Deporte) references Deporte (Cod_Deporte)
on update cascade;
alter table Participa
add constraint fk_5 foreign key (Cod_Olimpiada) references Olimpiada (Cod_Olimpiada)
on update cascade,
add constraint fk_6 foreign key (Cod_Pais) references Pais (Cod_Pais)
on update cascade;
alter table Medalla
add constraint fk_7 foreign key (Cod_Pais) references Pais (Cod_Pais)
on update cascade;
alter table Ciudad
add constraint fk_8 foreign key (Cod_Olimpiada) references Olimpiada (Cod_Olimpiada)
on update cascade;
alter table Comisario
add constraint fk_9 foreign key (Cod_Deporte) references Deporte (Cod_Deporte)
on update cascade;
alter table Equipamiento
add constraint fk_10 foreign key (DNI) references Deportista (DNI)
on update cascade;