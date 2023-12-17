USE KachowMaster
GO

BULK INSERT dbo.Uzytkownicy FROM 'C:\Users\iwona\Data-warehouse-implementation\sqls\kachow_master_and_excel\generated_2\users.bulk' WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '\n'
);
GO
BULK INSERT dbo.Pojazdy FROM 'C:\Users\iwona\Data-warehouse-implementation\sqls\kachow_master_and_excel\generated_2\vehicles.bulk' WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '0x0A'
);
GO
BULK INSERT dbo.Przejazdy FROM 'C:\Users\iwona\Data-warehouse-implementation\sqls\kachow_master_and_excel\generated_2\drives.bulk' WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '0x0A'
);
GO
BULK INSERT dbo.Problemy FROM 'C:\Users\iwona\Data-warehouse-implementation\sqls\kachow_master_and_excel\generated_2\problems.bulk' WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '\n'
);
GO
BULK INSERT dbo.Operacje FROM 'C:\Users\iwona\Data-warehouse-implementation\sqls\kachow_master_and_excel\generated_2\operations.bulk' WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '\n'
);
GO