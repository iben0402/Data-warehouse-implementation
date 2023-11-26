CREATE TABLE Problemy (
    ID NUMERIC PRIMARY KEY,
    Nazwa VARCHAR(30) CHECK (Nazwa IN ('brak', 'usterka', 'brudny_pojazd', 'brak_paliwa', 'usterka_i_brudny_pojazd', 'usterka_i_brak_paliwa', 'brudny_pojazd_i_brak_paliwa', 'wszystkie'))
);
GO

CREATE TABLE Daty (
    ID NUMERIC PRIMARY KEY,
    Dzieñ NUMERIC,
    Miesi¹c VARCHAR(11) CHECK (Miesi¹c IN ('Styczeñ', 'Luty', 'Marzec', 'Kwiecieñ', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpieñ', 'Wrzesieñ', 'PaŸdziernik', 'Listopad', 'Grudzieñ')),
    Miesiac_No NUMERIC,
    Rok NUMERIC,
    Dzien_tygodnia VARCHAR(12) CHECK (Dzien_tygodnia IN ('Poniedzia³ek', 'Wtorek', 'Œroda', 'Czwartek', 'Pi¹tek', 'Sobota', 'Niedziela'))
);
GO

CREATE TABLE DaneModeli (
    ID NUMERIC PRIMARY KEY,
    Marka VARCHAR(15),
    Model VARCHAR(15),
    Srednie_spalanie VARCHAR(18) CHECK (Srednie_spalanie IN ('<5l/100km', 'od 5 do 8 l/100km', '>8l/100km'))
);
GO

CREATE TABLE Pojazdy (
    ID NUMERIC PRIMARY KEY,
    ID_DaneModeli NUMERIC,
    Nr_rejestracyjny VARCHAR(10),
    VIN VARCHAR(17),
    FOREIGN KEY (ID_DaneModeli) REFERENCES DaneModeli(ID)
);
GO

CREATE TABLE Miasta (
    ID NUMERIC PRIMARY KEY,
    Nazwa VARCHAR(15),
    Liczba_mieszkancow VARCHAR(15) CHECK (Liczba_mieszkancow IN ('do 100tys.', '100tys.-250tys.', '250tys.-500tys.', 'od 500tys.')),
    Powierzchnia VARCHAR(13) CHECK (Powierzchnia IN ('do 25km^2', '25-100km^2', '100-250km^2', 'od 250km^2'))
);
GO

CREATE TABLE Pracownicy (
    ID NUMERIC PRIMARY KEY,
    ImieINazwisko VARCHAR(36),
    ID_miasta NUMERIC,
    Wyksztalcenie VARCHAR(20) CHECK (Wyksztalcenie IN ('podstawowe', 'œrednie', 'wy¿sze')),
    Stanowisko VARCHAR(20) CHECK (Stanowisko IN ('Serwisant', 'Osoba sprz¹taj¹ca')),
    ID_data_rozpoczecia NUMERIC,
    ID_data_zakonczenia NUMERIC,
    FOREIGN KEY (ID_miasta) REFERENCES Miasta(ID),
    FOREIGN KEY (ID_data_rozpoczecia) REFERENCES Daty(ID),
    FOREIGN KEY (ID_data_zakonczenia) REFERENCES Daty(ID)
);
GO

CREATE TABLE Uzytkownicy (
    ID NUMERIC PRIMARY KEY,
    ImieINazwisko VARCHAR(36),
    Nr_prawa_jazdy VARCHAR(13),
    ID_data_rozpoczecia NUMERIC,
    ID_data_zakonczenia NUMERIC,
    FOREIGN KEY (ID_data_rozpoczecia) REFERENCES Daty(ID),
    FOREIGN KEY (ID_data_zakonczenia) REFERENCES Daty(ID)
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