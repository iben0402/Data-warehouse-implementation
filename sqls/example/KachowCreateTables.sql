USE KachowDW
GO

CREATE TABLE Problemy (
    ID NUMERIC IDENTITY(1,1) PRIMARY KEY,
    Nazwa VARCHAR(30) CHECK (Nazwa IN ('brak', 'usterka', 'brudny_pojazd', 'brak_paliwa', 'usterka_i_brudny_pojazd', 'usterka_i_brak_paliwa', 'brudny_pojazd_i_brak_paliwa', 'wszystkie'))
);
GO

CREATE TABLE Daty (
    ID NUMERIC IDENTITY(1,1) PRIMARY KEY,
    Dzien NUMERIC,
    Miesiac VARCHAR(11) CHECK (Miesiac IN ('Styczen', 'Luty', 'Marzec', 'Kwiecien', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpien', 'Wrzesien', 'Pazdziernik', 'Listopad', 'Grudzien')),
    Miesiac_No NUMERIC,
    Rok NUMERIC,
    Dzien_tygodnia VARCHAR(12) CHECK (Dzien_tygodnia IN ('Poniedzialek', 'Wtorek', 'Sroda', 'Czwartek', 'Piatek', 'Sobota', 'Niedziela'))
);
GO

CREATE TABLE DaneModeli (
    ID NUMERIC IDENTITY(1,1) PRIMARY KEY,
    Marka VARCHAR(15),
    Model VARCHAR(15),
    Srednie_spalanie VARCHAR(18) CHECK (Srednie_spalanie IN ('<5l/100km', 'od 5 do 8 l/100km', '>8l/100km'))
);
GO

CREATE TABLE Pojazdy (
    ID NUMERIC IDENTITY(1,1) PRIMARY KEY,
    ID_DaneModeli NUMERIC,
    Nr_rejestracyjny VARCHAR(10),
    VIN VARCHAR(17),
    FOREIGN KEY (ID_DaneModeli) REFERENCES DaneModeli(ID)
);
GO

CREATE TABLE Miasta (
    ID NUMERIC IDENTITY(1,1) PRIMARY KEY,
    Nazwa VARCHAR(15),
    Liczba_mieszkancow VARCHAR(15) CHECK (Liczba_mieszkancow IN ('do 100tys.', '100tys.-250tys.', '250tys.-500tys.', 'od 500tys.')),
    Powierzchnia VARCHAR(13) CHECK (Powierzchnia IN ('do 25km^2', '25-100km^2', '100-250km^2', 'od 250km^2'))
);
GO

CREATE TABLE Pracownicy (
    ID NUMERIC IDENTITY(1,1) PRIMARY KEY,
    ImieINazwisko VARCHAR(41),
    ID_miasta NUMERIC,
    Wyksztalcenie VARCHAR(20) CHECK (Wyksztalcenie IN ('podstawowe', 'srednie', 'wyzsze')),
    Stanowisko VARCHAR(20) CHECK (Stanowisko IN ('Serwisant', 'Osoba sprzatajaca')),
    IsCurrent NUMERIC CHECK(IsCurrent IN (0, 1)),
    FOREIGN KEY (ID_miasta) REFERENCES Miasta(ID)
);
GO

CREATE TABLE Uzytkownicy (
    ID NUMERIC IDENTITY(1,1) PRIMARY KEY,
    ImieINazwisko VARCHAR(41),
    Nr_prawa_jazdy VARCHAR(14),
	IsCurrent NUMERIC CHECK(IsCurrent IN (0, 1))
);
GO

CREATE TABLE Przejazdy (
    ID NUMERIC PRIMARY KEY,
    Czas NUMERIC,
    Dystans NUMERIC,
    Zuzyte_paliwo NUMERIC,
    ID_data NUMERIC,
    ID_Uzytkownika NUMERIC,
    ID_Miasta NUMERIC,
    ID_Pojazdu NUMERIC,
    ID_Problem NUMERIC,
    Cena MONEY,
    Liczba_mieszkancow_miasta NUMERIC,
    FOREIGN KEY (ID_data) REFERENCES Daty(ID),
    FOREIGN KEY (ID_Uzytkownika) REFERENCES Uzytkownicy(ID),
    FOREIGN KEY (ID_Miasta) REFERENCES Miasta(ID),
    FOREIGN KEY (ID_Pojazdu) REFERENCES Pojazdy(ID),
    FOREIGN KEY (ID_Problem) REFERENCES Problemy(ID)
);
GO

CREATE TABLE Operacje (
    ID_Problem NUMERIC,
    ID_Pracownika NUMERIC,
    ID_Pojazd NUMERIC,
    Cena MONEY,
    Czas NUMERIC,
    DataID NUMERIC,
    FOREIGN KEY (ID_Problem) REFERENCES Problemy(ID),
    FOREIGN KEY (ID_Pracownika) REFERENCES Pracownicy(ID),
    FOREIGN KEY (ID_Pojazd) REFERENCES Pojazdy(ID),
    FOREIGN KEY (DataID) REFERENCES Daty(ID)
);
GO
USE KachowDW
GO
ALTER TABLE Uzytkownicy
ALTER COLUMN Nr_prawa_jazdy VARCHAR(14)

USE KachowDW
GO
DROP TABLE Operacje
GO 
DROP TABLE Przejazdy
GO
DROP TABLE Uzytkownicy
GO
DROP TABLE Miasta
GO
DROP TABLE Pojazdy
GO
DROP TABLE DaneModeli
GO
DROP TABLE Daty
GO
DROP TABLE Problemy
GO