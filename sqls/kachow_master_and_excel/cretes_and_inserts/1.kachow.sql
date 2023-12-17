USE KachowMaster
GO

BULK INSERT dbo.Uzytkownicy FROM 'C:\Users\iwona\Data-warehouse-implementation\sqls\kachow_master_and_excel\generated\users.bulk' WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '\n'
);
GO
BULK INSERT dbo.Pojazdy FROM 'C:\Users\iwona\Data-warehouse-implementation\sqls\kachow_master_and_excel\generated\vehicles.bulk' WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '0x0A'
);
GO
BULK INSERT dbo.Przejazdy FROM 'C:\Users\iwona\Data-warehouse-implementation\sqls\kachow_master_and_excel\generated\drives.bulk' WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '0x0A'
);
GO
BULK INSERT dbo.Problemy FROM 'C:\Users\iwona\Data-warehouse-implementation\sqls\kachow_master_and_excel\generated\problems.bulk' WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '\n'
);
GO
BULK INSERT dbo.Operacje FROM 'C:\Users\iwona\Data-warehouse-implementation\sqls\kachow_master_and_excel\generated\operations.bulk' WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '\n'
);
GO

SELECT * FROM Problemy