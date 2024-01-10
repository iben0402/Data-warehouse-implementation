# KPIs
## 1
## Name
Zysk
## Value Expression
```mdx
[Measures].[Cena_wszystkich_przejazdow] - [Measures].[Cena_wszystkich_operacji]
```
## Goal Expression
```mdx
(KPIValue( "Zysk" ), ParallelPeriod (
[Daty].[Hierarchy].[Miesiac], 1,
[Daty].[Hierarchy].CurrentMember))* 1.01
```

## Status Expression
```mdx
IIf (KPIVALUE( "Zysk" ) > KPIGoal("Zysk"), 1, -1)
```

## Trend Expression
```mdx
IIf ( KPIValue( "Zysk" ) > ( KPIValue( "Zysk" ), ParallelPeriod (
[Daty].[Hierarchy].[Miesiac], 1,
[Daty].[Hierarchy].CurrentMember ) ), 1, -1)
```

## 2
## Name
Ilosc przejazdow
## Value Expression
```mdx
[Measures].[Liczba_przejazdow]
```
## Goal Expression
```mdx
( KPIValue( "Ilosc przejazdow" ), ParallelPeriod (
[Daty].[Hierarchy].[Miesiac], 1,
[Daty].[Hierarchy].CurrentMember ) ) * 1.01
```

## Status Expression
```mdx
IIf (KPIVALUE( "Ilosc przejazdow" ) > KPIGoal("Ilosc przejazdow"), 1, -1)
```

## Trend Expression
```mdx
IIf ( KPIValue( "Ilosc przejazdow" ) > ( KPIValue( "Ilosc przejazdow" ), ParallelPeriod (
[Daty].[Hierarchy].[Miesiac], 1,
[Daty].[Hierarchy].CurrentMember ) ), 1, -1)
```

## 3
## Name
Koszt utrzymania
## Value Expression
```mdx
[Measures].[Cena_wszystkich_operacji]
```
## Goal Expression
```mdx
( KPIValue( "Koszt utrzymania" ), ParallelPeriod (
[Daty].[Hierarchy].[Miesiac], 1,
[Daty].[Hierarchy].CurrentMember ) ) * 0.995
```

## Status Expression
```mdx
IIf (KPIVALUE( "Koszt utrzymania" ) < KPIGoal("Koszt utrzymania"), 1, -1)
```

## Trend Expression
```mdx
IIf ( KPIValue( "Koszt utrzymania" ) > ( KPIValue( "Koszt utrzymania" ), ParallelPeriod (
[Daty].[Hierarchy].[Miesiac], 1,
[Daty].[Hierarchy].CurrentMember ) ), 1, -1)
```


# Analytical Problems Queries

## 1. Porównaj ilość wynajmów w danym mieście do poprzedniego miesiąca.

```mdx
WITH 
MEMBER [Prev month amount] AS 
    '(
        PARALLELPERIOD(
            [Daty].[Hierarchy].[Miesiac], 
            1, 
            [Daty].[Hierarchy].CurrentMember
        ),
        [Measures].[Liczba_przejazdow]
    )'
SELECT 
    CROSSJOIN(
        [Daty].[Hierarchy].[Rok].[2021].[May],
        [Miasta].[Nazwa].Members
    ) ON ROWS,
    {
        [Measures].[Liczba_przejazdow], 
        [Prev month amount]
    } ON COLUMNS
FROM [Kachow];
```

## 2. Który model samochodu zaliczył największy wzrost ilości wynajmów w porównaniu do poprzedniego miesiąca?
```mdx
WITH 
MEMBER [Measures].[Liczba przejazdow w poprzednim miesiacu] AS 
    '(
        PARALLELPERIOD(
            [Daty].[Hierarchy].[Miesiac], 
            1, 
            [Daty].[Hierarchy].CurrentMember
        ),
        [Measures].[Liczba_przejazdow]
    )'
MEMBER [Measures].[Wzrost liczby przejazdow] AS 
    '[Measures].[Liczba_przejazdow] - [Measures].[Liczba przejazdow w poprzednim miesiacu]'

SELECT 
    {
        [Measures].[Liczba_przejazdow], 
        [Measures].[Liczba przejazdow w poprzednim miesiacu],
        [Measures].[Wzrost liczby przejazdow]
    } ON COLUMNS,
    TOPCOUNT(
        [Pojazdy].[Model].Members, 
		1,
        [Measures].[Wzrost liczby przejazdow]
    ) ON ROWS
FROM [Kachow]
WHERE [Daty].[Hierarchy].[Rok].[2021].[May]
```

## 3. W jakim mieście najbardziej wzrósł wskaźnik ilość wypożyczeń/liczba mieszkańców?
```mdx
WITH 
MEMBER [Measures].[Prev Month Ratio] AS 
    '(
        PARALLELPERIOD(
            [Daty].[Hierarchy].[Miesiac], 
            1, 
            [Daty].[Hierarchy].CurrentMember
        ),
        [Measures].[Wskaznik_ilosc_wypozyczen_na_liczba_mieszkancow]
    )'
MEMBER [Measures].[Ratio Increase] AS 
    '[Measures].[Wskaznik_ilosc_wypozyczen_na_liczba_mieszkancow] - [Measures].[Prev Month Ratio]'

SELECT 
    {
        [Measures].[Wskaznik_ilosc_wypozyczen_na_liczba_mieszkancow], 
        [Measures].[Prev Month Ratio],
        [Measures].[Ratio Increase]
    } ON COLUMNS,
    TOPCOUNT(
        [Miasta].[Nazwa].Members, 
        1, 
        [Measures].[Ratio Increase]
    ) ON ROWS
FROM [Kachow]
WHERE [Daty].[Hierarchy].[Rok].[2021].[May];
```

## 4. Który samochód ma największy wskaźnik ilość wypożyczeń/średnie spalanie w stosunku do poprzedniego miesiąca?
```mdx
WITH 
MEMBER [Measures].[Prev Month Ratio] AS 
    '(
        PARALLELPERIOD(
            [Daty].[Hierarchy].[Miesiac], 
            1, 
            [Daty].[Hierarchy].CurrentMember
        ),
        [Measures].[Wskaznik_ilosc_wypozyczen_na_srednie_spalanie]
    )'
MEMBER [Measures].[Ratio Increase] AS 
    '[Measures].[Wskaznik_ilosc_wypozyczen_na_srednie_spalanie] - [Measures].[Prev Month Ratio]'

SELECT 
    {
        [Measures].[Wskaznik_ilosc_wypozyczen_na_srednie_spalanie], 
        [Measures].[Prev Month Ratio],
        [Measures].[Ratio Increase]
    } ON COLUMNS,
    TOPCOUNT(
        [Pojazdy].[Model].Members, 
        1, 
        [Measures].[Ratio Increase]
    ) ON ROWS
FROM [Kachow]
WHERE [Daty].[Hierarchy].[Rok].[2021].[May];
```

## 5. Który samóchód był najdroższy w eksploatacji w danym miesiącu?
```mdx
SELECT 
    TOPCOUNT(
        [Pojazdy].[Model].Children, 
        1, 
        [Measures].[Cena_wszystkich_operacji]
    ) ON ROWS,
    {
        [Measures].[Cena_wszystkich_operacji]
    } ON COLUMNS
FROM [Kachow]
WHERE [Daty].[Hierarchy].[Rok].[2021].[May];
```

## 6. Porównaj koszty utrzymania odpowiedniego poziomu paliwa w pojazdach w porównaniu do poprzedniego miesiąca.
```mdx
WITH 
MEMBER [Measures].[Prev Month Cost] AS 
    '(
        PARALLELPERIOD(
            [Daty].[Hierarchy].[Miesiac], 
            1, 
            [Daty].[Hierarchy].CurrentMember
        ),
        [Measures].[Cena_wszystkich_operacji]
    )'
MEMBER [Measures].[Cost Increase] AS 
    '[Measures].[Cena_wszystkich_operacji] - [Measures].[Prev Month Cost]'

SELECT 
    {
        [Measures].[Cena_wszystkich_operacji], 
        [Measures].[Prev Month Cost],
        [Measures].[Cost Increase]
    } ON COLUMNS,
    NON EMPTY 
    {
        [Problemy].[Nazwa].brak_paliwa
    } ON ROWS
FROM [Kachow]
WHERE [Daty].[Hierarchy].[Rok].[2021].[May];
```

## 7. Który model samochodu wymagał najwięcej napraw serwisowych w porównianiu do poprzedniego miesiąca?
```mdx
WITH 
MEMBER [Measures].[Prev Month Repairs] AS 
    '(
        PARALLELPERIOD(
            [Daty].[Hierarchy].[Miesiac], 
            1, 
            [Daty].[Hierarchy].CurrentMember
        ),
        [Measures].[Liczba_operacji]
    )'
MEMBER [Measures].[Repair Increase] AS 
    '[Measures].[Liczba_operacji] - [Measures].[Prev Month Repairs]'

SELECT 
    {
        [Measures].[Liczba_operacji], 
        [Measures].[Prev Month Repairs],
        [Measures].[Repair Increase]
    } ON COLUMNS,
    TOPCOUNT(
        [Pojazdy].[Model].Children, 
        1, 
        [Measures].[Repair Increase]
    ) ON ROWS
FROM [Kachow]
WHERE [Daty].[Hierarchy].[Rok].[2021].[May];
```

## 8. W jakich miastach najczęściej trzeba było serwisować samochody?
```mdx
SELECT 
    NON EMPTY 
    [Miasta].[Nazwa].Members ON ROWS,
    {
        [Measures].[Liczba_operacji]
    } ON COLUMNS
FROM [Kachow]
WHERE [Problemy].[Nazwa].usterka;
```
## 9. W jakich miastach najrzadziej trzeba tankować samochody?
```mdx
SELECT 
    NON EMPTY 
    [Miasta].[Nazwa].Members ON ROWS,
    {
        [Measures].[Liczba_operacji]
    } ON COLUMNS
FROM [Kachow]
WHERE [Problemy].[Nazwa].brak_paliwa;
```
## 10. Jak często samochód można naraz posprzątać i zatankować?
```mdx
SELECT 
    {
        [Measures].[Liczba_operacji]
    } ON COLUMNS
FROM [Kachow]
WHERE [Problemy].[Nazwa].[brudny_pojazd_i_brak_paliwa];
```