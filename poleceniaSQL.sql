insert into kontynenty(id, nazwa, powierzchnia, linia_brzegowa) values(1, 'europa', 10200000.0, 38000)
insert into kontynenty(id, nazwa, powierzchnia, linia_brzegowa) values(2, 'azja', 44600000.0, 230300)
insert into kontynenty(id, nazwa, powierzchnia, linia_brzegowa) values(3, 'afryka', 30400000.0, 26000)



select * from kontynenty

ALTER TABLE kontynenty modify id NOT NULL AUTO_INCREMENT
    ADD INDEX (id);
    
    insert into panstwa(id, nazwa, powierzchnia, dlugosc_granica) values(5, 'anglia', 130279, 500)
    
	insert into kontynenty_panstwa values(1, 1, 1)
    insert into panstwo_panstwo values(2, 200, 1, 4)
    
    select p.nazwa, pp.*
    from panstwa as p join (select * from panstwo_panstwo where id_panstwo2 <> p.id) as pp on p.id  pp.panstwo1
    
--1
SELECT p.nazwa, j.nazwa as kontynent
FROM panstwa AS p LEFT JOIN 
(
	SELECT k.id AS kontynentId, k.nazwa, kp.id_kontynent, kp.id_panstwo 
	FROM kontynenty as k LEFT JOIN kontynenty_panstwa AS kp ON k.id = kp.id_kontynent
) AS j 
	ON j.id_panstwo = p.id
    
--2
SELECT p.nazwa, 
CASE 
	WHEN p.id = q.id_panstwo1 THEN (SELECT p1.nazwa FROM panstwa AS p1 WHERE p1.id = q.id_panstwo2) 
    ELSE (SELECT p1.nazwa FROM panstwa AS p1 WHERE p1.id = q.id_panstwo1) END 
AS graniczyZ
FROM panstwa as p LEFT JOIN (SELECT pp.id_panstwo1, pp.id_panstwo2 
	FROM panstwo_panstwo AS pp) AS q ON p.id = q.id_panstwo1 OR p.id = q.id_panstwo2
WHERE p.id = 1


--3
SELECT p.nazwa, COUNT(
CASE 
	WHEN p.id = q.id_panstwo1 THEN (SELECT 1 FROM panstwa AS p1 WHERE p1.id = q.id_panstwo2) 
    ELSE (SELECT 1 FROM panstwa AS p1 WHERE p1.id = q.id_panstwo1) END)
AS liczbaSasiadow
FROM panstwa as p LEFT JOIN (SELECT pp.id_panstwo1, pp.id_panstwo2 
	FROM panstwo_panstwo AS pp) AS q ON p.id = q.id_panstwo1 OR p.id = q.id_panstwo2
GROUP BY p.nazwa
HAVING COUNT(
CASE 
	WHEN p.id = q.id_panstwo1 THEN (SELECT 1 FROM panstwa AS p1 WHERE p1.id = q.id_panstwo2) 
    ELSE (SELECT 1 FROM panstwa AS p1 WHERE p1.id = q.id_panstwo1) END) >=2 
    
insert into miasta values(3, 'plock', 130000, 15, 0, 1)
update miasta set id_kontynent_panstwo = 5 where id = 2
delete from miasta where id = 2

--4 
SELECT nazwa, ludnosc FROM miasta
WHERE ludnosc > 1000000


--5 miast w europie ktore sa stolicami
SELECT sum(ludnosc) as liczbaLudnosci
FROM miasta 
WHERE id_panstwo IN (SELECT id_panstwo FROM kontynenty_panstwa WHERE id_kontynent = 1)
	AND czystolica = 1


--6 kraje przez ktore przeplywa najdluzsza rzeka
SELECT zp.*, (
	SELECT p.nazwa FROM panstwa AS p WHERE p.id = zp.id_panstwo
    ) AS nazwaPanstwa
FROM zbiorniki_panstwa AS zp LEFT JOIN
(
	SELECT z.id, z.nazwa FROM zbiorniki AS z INNER JOIN zbiorniki_miary AS m ON z.id = m.id_zbiornik
	WHERE z.typ = 'rzeka' and m.id_miara = 1
) AS q
ON zp.id_zbiornik = q.id

--7 najwiekszy zbiornik na danym kontynencie
SELECT k.nazwa, q.nazwa AS zbiornik, q.wartosc AS powierzchnia
FROM kontynenty AS k LEFT JOIN 
(
SELECT z.id, z.nazwa, m.wartosc, zp.id_panstwo, kp.id_kontynent
FROM zbiorniki AS z left JOIN zbiorniki_miary AS m 
	ON z.id = m.id_zbiornik
    LEFT JOIN zbiorniki_panstwa AS zp ON z.id = zp.id_panstwo
    LEFT JOIN kontynenty_panstwa AS kp ON zp.id_panstwo = kp.id_panstwo
WHERE m.id_miara = 3
ORDER BY m.wartosc DESC
LIMIT 1

) AS q
ON k.id = q.id_kontynent


--10 kraje w porzadku malejacy wg najwyzszego szczytu


select *
from information_schema.table_constraints
where constraint_schema = 'sysgeo'




