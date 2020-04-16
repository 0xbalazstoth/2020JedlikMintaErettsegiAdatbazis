-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!


-- 1. feladat:
CREATE DATABASE formula1
DEFAULT CHARACTER SET UTF8
COLLATE utf8_hungarian_ci;

-- 3. feladat:
UPDATE `nagydijak` SET `korokszama` = '70' WHERE nev="Hungarian Grand Prix";

-- 4. feladat:
SELECT vezeteknev, rajtszam, csapatnev, 2019 - YEAR(szuletesidatum) as "eletkor" FROM pilotak
ORDER BY eletkor DESC;

-- 5. feladat:
SELECT nev, pilotak.vezeteknev, pilotak.keresztnev, versenynap FROM eredmenyek
INNER JOIN nagydijak ON eredmenyek.nagydijid = nagydijak.id
INNER JOIN pilotak ON eredmenyek.pilotaid = pilotak.id
WHERE(eredmenyek.helyezes = 1)
GROUP BY nev
ORDER BY nagydijak.versenynap;

-- 6. feladat:
SELECT CONCAT(pilotak.vezeteknev, " ", pilotak.keresztnev) as "nev", pilotak.csapatnev, SUM(eredmenyek.pontszam) as "osszpontszam" FROM eredmenyek
INNER JOIN nagydijak ON eredmenyek.nagydijid = nagydijak.id
INNER JOIN pilotak ON eredmenyek.pilotaid = pilotak.id
GROUP BY pilotak.vezeteknev, pilotak.csapatnev, pilotak.csapatnev
ORDER BY osszpontszam DESC
LIMIT 3;
