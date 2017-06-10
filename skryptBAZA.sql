CREATE TABLE kontynenty(
id numeric(8) NOT NULL
,powierzchnia numeric(12,2) NOT NULL
,linia_brzegowa numeric(12,2) NOT NULL
,nazwa varchar(18) NOT NULL
);
ALTER TABLE kontynenty ADD PRIMARY KEY(id);
CREATE TABLE panstwa(
id numeric(8) NOT NULL
,powierzchnia numeric(12,2) NOT NULL
,dlugosc_granica numeric(12,2) NOT NULL
,nazwa varchar(60) NOT NULL
);
ALTER TABLE panstwa ADD PRIMARY KEY(id);
CREATE TABLE zbiornik_typ(
id numeric(8) NOT NULL
,nazwa varchar(20) NOT NULL
);
ALTER TABLE zbiornik_typ ADD PRIMARY KEY(id);
CREATE TABLE zbiorniki(
id numeric(8) NOT NULL
,typ numeric(8) NOT NULL
,nazwa varchar(60) NOT NULL
);
ALTER TABLE zbiorniki ADD PRIMARY KEY(id);
CREATE TABLE pustynie(
id numeric(8) NOT NULL
,powierzchnia numeric(12,2) NOT NULL
,nazwa varchar(60) NOT NULL
);
ALTER TABLE pustynie ADD PRIMARY KEY(id);
CREATE TABLE szczyty(
id numeric(8) NOT NULL
,wysokosc numeric(12,2) NOT NULL
,id_pasmo_gorskie_panstwa numeric(8) NOT NULL
,nazwa varchar(60) NOT NULL
);
ALTER TABLE szczyty ADD PRIMARY KEY(id);
CREATE TABLE pasmo_gorskie(
id numeric(8) NOT NULL
,nazwa varchar(60) NOT NULL
);
ALTER TABLE pasmo_gorskie ADD PRIMARY KEY(id);
CREATE TABLE kontynenty_panstwa(
id numeric(8) NOT NULL
,id_kontynent numeric(8) NOT NULL
,id_panstwo numeric(8) NOT NULL
);
ALTER TABLE kontynenty_panstwa ADD PRIMARY KEY(id);
CREATE TABLE zbiorniki_panstwa(
id numeric(8) NOT NULL
,id_panstwo numeric(8) NOT NULL
,id_zbiornik numeric(8) NOT NULL
);
ALTER TABLE zbiorniki_panstwa ADD PRIMARY KEY(id);
CREATE TABLE pustynie_kont_panst(
id numeric(8) NOT NULL
,id_pustynia numeric(8) NOT NULL
,id_kontynent_panstwo numeric(8) NOT NULL
);
ALTER TABLE pustynie_kont_panst ADD PRIMARY KEY(id);
CREATE TABLE pasmo_gorskie_panstwa(
id numeric(8) NOT NULL
,id_pasmo_gorskie numeric(8) NOT NULL
,id_panstwo numeric(8) NOT NULL
);
ALTER TABLE pasmo_gorskie_panstwa ADD PRIMARY KEY(id);
CREATE TABLE panstwo_panstwo(
id numeric(8) NOT NULL
,dlugosc_granicy numeric(12,2) NOT NULL
,id_panstwo1 numeric(8) NOT NULL
,id_panstwo2 numeric(8) NOT NULL
);
ALTER TABLE panstwo_panstwo ADD PRIMARY KEY(id);
CREATE TABLE miara(
id numeric(8) NOT NULL
,nazwa varchar(12) NOT NULL
);
ALTER TABLE miara ADD PRIMARY KEY(id);
CREATE TABLE zbiorniki_miary(
id numeric(8) NOT NULL
,id_zbiornik numeric(8) NOT NULL
,id_miara numeric(8) NOT NULL
,wartosc numeric(12,2) NOT NULL
);
ALTER TABLE zbiorniki_miary ADD PRIMARY KEY(id);
CREATE TABLE miasta(
id numeric(8) NOT NULL
,nazwa varchar(60) NOT NULL
,ludnosc numeric(12) NOT NULL
,powierzchnia numeric(12,2) NULL
,czyStolica numeric(1) NOT NULL
,id_panstwo numeric(8) NOT NULL
);
ALTER TABLE miasta ADD PRIMARY KEY(id);
ALTER TABLE zbiorniki
ADD FOREIGN KEY(typ)
REFERENCES zbiornik_typ(id);
ALTER TABLE szczyty
ADD FOREIGN KEY(id_pasmo_gorskie_panstwa)
REFERENCES pasmo_gorskie_panstwa(id);
ALTER TABLE kontynenty_panstwa
ADD FOREIGN KEY(id_kontynent)
REFERENCES kontynenty(id);
ALTER TABLE zbiorniki_panstwa
ADD FOREIGN KEY(id_panstwo)
REFERENCES panstwa(id);
ALTER TABLE pustynie_kont_panst
ADD FOREIGN KEY(id_pustynia)
REFERENCES pustynie(id);
ALTER TABLE pasmo_gorskie_panstwa
ADD FOREIGN KEY(id_pasmo_gorskie)
REFERENCES pasmo_gorskie(id);
ALTER TABLE panstwo_panstwo
ADD FOREIGN KEY(id_panstwo1,id_panstwo2)
REFERENCES panstwa(id,id);
ALTER TABLE miasta
drop FOREIGN KEY (id_kontynent_panstwo)
REFERENCES kontynenty_panstwa(id);