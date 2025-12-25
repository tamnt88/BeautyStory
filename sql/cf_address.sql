-- Create tables to manage province/ward data imported from the Excel file.
-- Target database: BeautyStoryDB

USE BeautyStoryDB;
GO

IF OBJECT_ID('dbo.cf_ward', 'U') IS NOT NULL
    DROP TABLE dbo.cf_ward;
GO

IF OBJECT_ID('dbo.cf_province', 'U') IS NOT NULL
    DROP TABLE dbo.cf_province;
GO

CREATE TABLE dbo.cf_province (
    province_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    province_name NVARCHAR(200) NOT NULL,
    CONSTRAINT UQ_cf_province_name UNIQUE (province_name)
);
GO

CREATE TABLE dbo.cf_ward (
    ward_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    province_id INT NOT NULL,
    ward_name NVARCHAR(200) NOT NULL,
    CONSTRAINT FK_cf_ward_province
        FOREIGN KEY (province_id) REFERENCES dbo.cf_province(province_id),
    CONSTRAINT UQ_cf_ward_name UNIQUE (province_id, ward_name)
);
GO

CREATE INDEX IX_cf_ward_name ON dbo.cf_ward(ward_name);
GO
