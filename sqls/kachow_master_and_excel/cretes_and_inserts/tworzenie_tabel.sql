CREATE DATABASE KachowMaster;
GO

USE KachowMaster;
GO

CREATE TABLE Uzytkownicy (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Imie VARCHAR(20),
    Nazwisko VARCHAR(20),
    Data_urodzenia DATE,
    Nr_prawa_jazdy VARCHAR(14)
);
GO

CREATE TABLE Pojazdy (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Marka VARCHAR(20),
    Model VARCHAR(30),
    Nr_Rejestracyjny VARCHAR(8),
    VIN VARCHAR(17)
);
GO

CREATE TABLE Przejazdy (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Data DATE,
    Czas NUMERIC,
    Dystans NUMERIC,
	Cena NUMERIC,
    Zuzyte_paliwo NUMERIC,
    Miasto VARCHAR(30),
	Pojazd_ID INT,
    ID_uzytkownika INT,
    FOREIGN KEY (Pojazd_ID) REFERENCES Pojazdy(ID),
    FOREIGN KEY (ID_uzytkownika) REFERENCES Uzytkownicy(ID)
);
GO

CREATE TABLE Problemy (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Plik VARCHAR(50),
    Opis VARCHAR(500),
	Przejazd_ID INT,
	FOREIGN KEY (Przejazd_ID) REFERENCES Przejazdy(ID)
);
GO

CREATE TABLE Operacje (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Imie_pracownika VARCHAR(20),
    Nazwisko_pracownika VARCHAR(20),
    Nazwa_operacji VARCHAR(50),
    Dodatkowe_informacje VARCHAR(300),
    Cena_Operacji NUMERIC,
    Czas_Operacji NUMERIC,
    Rodzaj_operacji VARCHAR(20),
    ID_problemu INT,
    Data_operacji DATE,
    FOREIGN KEY (ID_problemu) REFERENCES Problemy(ID)
);
GO