create sequence seq_locatie
start with 100
increment by 1
maxvalue 10000
nocycle
nocache;


create table LOCATIE(
id_locatie number(5) constraint pk_loc primary key,
judet varchar2(20) constraint null_loc_jud not null,
oras varchar2(20) constraint null_oras_jud not null,
sector number(1),
nume_strada varchar(30),
nr number(3));
alter table locatie
modify(sector constraint ck_sector_locatie check(sector<=6 and sector>=1));

insert into locatie(id_locatie,judet,oras,sector,nume_strada,nr)
values(SEQ_LOCATIE.nextval, 'Ilfov', 'Bucuresti', 3, 'Liviu Rebreanu', 10);
insert into locatie(id_locatie,judet,oras,sector,nume_strada,nr)
values(SEQ_LOCATIE.nextval, 'Ilfov', 'Bucuresti', 1,'Stelutei', 24);
insert into locatie(id_locatie,judet,oras,sector,nume_strada,nr)
values(SEQ_LOCATIE.nextval,'Ilfov', 'Bucuresti', 5, 'Livezilor', 105);
insert into locatie(id_locatie,judet,oras,sector,nume_strada,nr)
values(SEQ_LOCATIE.nextval, 'Brasov', 'Brasov', null,'Gradinarilor', 54);
insert into locatie(id_locatie,judet,oras,sector,nume_strada,nr)
values(SEQ_LOCATIE.nextval, 'Buzau', 'Buzau', null, 'Transilvaniei', 431);
insert into locatie(id_locatie,judet,oras,sector,nume_strada,nr)
values(SEQ_LOCATIE.nextval, 'Brasov', 'Brasov', null,'Bujorilor', 5);
insert into locatie(id_locatie,judet,oras,sector,nume_strada,nr)
values(SEQ_LOCATIE.nextval, 'Brasov', 'Brasov', null,'Independentei', 98);



------COFETARIE------

create table COFETARIE(
id_cofetarie number(5) constraint pk_cofet primary key, 
nr_locuri number (3) constraint null_cofet_locuri not null,
id_locatie number(5));
alter table cofetarie
modify(id_locatie constraint null_loc_cofet not null);
alter table cofetarie
add constraint fk_cofet_loc foreign key(id_locatie) references locatie(id_locatie);

---------inserare--------
insert into cofetarie(id_cofetarie,nr_locuri,id_locatie)
values(200, 80, 100);
insert into cofetarie(id_cofetarie,nr_locuri,id_locatie)
values(201,50, 103);
insert into cofetarie(id_cofetarie,nr_locuri,id_locatie)
values(202,68, 104);
insert into cofetarie(id_cofetarie,nr_locuri,id_locatie)
values(203,76,105);
insert into cofetarie(id_cofetarie,nr_locuri,id_locatie)
values(204, 45, 109);



-----ANGAJAT-----
create table ANGAJAT(
id_angajat number(5) constraint pk_angaj primary key,
nume varchar2(25) constraint null_nume_angaj not null, 
prenume varchar2(25), 
salariu number(6,2) constraint ck_sal_angaj check(salariu >= 2000),
sex char(1) constraint ck_sex_angaj check(sex in ('m','f')), 
cnp char(13), 
telefon char(10) constraint unq_tel_angaj unique, 
id_cofetarie number(5));
alter table angajat
modify(id_cofetarie constraint null_cofet_angaj not null);
alter table angajat
add constraint fk_angajat_cofet foreign key(id_cofetarie) references cofetarie(id_cofetarie);

--inserare
insert into angajat(id_angajat,prenume,nume,salariu,sex,cnp,telefon,id_cofetarie)
values(300, 'Mihaela','Romeo',2500,'f',null,'0789978123',200);
insert into angajat(id_angajat,prenume,nume,salariu,sex,cnp,telefon,id_cofetarie)
values(301,'Daniela','Florina',2650,'f','6210505426542','0787987532',200);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(302,'Mihai','Otilia',3000,'m','5120504428308','0724098723',201);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(303,'Liliana','Maria',2100,'f','6120523427584','0734981372',201);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(304,'Ecaterina','Doina',3600,'f',null,'0743908453',201);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(305,'Cezara','Vera',3200,'f','2920509428948','0754098372',201);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(306,'Ecaterina','Manuela',2700,'f','2920513429156','0712096392',201);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(307,'Olimpia','Steliana',2100,'f','2920523427756','0798721392',202);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(308,'Mihai','Catrinel', 2450,'m','1920523429782','0723071382', 202);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(309,'Costel','Bogdana',3100,'m','1920511427921','0734209281',202);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(310,'Razvan','Marin',3900,'m','1820512427346','0712987302',202);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(311,'Danut','Costache',3100,'m','1820516425271','0710987392',202);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(312,'Georgiana','Adi',2999,'f','2840504428450','0743981039',203);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(313,'Adam','Robert',2789,'m','1840522428251','0765098321',203);
insert into angajat(id_angajat,prenume, nume,salariu,sex,cnp,telefon,id_cofetarie)
values(314,'Albert','Marin',2300,'m','1870514427190','0729876201',203);



----COFETAR----
create table cofetar(
id_angajat number(5) constraint pk_cofetar primary key,
specializare varchar2(10) constraint null_spec_cofetar not null);

alter table cofetar
add constraint fk_cofetar_angajat foreign key(id_angajat) references angajat(id_angajat) on delete cascade;
---inserare---
insert into cofetar(id_angajat,specializare)
values(300,'prajituri');
insert into cofetar(id_angajat,specializare)
values(302,'torturi');
insert into cofetar(id_angajat,specializare)
values(307,'sucuri');
insert into cofetar(id_angajat,specializare)
values(312,'torturi');
insert into cofetar(id_angajat,specializare)
values(301,'prajituri');



----chelner----
create table chelner(
id_angajat number(5) constraint pk_chelner primary key,
program_start number(2) constraint ck_prog_st_chelner check(program_start >= 7 and program_start <= 11),
program_final number(2) constraint ck_prog_fin_chelner check(program_final >= 13 and program_final <= 18),
zi_vanzator number(1) constraint ck_zi_vanz_chelner check(zi_vanzator >= 1 and zi_vanzator <= 7));

alter table chelner
add constraint fk_chelner_angajat foreign key(id_angajat) references angajat(id_angajat) on delete cascade;
---inserare

insert into chelner(id_angajat,program_start,program_final,zi_vanzator)
values(303,7,17,1);
insert into chelner(id_angajat,program_start,program_final,zi_vanzator)
values(308,8,18,3);
insert into chelner(id_angajat,program_start,program_final,zi_vanzator)
values(313,11,15,7);
insert into chelner(id_angajat,program_start,program_final,zi_vanzator)
values(304,9,16,4);
insert into chelner(id_angajat,program_start,program_final,zi_vanzator)
values(306,7,15,2);



-------sofer livrator------
create table sofer_livrari(
id_angajat number(5) constraint pk_sofer_livrari primary key,
nr_livrari_zi number(2));

alter table sofer_livrari
add constraint fk_sofer_livrari_angajat foreign key(id_angajat) references angajat(id_angajat) on delete cascade;
--inserare
insert into sofer_livrari(id_angajat,nr_livrari_zi)
values(311,15);
insert into sofer_livrari(id_angajat,nr_livrari_zi)
values(314, 10);
insert into sofer_livrari(id_angajat,nr_livrari_zi)
values(310,12);
insert into sofer_livrari(id_angajat,nr_livrari_zi)
values(305,20);
insert into sofer_livrari(id_angajat,nr_livrari_zi)
values(309,13);



create table istoric(
id_angajat number(5) constraint null_id_ang_istoric not null, 
data_angajare date default sysdate, 
id_cofetarie number(5), 
tip_angajat varchar2(14), 
experienta number(2),

constraint pk_istoric primary key (id_angajat,data_angajare)
);
alter table istoric
add constraint fk_istoric_angajat foreign key(id_angajat) references angajat(id_angajat) on delete cascade;
alter table istoric
add constraint fk_istoric_cofetarie foreign key(id_cofetarie) references cofetarie(id_cofetarie) on delete set null;
--inserare

insert into istoric(id_angajat,data_angajare,id_cofetarie,tip_angajat,experienta)
values(303,to_date('23.09.2006','dd.mm.yyyy'),200,'sofer', 12);
insert into istoric(id_angajat,data_angajare,id_cofetarie,tip_angajat,experienta)
values(303, to_date('12.03.2010','dd.mm.yyyy'),201,'chelner',NULL);
insert into istoric(id_angajat,data_angajare,id_cofetarie,tip_angajat,experienta)
values(302, to_date('10.06.2011','dd.mm.yyyy'),203,'chelner',18);
insert into istoric(id_angajat,data_angajare,id_cofetarie,tip_angajat,experienta)
values(302,add_months(to_date('10.06.2011','dd.mm.yyyy'),18),201,'chelner',6);
insert into istoric(id_angajat,data_angajare,id_cofetarie,tip_angajat,experienta)
values(302,add_months(to_date('10.06.2011','dd.mm.yyyy'),24),201,'cofetar',null);
insert into istoric(id_angajat,data_angajare,id_cofetarie,tip_angajat,experienta)
values(308,add_months(to_date('24.04.2009','dd.mm.yyyy'),24),202,'cofetar',null);
insert into istoric(id_angajat,data_angajare,id_cofetarie,tip_angajat,experienta)
values(313,to_date('19.04.2010','dd.mm.yyyy'),204,'chelner', null);



-----CLIENT-----
create table client(
id_client number(5) constraint pk_client primary key,
nume varchar2(25) constraint null_nume_client not null,
prenume varchar2(25),
telefon char(10) constraint null_telefon_client not null,
constraint unq_nume_prenume_client unique(nume,prenume)
);

insert into client(id_client,prenume,nume,telefon)
values(401,'Liliana','Nicu','0786392841');
insert into client(id_client,prenume,nume,telefon)
values(400,'Ecaterina', 'Sara','0789812983');
insert into client(id_client,prenume,nume,telefon)
values(402, 'Mihai', 'Aurel','0723087631');
insert into client(id_client,prenume,nume,telefon)
values(403,'Dinu','Codrin','0786392861');
insert into client(id_client,prenume,nume,telefon)
values(404,'Mihai','Flavia','0720876153');



create table CLIENT_CHELNER_PRODUS(
id_client number(5),
id_angajat number(5),
id_produs number(5),
cantitate number(2),
constraint pk_client_chelner_produs primary key(id_client, id_angajat, id_produs));

alter table CLIENT_CHELNER_PRODUS
add constraint fk_ccp_client foreign key(id_client) references client(id_client) on delete cascade;
alter table CLIENT_CHELNER_PRODUS
add constraint fk_ccp_chelner foreign key(id_angajat) references chelner(id_angajat) on delete cascade;
alter table CLIENT_CHELNER_PRODUS
add constraint fk_ccp_produs foreign key(id_produs) references produs(id_produs) on delete cascade;

--inserare
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(401,303,505,1);
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(401,303,509,1);
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(401,303,511,1);
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(400,306,514,1);
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(400,306,511,1);
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(400,306,506,4);
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(400,306,507,1);
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(404,308,512,1);
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(404,308,511,1);
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(404,308,505,1);
insert into client_chelner_produs(id_client,id_angajat,id_produs,cantitate) values(400,303,512,1);



create table comanda(
id_comanda number(5), 
id_client number(5), 
suma number (5,2) constraint null_suma_comanda not null, 
data_onorare date default sysdate, 
id_locatie number(5), 
id_chelner number(5), 
id_sofer number(5),

constraint pk_comanda primary key(id_comanda, id_client)
);

alter table comanda
modify(id_locatie constraint null_loc_comanda not null);

alter table comanda
add constraint fk_comanda_client foreign key(id_client) references client(id_client) on delete cascade;
alter table comanda
add constraint fk_comanda_locatie foreign key(id_locatie) references locatie(id_locatie) on delete cascade;
alter table comanda
add constraint fk_comanda_chelner foreign key(id_chelner) references chelner(id_angajat) on delete set null;
alter table comanda
add constraint fk_comanda_sofer foreign key(id_sofer) references sofer_livrari(id_angajat) on delete set null;

--inserare
insert into comanda(id_comanda,id_client,suma,data_onorare,id_locatie, id_chelner, id_sofer)
values(1,400,300,to_date('18.06.2021','dd.mm.yyyy'), 108, null, 310);
insert into comanda(id_comanda,id_client,suma,data_onorare,id_locatie, id_chelner, id_sofer)
values(2,400,210.99,to_date('21.08.2021','dd.mm.yyyy'),109,308,310);
insert into comanda(id_comanda,id_client,suma,data_onorare,id_locatie, id_chelner, id_sofer)
values(1,403,100,to_date('01.06.2021','dd.mm.yyyy'), 105, null, null);
insert into comanda(id_comanda,id_client,suma,data_onorare,id_locatie, id_chelner, id_sofer)
values(2,403,20,to_date('14.06.2021','dd.mm.yyyy'), 105, null, null);
insert into comanda(id_comanda,id_client,suma,data_onorare,id_locatie, id_chelner, id_sofer)
values(3,403,59.99,to_date('30.09.2021','dd.mm.yyyy'), 105, null, null);



create table comanda_produs(
id_comanda number(5), 
id_client number(5),
id_produs number(5),
cantitate number(2),
constraint pk_comanda_produs primary key(id_comanda, id_client, id_produs)
);

alter table comanda_produs
add constraint fk_cp_comanda foreign key(id_comanda, id_client) references comanda(id_comanda, id_client) on delete cascade;
alter table comanda_produs
add constraint fk_cp_produs foreign key(id_produs) references produs(id_produs) on delete cascade;
alter table comanda_produs modify(id_produs constraint null_produs_cp not null);

--inserare
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (1,400,500,1);
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (1,400,505,1);
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (1,400,508,1);
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (1,400,511,1);
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (1,400,509,1);
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (2,403,505,1);
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (2,403,509,1);
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (3,403,506,4);
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (3,403,507,4);
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (3,403,508,1);
insert into comanda_produs(id_comanda, id_client, id_produs,cantitate) values (3,403,509,1);



-----PRODUS-----
create table produs(
id_produs number(5) constraint pk_produs primary key,
nume varchar2(25),
pret number(5,2));

--inserari
insert into produs(id_produs, nume, pret)
values(500, 'Tort cu fructe', 40);
insert into produs(id_produs, nume, pret)
values(501,'Tort cu mascarpone', 59.99);
insert into produs(id_produs, nume, pret)
values(502,'Tort de ciocolata',69.99);
insert into produs(id_produs, nume, pret)
values(503,'Tort de lamaie', 30.99);
insert into produs(id_produs, nume, pret)
values(504,'Tort cu caramel',55.5);
insert into produs(id_produs, nume, pret)
values(505,'Budinca cu ciocolata', 8.99);
insert into produs(id_produs, nume, pret)
values(506,'Mini cheesecake', 5.99);
insert into produs(id_produs, nume, pret)
values(507,'Prajitura cu nuci',6.99);
insert into produs(id_produs, nume, pret)
values(508,'Clatite cu ciocolata',5.99);
insert into produs(id_produs, nume, pret)
values(509,'Prajitura cu capsuni',7.99);
insert into produs(id_produs, nume, pret)
values(510,'Suc de portocale',4.99);
insert into produs(id_produs, nume, pret)
values(511,'Limonada', 5.99);
insert into produs(id_produs, nume, pret)
values(512,'Suc de mere', 10.99);
insert into produs(id_produs, nume, pret)
values(513,'Suc de rodii', 12.99);
insert into produs(id_produs, nume, pret)
values(514, 'Suc kiwi', 8.99);



create table prajitura(
id_produs number(5) constraint pk_prajitura primary key,
nr_praj_disc number(1),
discount number (3,2),
gramaj number(3) constraint ck_gramaj_praj check(gramaj >= 50 and gramaj <= 150)
);

alter table prajitura
add constraint fk_prajitura_produs foreign key(id_produs) references produs(id_produs) on delete cascade;

--inserari
insert into prajitura(id_produs,nr_praj_disc,discount, gramaj)
values(505,null,null, 80);
insert into prajitura(id_produs,nr_praj_disc,discount, gramaj)
values(506, 4, 0.25,60);
insert into prajitura(id_produs,nr_praj_disc,discount, gramaj)
values(507, 4, 0.25, 70);
insert into prajitura(id_produs,nr_praj_disc,discount, gramaj)
values(508, null, null, 100);
insert into prajitura(id_produs,nr_praj_disc,discount, gramaj)
values(509, null, null, 90);



create table tort(
id_produs number(5) constraint pk_tort primary key,
portii_servire number(2),
gramaj number(3) constraint ck_gramaj_tort check(gramaj >= 50 and gramaj <= 150)
);

alter table tort
add constraint fk_tort_produs foreign key(id_produs) references produs(id_produs) on delete cascade;

--inserari
commit;
insert into tort(id_produs, portii_servire, gramaj)
values(500, 16, 100);
insert into tort(id_produs, portii_servire, gramaj)
values(501, 14, 90);
insert into tort(id_produs, portii_servire, gramaj)
values(502, 15, 100);
insert into tort(id_produs, portii_servire, gramaj)
values(503, 10, 120);
insert into tort(id_produs, portii_servire, gramaj)
values(504, 12, 110);



create table suc(
id_produs number(5) constraint pk_suc primary key,
volum number(4) constraint null_vol_suc not null);

alter table suc
add constraint fk_suc_produs foreign key(id_produs) references produs(id_produs) on delete cascade;

--inserari
insert into suc(id_produs, volum)
values(509, 500);
insert into suc(id_produs, volum)
values(510, 600);
insert into suc(id_produs, volum)
values(511, 500);
insert into suc(id_produs, volum)
values(512, 500);
insert into suc(id_produs, volum)
values(513, 500);
insert into suc(id_produs, volum)
values(514, 500);



create table PRODUS_INGREDIENT(
id_produs number(5),
id_ingredient number(5),
constraint pk_produs_ingredient primary key(id_produs, id_ingredient));

alter table produs_ingredient
add constraint fk_pi_produs foreign key(id_produs) references produs(id_produs) on delete cascade;
alter table produs_ingredient
add constraint fk_pi_ingredient foreign key(id_ingredient) references ingredient(id_ingredient) on delete cascade;

--inserari
insert into produs_ingredient(id_produs, id_ingredient)
values(500, 1001);
insert into produs_ingredient(id_produs, id_ingredient)
values(500, 1000);
insert into produs_ingredient(id_produs, id_ingredient)
values(500, 1003);
insert into produs_ingredient(id_produs, id_ingredient)
values(502, 1002);
insert into produs_ingredient(id_produs, id_ingredient)
values(502, 1004);
insert into produs_ingredient(id_produs, id_ingredient)
values(502, 1005);
insert into produs_ingredient(id_produs, id_ingredient)
values(505, 1002);
insert into produs_ingredient(id_produs, id_ingredient)
values(505, 1005);
insert into produs_ingredient(id_produs, id_ingredient)
values(506, 1001);
insert into produs_ingredient(id_produs, id_ingredient)
values(506, 1002);
insert into produs_ingredient(id_produs, id_ingredient)
values(506, 1003);
insert into produs_ingredient(id_produs, id_ingredient)
values(511, 1001);
insert into produs_ingredient(id_produs, id_ingredient)
values(509, 1005);
insert into produs_ingredient(id_produs, id_ingredient)
values(509, 1004);
insert into produs_ingredient(id_produs, id_ingredient)
values(509,1002);



-----INGREDIENT----
create table ingredient(
id_ingredient number(5) constraint pk_ingredient primary key,
nume varchar2(25),
stoc number(3),
stoc_lunar number(3) default 400,
id_furnizor number(5));

alter table ingredient
modify(nume constraint null_nume_ingred not null);

alter table ingredient
modify(id_furnizor constraint null_furnizor_ingred not null);

alter table ingredient
add constraint fk_ingredient_furnizor foreign key(id_furnizor) references furnizor(id_furnizor) on delete cascade;

--inserari

insert into ingredient(id_ingredient, nume, stoc, id_furnizor)
values(1001, 'lamaie', 200, 601);
insert into ingredient(id_ingredient, nume, stoc, id_furnizor)
values(1000, 'portocala', 300, 601);
insert into ingredient(id_ingredient, nume, stoc, id_furnizor)
values(1002, 'lapte', 150, 603);
insert into ingredient(id_ingredient, nume, stoc, id_furnizor)
values(1003, 'branza', 100, 603);
insert into ingredient(id_ingredient, nume, stoc, id_furnizor)
values(1004, 'capsuna', 200, 601);
insert into ingredient(id_ingredient, nume, stoc, id_furnizor)
values(1005, 'cacao', 160, 600);



create table furnizor(
id_furnizor number(5) constraint pk_furnizor primary key,
nume varchar2(25) constraint null_nume_furnizor not null,
rep varchar2(25));


--inserari
insert into furnizor(id_furnizor, nume, rep)
values(600, 'Delma', 'Antoniu');
insert into furnizor(id_furnizor, nume, rep)
values(601, 'FreshFruits', 'Felicia');
insert into furnizor(id_furnizor, nume, rep)
values(602, 'Moara Domneasca', 'Sonia');
insert into furnizor(id_furnizor, nume, rep)
values(603, 'Torockoi', 'Sorin');
insert into furnizor(id_furnizor, nume, rep)
values(604, 'Ciocotech', 'Corneliu');



create table contract(
id_contract number(5) constraint pk_contract primary key,
data_incheiere date default sysdate,
cost number(7,2) constraint null_cost_contract not null,
zi_onorare number(2) constraint ck_zi_contract check(zi_onorare >= 1 and zi_onorare <= 30),
id_furnizor number(5));
alter table contract
modify(id_furnizor constraint null_furnizor_contract not null);
alter table contract
add constraint fk_contract_furnizor foreign key(id_furnizor) references furnizor(id_furnizor) on delete cascade;

--inserare

insert into contract(id_contract, data_incheiere, cost, zi_onorare, id_furnizor)
values(700, to_date('29.11.2023','dd.mm.yyyy'),6000, 15, 600);
insert into contract(id_contract, data_incheiere, cost, zi_onorare, id_furnizor)
values(701, to_date('06.06.2024','dd.mm.yyyy'), 7190.99, 6, 601);
insert into contract(id_contract, data_incheiere, cost, zi_onorare, id_furnizor)
values(702, to_date('23.03.2024','dd.mm.yyyy'), 9500, 10, 602);
insert into contract(id_contract, data_incheiere, cost, zi_onorare, id_furnizor)
values(703, to_date('18.02.2025','dd.mm.yyyy'), 9000, 7, 603);
insert into contract(id_contract, data_incheiere, cost, zi_onorare, id_furnizor)
values(704, to_date('18.02.2025','dd.mm.yyyy'), 5960, 28, 604);


create or replace procedure ex6 is
    type t_info is record(
                    nume angajat.nume%type,
                    prenume angajat.prenume%type,
                    id_angajat angajat.id_angajat%type,
                    salariu angajat.salariu%type,
                    specializare cofetar.specializare%type);
                    
    type t_cofet is table of t_info index by pls_integer;    --tablou indexat
    type t_angajat is table of angajat%rowtype;      --tablou imbricat
    
    v_sal_max number;
    v_cofetari t_cofet;
    v_angajati t_angajat;
    v_exista_sal_mai_mare boolean := false;
    index_ang number := 1;
begin
    select max(salariu) into v_sal_max
    from angajat join cofetar using(id_angajat);
    
    select nume, prenume, id_angajat, salariu, specializare
            bulk collect into v_cofetari
    from angajat join cofetar using(id_angajat);
    
    dbms_output.put_line('Cofetarii sunt:');
    
    for i in v_cofetari.first..v_cofetari.last loop
        if v_cofetari(i).salariu >= 2400 and v_cofetari(i).salariu < v_sal_max then
            update angajat set salariu = salariu + 5/100*v_sal_max where id_angajat = v_cofetari(i).id_angajat;
            dbms_output.put_line(i || '. '||'Nume = ' || v_cofetari(i).nume || ' ' || v_cofetari(i).prenume || ';      Salariu initial = ' || to_char(v_cofetari(i).salariu,'9999.99') || ' -> Salariu final = ' || to_char(v_cofetari(i).salariu + 5/100*v_sal_max,'9999.99'));
        else
            dbms_output.put_line(i || '. '||'Nume = ' || v_cofetari(i).nume || ' ' || v_cofetari(i).prenume || ';      Salariu initial = ' || to_char(v_cofetari(i).salariu,'9999.99') || ' -> Salariu final = ' || to_char(v_cofetari(i).salariu,'9999.99'));
        end if;
    end loop;
    
    dbms_output.new_line;
    
    select * bulk collect into v_angajati
    from angajat
    where id_angajat not in (select id_angajat from cofetar)
    order by salariu desc;
    
    for i in v_angajati.first..v_angajati.last loop
        if v_angajati(i).salariu > v_sal_max then
            if v_exista_sal_mai_mare = false then
                dbms_output.put_line('Angajatii care castiga mai bine decat orice cofetar:');
                v_exista_sal_mai_mare := true;
            end if;
            update angajat set salariu = 9/10*salariu where id_angajat = v_angajati(i).id_angajat;
            dbms_output.put_line(index_ang || '. ' || v_angajati(i).nume);
            index_ang := index_ang + 1;
        end if;
    end loop;
    dbms_output.new_line;
    
    if v_exista_sal_mai_mare = false then
        dbms_output.put_line('Nu exista angajati care nu sunt cofetari si castiga mai mult decat cel mai bine platit cofetar.');
    end if;
end ex6;
/

begin
    ex6;    
end;
/



create or replace procedure ex7 is
    type refcursor is ref cursor;
    cursor furn is select f.id_furnizor, f.nume, cursor (select i.nume nume, nvl(100*i.stoc/i.stoc_lunar,0) procent
                                                    from ingredient i
                                                    where i.id_furnizor = f.id_furnizor)
                    from furnizor f join contract c on (f.id_furnizor=c.id_furnizor)
                    order by c.cost desc;
    v_ingred refcursor;
    v_id furnizor.id_furnizor%type;
    v_nume furnizor.nume%type;
    v_prelungire boolean;
    v_are_ing boolean;
    v_nume_ing ingredient.nume%type;
    v_procent number;
    v_idx_furn number := 1;
    v_idx_ing number;
begin
    open furn;
    loop
        fetch furn into v_id, v_nume, v_ingred;
        exit when furn%notfound or v_idx_furn = 4;
        
        v_prelungire := false;
        v_are_ing := false;
        dbms_output.put(v_idx_furn || '. ' || v_nume);
        
        v_idx_ing := 1;
        loop
            fetch v_ingred into v_nume_ing, v_procent;
            exit when v_ingred%notfound;
            v_are_ing := true;
            dbms_output.new_line;
            dbms_output.put('  ' || v_idx_ing || '. ' || v_nume_ing || ' '|| v_procent || '%');
            if v_procent < 50 and v_prelungire = false then
                update contract set data_incheiere = add_months(data_incheiere,12) where id_furnizor = v_id;
                v_prelungire := true;
            end if;
            v_idx_ing := v_idx_ing + 1;
        end loop;
        if v_are_ing = false then
            dbms_output.put(' inca nu furnizeaza ingrediente lantului');
        end if;
        dbms_output.new_line;
        v_idx_furn := v_idx_furn + 1;
    end loop;
    
    close furn;
end ex7;
/

begin
    ex7;
end;
/



create or replace function ex8(v_nume_ang angajat.nume%type) return varchar2 is
    v_rez varchar2(300);
    v_id_ang angajat.id_angajat%type;
    v_nr_cofet number;
    v_bonus number;
    v_exp number;
    v_oras locatie.oras%type;
    v_exp_ajut number;
    v_id_cofet_crt angajat.id_cofetarie%type;
    cursor c(c_id_ang angajat.id_angajat%type) is
        select distinct oras
        from istoric join cofetarie using (id_cofetarie) join locatie using(id_locatie)
        where id_angajat = c_id_ang;
begin
    select id_angajat into v_id_ang
    from angajat
    where lower(nume) = lower(v_nume_ang);
    
    select count(*) into v_nr_cofet
    from istoric
    where id_angajat = v_id_ang;
    
    if v_nr_cofet = 0 then
        return 'Nu exista informatii.';
    elsif v_nr_cofet = 1 then
        select id_cofetarie,round(months_between(sysdate,data_angajare)) into v_id_cofet_crt, v_exp
        from istoric
        where id_angajat = v_id_ang;
        
        return 'Angajatul lucreaza la cofetaria cu id-ul ' || v_id_cofet_crt || ' de ' || v_exp || ' luni.';
    else
        select sum(experienta) into v_exp from istoric where id_angajat = v_id_ang;
        select round(months_between(sysdate,data_angajare)) into v_exp_ajut
        from istoric
        where id_angajat = v_id_ang and experienta is null;
        
        v_exp := v_exp + v_exp_ajut;
        v_rez := 'Angajatul a lucrat la ' || v_nr_cofet || ' cofetarii in ';
        
        open c(v_id_ang);
        loop
            fetch c into v_oras;
            exit when c%notfound;
            v_rez := v_rez || v_oras || ', ';
        end loop;
        close c;
        v_rez := v_rez || ' iar bonusul castigat este de ' || round(v_exp/6*0.1,2) || '%.';
        
        update angajat set salariu = salariu + (v_exp/6*0.1/100)*salariu where id_angajat = v_id_ang;
        return v_rez;
    end if;
exception
    when no_data_found then
        return 'Angajatul cu numele ' || v_nume_ang || ' nu exista!';
    when too_many_rows then
        return 'Exista mai multi angajati cu numele ' || v_nume_ang || '!';
    when others then
        return 'Eroare!';
end ex8;
/

begin
    dbms_output.put_line(ex8('Florina'));
end;
/
begin
    dbms_output.put_line(ex8('Catrinel'));
end;
/
begin
    dbms_output.put_line(ex8('Maria'));
end;
/
begin
    dbms_output.put_line(ex8('Gherasim'));
end;
/
begin
    dbms_output.put_line(ex8('Marin'));
end;
/

create or replace procedure ex9(v_cod number, v_prenume_client client.prenume%type) is
    cod_gresit exception;
    client_nu_are_comenzi exception;
    v_id_client client.id_client%type;
    v_idx_produs number := 1;
    v_pret_total number := 0;
    v_pret_inter number;
    v_nr_produse number := 0;
begin
    if v_cod not in (1,2) then
        raise cod_gresit;
    elsif v_cod = 1 then
        select id_client into v_id_client
        from client
        where lower(prenume) = lower(v_prenume_client);
         
        select count(*) into v_nr_produse from client cl join comanda cd on (cl.id_client=cd.id_client)
                        join comanda_produs cp on (cp.id_comanda=cd.id_comanda and cp.id_client=cd.id_client)
                        join produs ps on (cp.id_produs=ps.id_produs)
                        join prajitura pj on (ps.id_produs=pj.id_produs)
                    where cl.id_client=v_id_client;
        if v_nr_produse = 0 then
            raise client_nu_are_comenzi;
        end if;
        dbms_output.put_line('Clientul ' || v_prenume_client || ' a comandat urmatoarele prajituri:');
        for i in (select ps.nume nume, ps.pret pret, pj.nr_praj_disc nr_disc, pj.discount discount, cp.cantitate cantitate
                    from client cl join comanda cd on (cl.id_client=cd.id_client)
                        join comanda_produs cp on (cp.id_comanda=cd.id_comanda and cp.id_client=cd.id_client)
                        join produs ps on (cp.id_produs=ps.id_produs)
                        join prajitura pj on (ps.id_produs=pj.id_produs)
                    where cl.id_client=v_id_client) loop
            if i.cantitate >= i.nr_disc then
                v_pret_inter := i.pret * i.cantitate * (1 - i.discount);
                dbms_output.put_line('  '||v_idx_produs || '. ' || i.nume || ' cu pretul ' || round(v_pret_inter ,2) || 
                    (case when i.cantitate=1 then '(o portie)' else '('||i.cantitate|| ' portii)' end) || ' si discount-ul in valoare de ' || 
                    round(i.pret * i.cantitate * i.discount,2) || ';');
                v_pret_total := v_pret_total + v_pret_inter;
            else
                dbms_output.put_line('  '||v_idx_produs || '. ' || i.nume || ' cu pretul ' || round(i.pret*i.cantitate ,2) || 
                (case when i.cantitate=1 then '(o portie)' else '('||i.cantitate|| ' portii)' end) ||  ';');
                v_pret_total := v_pret_total + i.pret*i.cantitate;
            end if;
            v_idx_produs := v_idx_produs + 1;
        end loop;
        dbms_output.put_line('Clientul a platit ' || round(v_pret_total,2) || ' in total.');
    else
        select id_client into v_id_client
        from client
        where lower(prenume) = lower(v_prenume_client);
        
        select count(*) into v_nr_produse 
        from client cl join comanda cd on (cl.id_client=cd.id_client)
            join comanda_produs cp on (cp.id_comanda=cd.id_comanda and cp.id_client=cd.id_client)
            join produs ps on (cp.id_produs=ps.id_produs)
            join suc s on (ps.id_produs=s.id_produs)
        where cl.id_client=v_id_client;
        if v_nr_produse = 0 then
            raise client_nu_are_comenzi;
        end if;
        dbms_output.put_line('Clientul ' || v_prenume_client || ' a comandat urmatoarele sucuri:');
        
        for i in (select ps.nume nume, ps.pret pret, s.volum volum, cp.cantitate cantitate
                    from client cl join comanda cd on (cl.id_client=cd.id_client)
                        join comanda_produs cp on (cp.id_comanda=cd.id_comanda and cp.id_client=cd.id_client)
                        join produs ps on (cp.id_produs=ps.id_produs)
                        join suc s on (ps.id_produs=s.id_produs)
                    where cl.id_client=v_id_client) loop
        
            dbms_output.put_line('  '||v_idx_produs || '. ' || i.nume || ' cu pretul ' || 
                round(i.pret*i.cantitate ,2) ||(case when i.cantitate=1 then '(o portie)' else 
                '('||i.cantitate|| ' portii)' end) || 'cu o portie de '||i.volum||';');
            v_pret_total := v_pret_total + i.pret*i.cantitate;
            v_idx_produs := v_idx_produs + 1;
        end loop;
        dbms_output.put_line('Clientul a platit ' || round(v_pret_total,2) || ' in total.');
    end if;
exception
    when cod_gresit then
        dbms_output.put_line('Codul trimis ca parametru e invalid!');
    when client_nu_are_comenzi then
        if v_cod = 1 then
            dbms_output.put_line('Clientul ' || v_prenume_client || ' nu are comenzi cu prajituri!');
        else
            dbms_output.put_line('Clientul ' || v_prenume_client || ' nu are comenzi cu sucuri!');
        end if;
    when NO_DATA_FOUND then
        dbms_output.put_line('Clientul ' || v_prenume_client || ' nu exista!');
    when TOO_MANY_ROWS then
        dbms_output.put_line('Exista mai multi clienti cu prenumele ' || v_prenume_client || '!');
    when others then
        dbms_output.put_line('Eroare!');
end ex9;
/

begin
    ex9(1,'Dinu');
end;
/

begin
    ex9(2,'Ecaterina');
end;
/

begin
    ex9(3,'ceva');
end;
/

begin
    ex9(2,'Dinu');
end;
/

begin
    ex9(1,'Petru');
end;
/

begin
    ex9(2,'Mihai');
end;
/



create or replace trigger trig_ex10
    before insert or update or delete on ingredient
begin
    if to_char(sysdate,'D') not in (1,3,5) or to_char(sysdate,'HH24') not between 8 and 12 then
        raise_application_error(-20000,'Operatiile asupra tabelului INGREDIENT sunt permise doar'|| 
            ' în zilele in care se face inventarul, între orele 8 si 12!');
    end if;
end;
/

insert into ingredient values(1006,'vanilie',300,300,602);
rollback;

update ingredient set stoc = stoc+100 where id_ingredient=1002;
rollback;

delete from ingredient where id_ingredient=1006;

update ingredient set stoc = stoc+100 where id_ingredient=1002;



create or replace trigger trig_ex11
    before insert or update on comanda_produs
    for each row
declare
    v_pret produs.pret%type;
    v_nr_praj prajitura.nr_praj_disc%type;
    v_discount prajitura.discount%type;
    cursor c1(v_id prajitura.id_produs%type) is
        select count(*) from prajitura where id_produs=v_id and discount is not null;
    cursor c2(v_id prajitura.id_produs%type) is
        select pret, nr_praj_disc, discount
        from produs join prajitura using(id_produs)
        where id_produs=v_id;
    
    v_este_praj number;
begin
    if inserting then
        if :new.cantitate not between 1 and 5 then
            raise_application_error(-20000,'Cantitatea noului produs nu este între 1 si 5!');
        else
            open c1(:new.id_produs);
            fetch c1 into v_este_praj;
            close c1;
            if v_este_praj = 1 then
                open c2(:new.id_produs);
                fetch c2 into v_pret,v_nr_praj,v_discount;
                close c2;
                if :new.cantitate >= v_nr_praj then
                    update comanda set suma = suma + (:new.cantitate*v_pret*(1-v_discount)) where id_comanda=:new.id_comanda and
                                                                                                  id_client=:new.id_client;
                else
                    update comanda set suma = suma + (:new.cantitate*v_pret) where id_comanda=:new.id_comanda and
                                                                                   id_client=:new.id_client;
                end if;
            else
                select pret into v_pret from produs where id_produs=:new.id_produs;
                update comanda set suma = suma + :new.cantitate*v_pret where id_comanda=:new.id_comanda and
                                                                             id_client=:new.id_client;
            end if;
        end if;
    elsif updating('cantitate') then
        open c1(:new.id_produs);
        fetch c1 into v_este_praj;
        if v_este_praj = 1 then
            open c2(:new.id_produs);
            fetch c2 into v_pret,v_nr_praj,v_discount;
            close c2;
            if :old.cantitate >= v_nr_praj then
                update comanda set suma = suma - (:old.cantitate*v_pret*(1-v_discount)) where id_comanda=:old.id_comanda and
                                                                                              id_client=:old.id_client;
            else
                update comanda set suma = suma - (:old.cantitate*v_pret) where id_comanda=:old.id_comanda and
                                                                               id_client=:old.id_client;
            end if;
            if :new.cantitate >= v_nr_praj then 
                update comanda set suma = suma + (:new.cantitate*v_pret*(1-v_discount)) where id_comanda=:old.id_comanda and
                                                                                        id_client=:old.id_client;
            else
                update comanda set suma = suma + (:new.cantitate*v_pret) where id_comanda=:old.id_comanda and
                                                                               id_client=:old.id_client;
            end if;
        else
            select pret into v_pret from produs where id_produs=:new.id_produs;
            update comanda set suma = suma + (:new.cantitate-:old.cantitate)*v_pret where id_comanda=:old.id_comanda and
                                                                                          id_client=:old.id_client;
        end if;
    end if;
end;
/

insert into comanda_produs values(1,400,506,4);

update comanda_produs set cantitate=cantitate+4 where id_client=400 and id_comanda=1 and id_produs=508;

insert into comanda_produs values(1,400,506,0);



create table comenzi_vlad(
    comanda varchar(20),
    nume_ob varchar(30),
    data date);
    
create or replace procedure inserare_trig_ex12(v_comanda varchar2, v_nume_ob varchar2, v_data date) is
begin
    insert into comenzi_anulate values(v_comanda,v_nume_ob,v_data);
end inserare_trig_ex12;
/

create or replace trigger trig_ex12
    before create or alter or drop on database
    when (lower(user)='vlad')
begin
    if to_char(sysdate,'D') in (6,7) then
        raise_application_error(-20000,'Userul vlad nu are voie sa ruleze comenzi LDD in weekend!');
    else
        insert into comenzi_vlad values(sys.SYSEVENT,sys.DICTIONARY_OBJ_NAME,sysdate);
    end if;
end;
/

create table info (ceva varchar2(10));
alter table info rename to de_sters;
drop table de_sters;



create or replace package ex13 is
    procedure ex6;
    procedure ex7;
    function ex8(v_nume_ang angajat.nume%type) return varchar2;
    procedure ex9(v_cod number, v_prenume_client client.prenume%type);
end ex13;
/

create or replace package body ex13 is
    procedure ex6 is
        type t_info is record(
                        nume angajat.nume%type,
                        prenume angajat.prenume%type,
                        id_angajat angajat.id_angajat%type,
                        salariu angajat.salariu%type,
                        specializare cofetar.specializare%type);
                        
        type t_cofet is table of t_info index by pls_integer;    --tablou indexat
        type t_angajat is table of angajat%rowtype;      --tablou imbricat
        
        v_sal_max number;
        v_cofetari t_cofet;
        v_angajati t_angajat;
        v_exista_sal_mai_mare boolean := false;
        index_ang number := 1;
    begin
        select max(salariu) into v_sal_max
        from angajat join cofetar using(id_angajat);
        
        select nume, prenume, id_angajat, salariu, specializare
                bulk collect into v_cofetari
        from angajat join cofetar using(id_angajat);
        
        dbms_output.put_line('Cofetarii sunt:');
        
        for i in v_cofetari.first..v_cofetari.last loop
            if v_cofetari(i).salariu >= 2400 and v_cofetari(i).salariu < v_sal_max then
                update angajat set salariu = salariu + 5/100*v_sal_max where id_angajat = v_cofetari(i).id_angajat;
                dbms_output.put_line(i || '. '||'Nume = ' || v_cofetari(i).nume || ' ' || v_cofetari(i).prenume || ';      Salariu initial = ' || to_char(v_cofetari(i).salariu,'9999.99') || ' -> Salariu final = ' || to_char(v_cofetari(i).salariu + 5/100*v_sal_max,'9999.99'));
            else
                dbms_output.put_line(i || '. '||'Nume = ' || v_cofetari(i).nume || ' ' || v_cofetari(i).prenume || ';      Salariu initial = ' || to_char(v_cofetari(i).salariu,'9999.99') || ' -> Salariu final = ' || to_char(v_cofetari(i).salariu,'9999.99'));
            end if;
        end loop;
        
        dbms_output.new_line;
        
        select * bulk collect into v_angajati
        from angajat
        where id_angajat not in (select id_angajat from cofetar)
        order by salariu desc;
        
        for i in v_angajati.first..v_angajati.last loop
            if v_angajati(i).salariu > v_sal_max then
                if v_exista_sal_mai_mare = false then
                    dbms_output.put_line('Angajatii care castiga mai bine decat orice cofetar:');
                    v_exista_sal_mai_mare := true;
                end if;
                update angajat set salariu = 9/10*salariu where id_angajat = v_angajati(i).id_angajat;
                dbms_output.put_line(index_ang || '. ' || v_angajati(i).nume);
                index_ang := index_ang + 1;
            end if;
        end loop;
        dbms_output.new_line;
        
        if v_exista_sal_mai_mare = false then
            dbms_output.put_line('Nu exista angajati care nu sunt cofetari si castiga mai mult decat cel mai bine platit cofetar.');
        end if;
    end ex6;

    
    procedure ex7 is
        type refcursor is ref cursor;
        cursor furn is select f.id_furnizor, f.nume, cursor (select i.nume nume, nvl(100*i.stoc/i.stoc_lunar,0) procent
                                                        from ingredient i
                                                        where i.id_furnizor = f.id_furnizor)
                        from furnizor f join contract c on (f.id_furnizor=c.id_furnizor)
                        order by c.cost desc;
        v_ingred refcursor;
        v_id furnizor.id_furnizor%type;
        v_nume furnizor.nume%type;
        v_prelungire boolean;
        v_are_ing boolean;
        v_nume_ing ingredient.nume%type;
        v_procent number;
        v_idx_furn number := 1;
        v_idx_ing number;
    begin
        open furn;
        loop
            fetch furn into v_id, v_nume, v_ingred;
            exit when furn%notfound or v_idx_furn = 4;
            
            v_prelungire := false;
            v_are_ing := false;
            dbms_output.put(v_idx_furn || '. ' || v_nume);
            
            v_idx_ing := 1;
            loop
                fetch v_ingred into v_nume_ing, v_procent;
                exit when v_ingred%notfound;
                v_are_ing := true;
                dbms_output.new_line;
                dbms_output.put('  ' || v_idx_ing || '. ' || v_nume_ing || ' '|| v_procent || '%');
                if v_procent < 50 and v_prelungire = false then
                    update contract set data_incheiere = add_months(data_incheiere,12) where id_furnizor = v_id;
                    v_prelungire := true;
                end if;
                v_idx_ing := v_idx_ing + 1;
            end loop;
            if v_are_ing = false then
                dbms_output.put(' inca nu furnizeaza ingrediente lantului');
            end if;
            dbms_output.new_line;
            v_idx_furn := v_idx_furn + 1;
        end loop;
        
        close furn;
    end ex7;

    
    function ex8(v_nume_ang angajat.nume%type) return varchar2 is
        v_rez varchar2(300);
        v_id_ang angajat.id_angajat%type;
        v_nr_cofet number;
        v_bonus number;
        v_exp number;
        v_oras locatie.oras%type;
        v_exp_ajut number;
        v_id_cofet_crt angajat.id_cofetarie%type;
        cursor c(c_id_ang angajat.id_angajat%type) is
            select distinct oras
            from istoric join cofetarie using (id_cofetarie) join locatie using(id_locatie)
            where id_angajat = c_id_ang;
    begin
        select id_angajat into v_id_ang
        from angajat
        where lower(nume) = lower(v_nume_ang);
        
        select count(*) into v_nr_cofet
        from istoric
        where id_angajat = v_id_ang;
        
        if v_nr_cofet = 0 then
            return 'Nu exista informatii.';
        elsif v_nr_cofet = 1 then
            select id_cofetarie,round(months_between(sysdate,data_angajare)) into v_id_cofet_crt, v_exp
            from istoric
            where id_angajat = v_id_ang;
            
            return 'Angajatul lucreaza la cofetaria cu id-ul ' || v_id_cofet_crt || ' de ' || v_exp || ' luni.';
        else
            select sum(experienta) into v_exp from istoric where id_angajat = v_id_ang;
            select round(months_between(sysdate,data_angajare)) into v_exp_ajut
            from istoric
            where id_angajat = v_id_ang and experienta is null;
            
            v_exp := v_exp + v_exp_ajut;
            v_rez := 'Angajatul a lucrat la ' || v_nr_cofet || ' cofetarii in ';
            
            open c(v_id_ang);
            loop
                fetch c into v_oras;
                exit when c%notfound;
                v_rez := v_rez || v_oras || ', ';
            end loop;
            close c;
            v_rez := v_rez || ' iar bonusul castigat este de ' || round(v_exp/6*0.1,2) || '%.';
            
            update angajat set salariu = salariu + (v_exp/6*0.1/100)*salariu where id_angajat = v_id_ang;
            return v_rez;
        end if;
    exception
        when no_data_found then
            return 'Angajatul cu numele ' || v_nume_ang || ' nu exista!';
        when too_many_rows then
            return 'Exista mai multi angajati cu numele ' || v_nume_ang || '!';
        when others then
            return 'Eroare!';
    end ex8;

    
    procedure ex9(v_cod number, v_prenume_client client.prenume%type) is
        cod_gresit exception;
        client_nu_are_comenzi exception;
        v_id_client client.id_client%type;
        v_idx_produs number := 1;
        v_pret_total number := 0;
        v_pret_inter number;
        v_nr_produse number := 0;
    begin
        if v_cod not in (1,2) then
            raise cod_gresit;
        elsif v_cod = 1 then
            select id_client into v_id_client
            from client
            where lower(prenume) = lower(v_prenume_client);
             
            select count(*) into v_nr_produse from client cl join comanda cd on (cl.id_client=cd.id_client)
                            join comanda_produs cp on (cp.id_comanda=cd.id_comanda and cp.id_client=cd.id_client)
                            join produs ps on (cp.id_produs=ps.id_produs)
                            join prajitura pj on (ps.id_produs=pj.id_produs)
                        where cl.id_client=v_id_client;
            if v_nr_produse = 0 then
                raise client_nu_are_comenzi;
            end if;
            dbms_output.put_line('Clientul ' || v_prenume_client || ' a comandat urmatoarele prajituri:');
            for i in (select ps.nume nume, ps.pret pret, pj.nr_praj_disc nr_disc, pj.discount discount, cp.cantitate cantitate
                        from client cl join comanda cd on (cl.id_client=cd.id_client)
                            join comanda_produs cp on (cp.id_comanda=cd.id_comanda and cp.id_client=cd.id_client)
                            join produs ps on (cp.id_produs=ps.id_produs)
                            join prajitura pj on (ps.id_produs=pj.id_produs)
                        where cl.id_client=v_id_client) loop
                if i.cantitate >= i.nr_disc then
                    v_pret_inter := i.pret * i.cantitate * (1 - i.discount);
                    dbms_output.put_line('  '||v_idx_produs || '. ' || i.nume || ' cu pretul ' || round(v_pret_inter ,2) || 
                        (case when i.cantitate=1 then '(o portie)' else '('||i.cantitate|| ' portii)' end) || ' si discount-ul in valoare de ' || 
                        round(i.pret * i.cantitate * i.discount,2) || ';');
                    v_pret_total := v_pret_total + v_pret_inter;
                else
                    dbms_output.put_line('  '||v_idx_produs || '. ' || i.nume || ' cu pretul ' || round(i.pret*i.cantitate ,2) || 
                    (case when i.cantitate=1 then '(o portie)' else '('||i.cantitate|| ' portii)' end) ||  ';');
                    v_pret_total := v_pret_total + i.pret*i.cantitate;
                end if;
                v_idx_produs := v_idx_produs + 1;
            end loop;
            dbms_output.put_line('Clientul a platit ' || round(v_pret_total,2) || ' in total.');
        else
            select id_client into v_id_client
            from client
            where lower(prenume) = lower(v_prenume_client);
            
            select count(*) into v_nr_produse 
            from client cl join comanda cd on (cl.id_client=cd.id_client)
                join comanda_produs cp on (cp.id_comanda=cd.id_comanda and cp.id_client=cd.id_client)
                join produs ps on (cp.id_produs=ps.id_produs)
                join suc s on (ps.id_produs=s.id_produs)
            where cl.id_client=v_id_client;
            if v_nr_produse = 0 then
                raise client_nu_are_comenzi;
            end if;
            dbms_output.put_line('Clientul ' || v_prenume_client || ' a comandat urmatoarele sucuri:');
            
            for i in (select ps.nume nume, ps.pret pret, s.volum volum, cp.cantitate cantitate
                        from client cl join comanda cd on (cl.id_client=cd.id_client)
                            join comanda_produs cp on (cp.id_comanda=cd.id_comanda and cp.id_client=cd.id_client)
                            join produs ps on (cp.id_produs=ps.id_produs)
                            join suc s on (ps.id_produs=s.id_produs)
                        where cl.id_client=v_id_client) loop
            
                dbms_output.put_line('  '||v_idx_produs || '. ' || i.nume || ' cu pretul ' || 
                    round(i.pret*i.cantitate ,2) ||(case when i.cantitate=1 then '(o portie)' else 
                    '('||i.cantitate|| ' portii)' end) || 'cu o portie de '||i.volum||';');
                v_pret_total := v_pret_total + i.pret*i.cantitate;
                v_idx_produs := v_idx_produs + 1;
            end loop;
            dbms_output.put_line('Clientul a platit ' || round(v_pret_total,2) || ' in total.');
        end if;
    exception
        when cod_gresit then
            dbms_output.put_line('Codul trimis ca parametru e invalid!');
        when client_nu_are_comenzi then
            if v_cod = 1 then
                dbms_output.put_line('Clientul ' || v_prenume_client || ' nu are comenzi cu prajituri!');
            else
                dbms_output.put_line('Clientul ' || v_prenume_client || ' nu are comenzi cu sucuri!');
            end if;
        when NO_DATA_FOUND then
            dbms_output.put_line('Clientul ' || v_prenume_client || ' nu exista!');
        when TOO_MANY_ROWS then
            dbms_output.put_line('Exista mai multi clienti cu prenumele ' || v_prenume_client || '!');
        when others then
            dbms_output.put_line('Eroare!');
    end ex9;
end ex13;
/

begin
    ex13.ex7;
end;
/



create or replace package ex14 is
    procedure adauga_info(nume_c client.nume%type, prenume_c client.prenume%type, telefon_c client.telefon%type,
                            nume_p produs.nume%type, cantitate_p comanda_produs.cantitate%type, locatie_co comanda.id_locatie%type);
    cursor clienti_data(v_data date) is
        select nume, telefon 
        from client join comanda using(id_client)
        where to_char(data_onorare,'ddmmyyyy')=to_char(v_data,'ddmmyyyy');
    procedure sterge_comenzi(v_data date);
    type t_elem_sir is record(v_furnizor furnizor.nume%type, v_rep furnizor.rep%type);
    type t_siruri is table of t_elem_sir;
    cursor furnizori(v_id_cl comanda.id_client%type,v_data date) is
        select distinct f.nume nume, f.rep rep
        from comanda c join comanda_produs cp on(c.id_client=cp.id_client)
            join produs p on (cp.id_produs=p.id_produs)
            join produs_ingredient pi on(p.id_produs=pi.id_produs)
            join ingredient i on (i.id_ingredient=pi.id_ingredient)
            join furnizor f on (i.id_furnizor=f.id_furnizor)
            where c.id_client=v_id_cl and c.data_onorare=v_data;
    function firme_ingr(v_nume_cl client.nume%type, v_data date) return t_siruri;
    function nr_clienti(v_nume_p produs.nume%type) return number;
end ex14;
/

create or replace package body ex14 is
    procedure adauga_info(nume_c client.nume%type, prenume_c client.prenume%type, telefon_c client.telefon%type,
                            nume_p produs.nume%type, cantitate_p comanda_produs.cantitate%type, locatie_co comanda.id_locatie%type) is
        v_suma comanda.suma%type := 0;
        v_id_cl client.id_client%type;
        v_id_p produs.id_produs%type;
        v_id_co comanda.id_comanda%type;
        v_exista_produs number;
        v_exista_client number;
        v_exista_locatie number;
        produs_inexistent exception;
        client_exista exception;
        locatie_gresita exception;
    begin
        select count(*) into v_exista_produs from produs where lower(nume)=lower(nume_p);
        select count(*) into v_exista_client from client where lower(nume)=lower(nume_c) and lower(prenume)=lower(prenume_c);
        select count(*) into v_exista_locatie from locatie where id_locatie=locatie_co;
        if v_exista_produs = 0 then
            raise produs_inexistent;
        elsif v_exista_client = 1 then
            raise client_exista;
        elsif v_exista_locatie = 0 then
            raise locatie_gresita;
        else
            select id_produs,pret*cantitate_p into v_id_p,v_suma from produs where lower(nume)=lower(nume_p);
            select max(id_client)+1 into v_id_cl from client;
            insert into client values(v_id_cl,nume_c,prenume_c,telefon_c);
            insert into comanda values(1,v_id_cl,v_suma,null,locatie_co,null,null);
            insert into comanda_produs values(1,v_id_cl,v_id_p,cantitate_p);
        end if;
    exception
        when produs_inexistent then
            dbms_output.put_line('Produsul ' || nume_p || ' nu exista!');
        when client_exista then
            dbms_output.put_line('Clientul ' || nume_c || ' '|| prenume_c||' exista deja!');
        when locatie_gresita then
            dbms_output.put_line('Locatia este invalida!');
        when others then
            dbms_output.put_line('Eroare!');
    end adauga_info;
    
    
    procedure sterge_comenzi(v_data date) is
        v_exista_comenzi number;
        nu_exista_comenzi exception;
    begin
        select count(*) into v_exista_comenzi from comanda where to_char(data_onorare,'ddmmyyyy')=to_char(v_data,'ddmmyyyy');
        if v_exista_comenzi = 0 then
            raise nu_exista_comenzi;
        else
            dbms_output.put_line('Clientii ai caror comenzi au fost sterse sunt:');
            for i in clienti_data(v_data) loop
                dbms_output.put_line(i.nume || ' '|| i.telefon);
            end loop;
            delete from comanda where to_char(data_onorare,'ddmmyyyy')=to_char(v_data,'ddmmyyyy');
        end if;
    exception
        when nu_exista_comenzi then
            dbms_output.put_line('Nu exista comenzi cu data de onorare pe '|| to_char(v_data,'dd.mm.yyyy'));
        when others then
            dbms_output.put_line('Eroare!');
    end sterge_comenzi;
    
    
    function firme_ingr(v_nume_cl client.nume%type, v_data date) return t_siruri is
        v_id_cl client.id_client%type;
        v_nr_furn number;
        v_rez t_siruri := t_siruri();
        v_idx number := 1;
    begin
        select id_client into v_id_cl from client where lower(nume)=lower(v_nume_cl);
        for i in furnizori(v_id_cl,v_data) loop
            v_rez.extend;
            v_rez(v_idx).v_furnizor:=i.nume;
            v_rez(v_idx).v_rep:=i.rep;
            v_idx := v_idx+1;
        end loop;
        return v_rez;
    exception
        when no_data_found then
            raise_application_error(-20000,'Nu exista clientul ' || v_nume_cl||'!');
        when too_many_rows then
            raise_application_error(-20001,'Exista mai multi clienti cu numele ' || v_nume_cl||'!');
        when others then
            raise_application_error(-20002,'Eroare!');
    end firme_ingr;
    
    
    function nr_clienti(v_nume_p produs.nume%type) return number is
        v_id_p produs.id_produs%type;
        v_rez1 number;
        v_rez2 number;
    begin
        select count(*) into v_rez1
        from(select distinct id_client
            from produs join comanda_produs using(id_produs)
            where lower(nume)=lower(v_nume_p));
        select count(*) into v_rez2
        from(select distinct id_client
            from produs join client_chelner_produs using(id_produs)
            where lower(nume)=lower(v_nume_p));
        v_rez1:=v_rez1+v_rez2;
        if v_rez1 <> 0 then
            update produs set pret=pret+(v_rez1*0.1/100)*pret where lower(nume)=lower(v_nume_p);
        end if;
        return v_rez1;
    end nr_clienti;
end ex14;
/


begin
    ex14.adauga_info('Dima','Vlad','0722222222','Limonada',2,100);
end;
/

begin
    ex14.adauga_info('Dima','Vlad','0722222222','mancare',2,100);
end;
/

begin
    ex14.adauga_info('Nicu','Liliana','0722222222','Limonada',2,100);
end;
/

begin
    ex14.adauga_info('Dima','Vlad','0722222222','Limonada',2,1);
end;
/

begin
    ex14.sterge_comenzi(to_date('18.06.2021','dd.mm.yyyy'));
end;
/

begin
    ex14.sterge_comenzi(sysdate);
end;
/

declare
    sir ex14.t_siruri := ex14.t_siruri();
    v_index number;
begin
    sir := ex14.firme_ingr('Sara',to_date('18.06.2021','dd.mm.yyyy'));
    v_index := sir.first;
    while v_index <= sir.last loop
        dbms_output.put_line('Nume: '||sir(v_index).v_furnizor||'     Rep: '||sir(v_index).v_rep);
        v_index := sir.next(v_index);
    end loop;
end;
/

declare
    sir ex14.t_siruri := ex14.t_siruri();
    v_index number;
begin
    sir := ex14.firme_ingr('Dima',to_date('18.06.2021','dd.mm.yyyy'));
    v_index := sir.first;
    while v_index <= sir.last loop
        dbms_output.put_line('Nume: '||sir(v_index).v_furnizor||'     Rep: '||sir(v_index).v_rep);
        v_index := sir.next(v_index);
    end loop;
end;
/

declare
    sir ex14.t_siruri := ex14.t_siruri();
    v_index number;
begin
    insert into client values(405,'Nicu',null,'0722222222');
    sir := ex14.firme_ingr('Nicu',to_date('18.06.2021','dd.mm.yyyy'));
    v_index := sir.first;
    while v_index <= sir.last loop
        dbms_output.put_line('Nume: '||sir(v_index).v_furnizor||'     Rep: '||sir(v_index).v_rep);
        v_index := sir.next(v_index);
    end loop;
end;
/

begin
    dbms_output.put_line(ex14.nr_clienti('Budinca cu ciocolata'));
end;
/
