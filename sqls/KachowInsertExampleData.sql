INSERT INTO Problemy (ID, Nazwa) VALUES
(1, 'brak'),
(2, 'usterka'),
(3, 'brudny_pojazd'),
(4, 'brak_paliwa'),
(5, 'usterka_i_brudny_pojazd'),
(6, 'usterka_i_brak_paliwa'),
(7, 'brudny_pojazd_i_brak_paliwa'),
(8, 'wszystkie');
GO

INSERT INTO Daty (ID, Dzien, Miesiac, Miesiac_No, Rok, Dzien_tygodnia) VALUES
(1, 5, 'Styczen', 1, 2010, 'Wtorek'),
(2, 16, 'Luty', 2, 2011, 'Sroda'),
(3, 23, 'Marzec', 3, 2012, 'Piatek'),
(4, 12, 'Kwiecien', 4, 2013, 'Sobota'),
(5, 7, 'Maj', 5, 2014, 'Niedziela'),
(6, 19, 'Czerwiec', 6, 2015, 'Poniedzialek'),
(7, 26, 'Lipiec', 7, 2016, 'Wtorek'),
(8, 14, 'Sierpien', 8, 2017, 'Czwartek'),
(9, 3, 'Wrzesien', 9, 2018, 'Sobota'),
(10, 22, 'Pazdziernik', 10, 2019, 'Niedziela'),
(11, 9, 'Listopad', 11, 2020, 'Wtorek'),
(12, 17, 'Grudzien', 12, 2021, 'Czwartek'),
(13, 6, 'Styczen', 1, 2022, 'Piatek'),
(14, 25, 'Luty', 2, 2023, 'Sobota'),
(15, 13, 'Marzec', 3, 2023, 'Niedziela');
GO

INSERT INTO DaneModeli (ID, Marka, Model, Srednie_spalanie) VALUES
(1, 'Toyota', 'Corolla', '<5l/100km'),
(2, 'Ford', 'Focus', 'od 5 do 8 l/100km');
GO

INSERT INTO Pojazdy (ID, ID_DaneModeli, Nr_rejestracyjny, VIN) VALUES
(1, 1, 'DW12345', 'VIN12341775901234'),
(2, 2, 'DW6789B', 'VIN12345616701235'),
(1, 1, 'GD12345', 'VIN12345612901234'),
(2, 2, 'GA6G893', 'VIN12345678965435');
GO

INSERT INTO Miasta (ID, Nazwa, Liczba_mieszkancow, Powierzchnia) VALUES
(1, 'Warszawa', 'od 500tys.', 'od 250km^2'),
(2, 'Kraków', '250tys.-500tys.', '100-250km^2');
GO

INSERT INTO Pracownicy (ID, ImieINazwisko, ID_miasta, Wyksztalcenie, Stanowisko, ID_data_rozpoczecia, ID_data_zakonczenia) VALUES
(1, 'Jan Kowalski', 1, 'wyzsze', 'Serwisant', 1, 2),
(2, 'Anna Nowak', 2, 'srednie', 'Osoba sprzątająca', 3, 6),
(3, 'Jan Kowalski', 2, 'wyzsze', 'Serwisant', 2, 7),
(4, 'Anna Nowak', 2, 'wyzsze', 'Osoba sprzątająca', 6, 9);
GO

INSERT INTO Uzytkownicy (ID, ImieINazwisko, Nr_prawa_jazdy, ID_data_rozpoczecia, ID_data_zakonczenia) VALUES
(1, 'Piotr Wiśniewski', 'NRJAZDY123', 1, 4),
(2, 'Katarzyna Mazur', 'NRJAZDY456', 2, 7),
(3, 'Piotr Wiśniewski', 'NRJAZ13156', 4, 12),
(4, 'Katarzyna Mazur', 'NRJAZD1676', 7, 14);
GO

INSERT INTO Przejazdy (ID, Czas, Dystans, Zuzyte_paliwo, ID_data, ID_Uzytkownika, ID_Miasta, ID_Pojazdu, ID_Problem, Cena, Liczba_mieszkancow_miasta) VALUES
(1, 30, 15, 1.5, 1, 1, 1, 1, 1, 35, 1700000),
(2, 45, 25, 2.5, 3, 2, 2, 2, 2, 55, 460000),
(3, 18, 15, 1.5, 6, 3, 2, 2, 2, 30, 460000),
(4, 55, 30, 3, 8, 3, 1, 1, 3, 65, 1700000),
(5, 35, 20, 2, 9, 4, 2, 2, 4, 45, 460000);
GO

INSERT INTO Operacje (ID_Problem, ID_Pracownika, ID_Pojazd, Cena, Czas, DataID) VALUES
(1, 1, 1, 200, 60, 1),
(2, 2, 2, 150, 45, 2),
(3, 1, 1, 250, 90, 3),
(4, 2, 2, 100, 30, 4),
(2, 3, 1, 180, 70, 5);
GO


