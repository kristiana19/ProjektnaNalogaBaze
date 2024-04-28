INSERT INTO drzave (drzava_lokalno, oznaka_drzave, drzava_iso, opombe)
VALUES ('Slovenija', 'SLO', 'SI', 'Domovina');

INSERT INTO drzave (drzava_lokalno, oznaka_drzave, drzava_iso, opombe)
VALUES ('Hrvaška', 'HRV', 'HR', 'Sosednja država');

INSERT INTO zalozniki (drzave_id, zaloznik)
VALUES (1, 'Zalozba A');

INSERT INTO zalozniki (drzave_id, zaloznik)
VALUES (2, 'Zalozba B');

INSERT INTO kljucne_besede (kljucna_beseda)
VALUES ('Fantazija');
INSERT INTO kljucne_besede (kljucna_beseda)
VALUES ('Romantika');

INSERT INTO jeziki (jezik, oznaka_jezik)
VALUES ('Slovenščina', 'SL');
INSERT INTO jeziki (jezik, oznaka_jezik)
VALUES ('Angleščina', 'EN');

INSERT INTO knjige_gradivo (zalozniki_id, jeziki_id, naslov, leto_izdaje, opis, fizicni_opis, opombe, isbn)
VALUES (1, 1, 'Testna knjiga 1', 2020, 'Fantazijski roman', 'Trda vezava', 'Prva knjiga v seriji', '978-3-16-148410-0');
INSERT INTO knjige_gradivo (zalozniki_id, jeziki_id, naslov, leto_izdaje, opis, fizicni_opis, opombe, isbn)
VALUES (2, 2, 'Testna knjiga 2', 2019, 'Romantični roman', 'Mehka vezava', 'Druga knjiga v seriji', '978-3-16-148411-0');

INSERT INTO knjige_gradivo_kljucne_besede (knjige_gradivo_id, kljucne_besede_id, zaporedno_mesto)
VALUES (1, 1, 1);
INSERT INTO knjige_gradivo_kljucne_besede (knjige_gradivo_id, kljucne_besede_id, zaporedno_mesto)
VALUES (2, 2, 1);

INSERT INTO osebe (ime, priimek, emso, spol, datum_rojstva, naslov, enaslov, telefon, davcna_stevilka)
VALUES ('Janez', 'Novak', '1234567890123', 'moški', '1980-05-15', 'Testni naslov 1', 'janez.novak@example.com', '123456789', '12345678');
INSERT INTO osebe (ime, priimek, emso, spol, datum_rojstva, naslov, enaslov, telefon, davcna_stevilka)
VALUES ('Ana', 'Kovač', '9876543210987', 'ženski', '1992-10-20', 'Testni naslov 2', 'ana.kovac@example.com', '987654321', '87654321');

INSERT INTO uporabniski_racuni (osebe_id, uporabnisko_ime, geslo, vrsta_racuna, aktiven, e_naslov)
VALUES (1, 'jnovak', 'password1', 'osnovni', true, 'janez.novak@example.com');
INSERT INTO uporabniski_racuni (osebe_id, uporabnisko_ime, geslo, vrsta_racuna, aktiven, e_naslov)
VALUES (2, 'akovac', 'password2', 'osnovni', true, 'ana.kovac@example.com');

INSERT INTO knjige_gradivo_ocene (knjige_gradivo_id, uporabniski_racuni_id, ocena)
VALUES (1, 1, 8);
INSERT INTO knjige_gradivo_ocene (knjige_gradivo_id, uporabniski_racuni_id, ocena)
VALUES (2, 2, 7);

--za prikaz vseh drzav:
CREATE VIEW view_drzave AS
SELECT * FROM drzave;

--za prikaz vseh zaloznikov:
CREATE VIEW view_zalozniki AS
SELECT z.zalozniki_id, z.drzave_id, d.drzava_lokalno, z.zaloznik
FROM zalozniki z
INNER JOIN drzave d ON z.drzave_id = d.drzave_id;


-- za prikaz vseh ključnih besed:
CREATE VIEW view_kljucne_besede AS
SELECT * FROM kljucne_besede;

--za prikaz vseh jezikov:
CREATE VIEW view_jeziki AS
SELECT * FROM jeziki;


--za prikaz vseh knjig:
CREATE VIEW view_knjige_gradivo AS
SELECT k.knjige_gradivo_id, z.zaloznik, j.jezik, k.naslov, k.leto_izdaje, k.opis, k.fizicni_opis, k.opombe, k.isbn
FROM knjige_gradivo k
INNER JOIN zalozniki z ON k.zalozniki_id = z.zalozniki_id
INNER JOIN jeziki j ON k.jeziki_id = j.jeziki_id;

--za prikaz vseh oseb:
CREATE VIEW view_osebe AS
SELECT * FROM osebe;

-- za prikaz vseh uporabniških računov:
CREATE VIEW view_uporabniski_racuni AS
SELECT u.uporabniski_racuni_id, o.ime, o.priimek, u.uporabnisko_ime, u.vrsta_racuna, u.aktiven, u.e_naslov
FROM uporabniski_racuni u
INNER JOIN osebe o ON u.osebe_id = o.osebe_id;

--za prikaz ocen knjig:
CREATE VIEW view_knjige_gradivo_ocene AS
SELECT k.naslov, o.ime, o.priimek, ose.uporabnisko_ime, kgo.ocena
FROM knjige_gradivo_ocene kgo
INNER JOIN knjige_gradivo k ON kgo.knjige_gradivo_id = k.knjige_gradivo_id
INNER JOIN uporabniski_racuni ose ON kgo.uporabniski_racuni_id = ose.uporabniski_racuni_id
INNER JOIN osebe o ON ose.osebe_id = o.osebe_id;






