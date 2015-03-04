
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 12/14/2014 16:49:05
-- Generated from EDMX file: Z:\Mash\WORD_TXT\Прикомандированный ЛС\VladimirAlemasov\Projects2010\FormRevolution v2\FormRevolution\EntityDataModel\MSModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [FormGeneral];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Activity]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Activity];
GO
IF OBJECT_ID(N'[dbo].[BadRegistry]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BadRegistry];
GO
IF OBJECT_ID(N'[dbo].[Deputy]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Deputy];
GO
IF OBJECT_ID(N'[dbo].[DriverLicense]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DriverLicense];
GO
IF OBJECT_ID(N'[dbo].[DutyForm]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DutyForm];
GO
IF OBJECT_ID(N'[dbo].[Education]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Education];
GO
IF OBJECT_ID(N'[dbo].[Evolution]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Evolution];
GO
IF OBJECT_ID(N'[dbo].[Marriage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Marriage];
GO
IF OBJECT_ID(N'[dbo].[Medicine]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Medicine];
GO
IF OBJECT_ID(N'[dbo].[MilitaryCard]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MilitaryCard];
GO
IF OBJECT_ID(N'[dbo].[MilitaryCertificate]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MilitaryCertificate];
GO
IF OBJECT_ID(N'[dbo].[MilitaryDistrict]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MilitaryDistrict];
GO
IF OBJECT_ID(N'[dbo].[MilitaryTitle]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MilitaryTitle];
GO
IF OBJECT_ID(N'[dbo].[MilitaryUnit]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MilitaryUnit];
GO
IF OBJECT_ID(N'[dbo].[OrderBase]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderBase];
GO
IF OBJECT_ID(N'[dbo].[Parents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Parents];
GO
IF OBJECT_ID(N'[dbo].[Passport]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Passport];
GO
IF OBJECT_ID(N'[dbo].[Permission]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Permission];
GO
IF OBJECT_ID(N'[dbo].[Phone]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Phone];
GO
IF OBJECT_ID(N'[dbo].[Railroad]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Railroad];
GO
IF OBJECT_ID(N'[dbo].[Recruit]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Recruit];
GO
IF OBJECT_ID(N'[dbo].[Speciality]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Speciality];
GO
IF OBJECT_ID(N'[dbo].[Station]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Station];
GO
IF OBJECT_ID(N'[dbo].[TDT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TDT];
GO
IF OBJECT_ID(N'[dbo].[Token]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Token];
GO
IF OBJECT_ID(N'[dbo].[Troop]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Troop];
GO
IF OBJECT_ID(N'[dbo].[TroopDuty]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TroopDuty];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Activity'
CREATE TABLE [dbo].[Activity] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'BadRegistry'
CREATE TABLE [dbo].[BadRegistry] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Deputy'
CREATE TABLE [dbo].[Deputy] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL,
    [MilitaryUnit_ID] int  NOT NULL
);
GO

-- Creating table 'DriverLicense'
CREATE TABLE [dbo].[DriverLicense] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Serial] nvarchar(16)  NOT NULL,
    [Number] nvarchar(16)  NOT NULL,
    [Type] nvarchar(50)  NULL,
    [IsROSTO] bit  NOT NULL,
    [Recruit_ID] int  NOT NULL
);
GO

-- Creating table 'DutyForm'
CREATE TABLE [dbo].[DutyForm] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Education'
CREATE TABLE [dbo].[Education] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Evolution'
CREATE TABLE [dbo].[Evolution] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Competency] int  NOT NULL,
    [NeuroPsyhicStability] int  NOT NULL,
    [IsMarine] bit  NOT NULL,
    [Conviction] bit  NOT NULL,
    [SpecialityTextual] nvarchar(max)  NOT NULL,
    [SportCategory_ID] int  NOT NULL,
    [SportType_ID] int  NOT NULL,
    [Activity_ID] int  NOT NULL,
    [Education_ID] int  NOT NULL,
    [DutyForm_ID] int  NOT NULL,
    [BadRegistry_ID] int  NOT NULL,
    [Parents_ID] int  NOT NULL,
    [Speciality_ID] int  NOT NULL,
    [Recruit_ID] int  NOT NULL
);
GO

-- Creating table 'Marriage'
CREATE TABLE [dbo].[Marriage] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Medicine'
CREATE TABLE [dbo].[Medicine] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Category] int  NOT NULL,
    [Degree] int  NOT NULL,
    [Article] nvarchar(64)  NOT NULL,
    [VisionR] float  NOT NULL,
    [VisionL] float  NOT NULL,
    [Height] int  NOT NULL,
    [Weight] int  NOT NULL,
    [SizeHead] int  NOT NULL,
    [SizeVolume] int  NOT NULL,
    [SizeFeet] int  NOT NULL,
    [SizeHeight] int  NULL,
    [Recruit_ID] int  NOT NULL,
    [TDT_ID] int  NOT NULL
);
GO

-- Creating table 'MilitaryCard'
CREATE TABLE [dbo].[MilitaryCard] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Serial] nchar(2)  NOT NULL,
    [Number] nchar(7)  NOT NULL,
    [Recruit_ID] int  NOT NULL
);
GO

-- Creating table 'MilitaryCertificate'
CREATE TABLE [dbo].[MilitaryCertificate] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Post] nvarchar(512)  NOT NULL,
    [Serial] nchar(2)  NOT NULL,
    [Number] nchar(7)  NOT NULL,
    [IsMarine] bit  NOT NULL,
    [ObtainDepartment] nvarchar(max)  NOT NULL,
    [ObtainDate] datetime  NOT NULL,
    [MilitaryTitle_Rank] int  NOT NULL,
    [Deputy_ID] int  NOT NULL
);
GO

-- Creating table 'MilitaryDistrict'
CREATE TABLE [dbo].[MilitaryDistrict] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'MilitaryTitle'
CREATE TABLE [dbo].[MilitaryTitle] (
    [Rank] int IDENTITY(1,1) NOT NULL,
    [Land] nvarchar(64)  NOT NULL,
    [Marine] nvarchar(64)  NOT NULL
);
GO

-- Creating table 'MilitaryUnit'
CREATE TABLE [dbo].[MilitaryUnit] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(16)  NOT NULL,
    [Zip] char(6)  NOT NULL,
    [Address] nvarchar(512)  NOT NULL,
    [MilitaryForces_ID] int  NOT NULL
);
GO

-- Creating table 'OrderSoldier'
CREATE TABLE [dbo].[OrderSoldier] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Number] int  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'Parents'
CREATE TABLE [dbo].[Parents] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Passport'
CREATE TABLE [dbo].[Passport] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [BirthPlace] nvarchar(512)  NOT NULL,
    [BirthDate] datetime  NOT NULL,
    [Serial] char(4)  NOT NULL,
    [Number] char(6)  NOT NULL,
    [ObtainDepartment] nvarchar(512)  NOT NULL,
    [ObtainDate] datetime  NOT NULL,
    [MarriageStatus] int  NOT NULL,
    [Children] bit  NOT NULL,
    [Recruit_ID] int  NOT NULL,
    [Marriage_ID] int  NOT NULL
);
GO

-- Creating table 'Permission'
CREATE TABLE [dbo].[Permission] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Form] nvarchar(10)  NOT NULL,
    [Number] nvarchar(16)  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'Phone'
CREATE TABLE [dbo].[Phone] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Number] nvarchar(32)  NOT NULL,
    [Addressee] nvarchar(max)  NOT NULL,
    [MilitaryUnit_ID] int  NOT NULL
);
GO

-- Creating table 'Railroad'
CREATE TABLE [dbo].[Railroad] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Recruit'
CREATE TABLE [dbo].[Recruit] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Surname] nvarchar(64)  NOT NULL,
    [Name] nvarchar(64)  NOT NULL,
    [Patronymic] nvarchar(64)  NULL,
    [Department] nvarchar(256)  NOT NULL,
    [IsDismissed] bit  NOT NULL,
    [DismissalFrom] datetime  NULL,
    [DismissalTo] datetime  NULL,
    [DismissalTroop] nvarchar(10)  NULL,
    [IsSelfDesiredAbsent] bit  NOT NULL,
    [SelfDesiredAbsenceDate] datetime  NULL,
    [ArrivalDate] datetime  NOT NULL,
    [DepartureDate] datetime  NULL,
    [Troop_ID] int  NOT NULL,
    [Token_ID] int  NULL,
    [Permission_ID] int  NULL
);
GO

-- Creating table 'Speciality'
CREATE TABLE [dbo].[Speciality] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Station'
CREATE TABLE [dbo].[Station] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(128)  NOT NULL,
    [MilitaryDistrict_ID] int  NOT NULL,
    [Railroad_ID] int  NOT NULL
);
GO

-- Creating table 'TDT'
CREATE TABLE [dbo].[TDT] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Column1] bit  NULL,
    [Column2] bit  NULL,
    [Column3] bit  NULL,
    [Column4] bit  NULL,
    [Column5] bit  NULL,
    [Column6] bit  NULL,
    [Column7] bit  NULL,
    [Column8] bit  NULL,
    [Column9] bit  NULL,
    [Column10] bit  NULL
);
GO

-- Creating table 'Token'
CREATE TABLE [dbo].[Token] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Serial] nchar(2)  NOT NULL,
    [Number] nchar(6)  NOT NULL
);
GO

-- Creating table 'Troop'
CREATE TABLE [dbo].[Troop] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(64)  NULL,
    [Number] nvarchar(64)  NOT NULL,
    [EchelonNumber] nvarchar(64)  NOT NULL,
    [DepartureDate] datetime  NOT NULL,
    [ProxyNumber] nvarchar(64)  NOT NULL,
    [ProxyDate] datetime  NOT NULL,
    [AgentOfficers] int  NOT NULL,
    [AgentSemiOfficers] int  NOT NULL,
    [AgentSoldiers] int  NOT NULL,
    [Overall] int  NOT NULL,
    [Drivers] int  NOT NULL,
    [MTLB] int  NOT NULL,
    [AKPM] int  NOT NULL,
    [Tractor] int  NOT NULL,
    [Convicted] int  NOT NULL,
    [Married] int  NOT NULL,
    [Children] int  NOT NULL,
    [Permission] int  NOT NULL,
    [Task] int  NOT NULL,
    [IsDeparted] bit  NOT NULL,
    [IsDressed] bit  NOT NULL,
    [IsDisplayed] bit  NOT NULL,
    [IsCentral] bit  NOT NULL,
    [IsLocal] bit  NOT NULL,
    [SupplyCount] int  NULL,
    [OrderSoldier_ID] int  NULL,
    [MilitaryUnit_ID] int  NOT NULL,
    [Deputy_ID] int  NOT NULL,
    [Station_ID] int  NOT NULL
);
GO

-- Creating table 'TroopDuty'
CREATE TABLE [dbo].[TroopDuty] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [MilitarySpecs1] nchar(6)  NULL,
    [MilitarySpecs2] nchar(6)  NULL,
    [MilitarySpecs3] nchar(6)  NULL,
    [DutyForm_ID] int  NOT NULL
);
GO

-- Creating table 'MilitaryForces'
CREATE TABLE [dbo].[MilitaryForces] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SportCategory'
CREATE TABLE [dbo].[SportCategory] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SportType'
CREATE TABLE [dbo].[SportType] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'OrderWare'
CREATE TABLE [dbo].[OrderWare] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Number] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [Troop_ID] int  NOT NULL
);
GO

-- Creating table 'SpecialityTroopDuty'
CREATE TABLE [dbo].[SpecialityTroopDuty] (
    [Specialities_ID] int  NOT NULL,
    [TroopDuties_ID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Activity'
ALTER TABLE [dbo].[Activity]
ADD CONSTRAINT [PK_Activity]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'BadRegistry'
ALTER TABLE [dbo].[BadRegistry]
ADD CONSTRAINT [PK_BadRegistry]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Deputy'
ALTER TABLE [dbo].[Deputy]
ADD CONSTRAINT [PK_Deputy]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'DriverLicense'
ALTER TABLE [dbo].[DriverLicense]
ADD CONSTRAINT [PK_DriverLicense]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'DutyForm'
ALTER TABLE [dbo].[DutyForm]
ADD CONSTRAINT [PK_DutyForm]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Education'
ALTER TABLE [dbo].[Education]
ADD CONSTRAINT [PK_Education]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Evolution'
ALTER TABLE [dbo].[Evolution]
ADD CONSTRAINT [PK_Evolution]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Marriage'
ALTER TABLE [dbo].[Marriage]
ADD CONSTRAINT [PK_Marriage]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Medicine'
ALTER TABLE [dbo].[Medicine]
ADD CONSTRAINT [PK_Medicine]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'MilitaryCard'
ALTER TABLE [dbo].[MilitaryCard]
ADD CONSTRAINT [PK_MilitaryCard]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'MilitaryCertificate'
ALTER TABLE [dbo].[MilitaryCertificate]
ADD CONSTRAINT [PK_MilitaryCertificate]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'MilitaryDistrict'
ALTER TABLE [dbo].[MilitaryDistrict]
ADD CONSTRAINT [PK_MilitaryDistrict]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Rank] in table 'MilitaryTitle'
ALTER TABLE [dbo].[MilitaryTitle]
ADD CONSTRAINT [PK_MilitaryTitle]
    PRIMARY KEY CLUSTERED ([Rank] ASC);
GO

-- Creating primary key on [ID] in table 'MilitaryUnit'
ALTER TABLE [dbo].[MilitaryUnit]
ADD CONSTRAINT [PK_MilitaryUnit]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'OrderSoldier'
ALTER TABLE [dbo].[OrderSoldier]
ADD CONSTRAINT [PK_OrderSoldier]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Parents'
ALTER TABLE [dbo].[Parents]
ADD CONSTRAINT [PK_Parents]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Passport'
ALTER TABLE [dbo].[Passport]
ADD CONSTRAINT [PK_Passport]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Permission'
ALTER TABLE [dbo].[Permission]
ADD CONSTRAINT [PK_Permission]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Phone'
ALTER TABLE [dbo].[Phone]
ADD CONSTRAINT [PK_Phone]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Railroad'
ALTER TABLE [dbo].[Railroad]
ADD CONSTRAINT [PK_Railroad]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Recruit'
ALTER TABLE [dbo].[Recruit]
ADD CONSTRAINT [PK_Recruit]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Speciality'
ALTER TABLE [dbo].[Speciality]
ADD CONSTRAINT [PK_Speciality]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Station'
ALTER TABLE [dbo].[Station]
ADD CONSTRAINT [PK_Station]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'TDT'
ALTER TABLE [dbo].[TDT]
ADD CONSTRAINT [PK_TDT]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Token'
ALTER TABLE [dbo].[Token]
ADD CONSTRAINT [PK_Token]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Troop'
ALTER TABLE [dbo].[Troop]
ADD CONSTRAINT [PK_Troop]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'TroopDuty'
ALTER TABLE [dbo].[TroopDuty]
ADD CONSTRAINT [PK_TroopDuty]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'MilitaryForces'
ALTER TABLE [dbo].[MilitaryForces]
ADD CONSTRAINT [PK_MilitaryForces]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'SportCategory'
ALTER TABLE [dbo].[SportCategory]
ADD CONSTRAINT [PK_SportCategory]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'SportType'
ALTER TABLE [dbo].[SportType]
ADD CONSTRAINT [PK_SportType]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'OrderWare'
ALTER TABLE [dbo].[OrderWare]
ADD CONSTRAINT [PK_OrderWare]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Specialities_ID], [TroopDuties_ID] in table 'SpecialityTroopDuty'
ALTER TABLE [dbo].[SpecialityTroopDuty]
ADD CONSTRAINT [PK_SpecialityTroopDuty]
    PRIMARY KEY NONCLUSTERED ([Specialities_ID], [TroopDuties_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MilitaryDistrict_ID] in table 'Station'
ALTER TABLE [dbo].[Station]
ADD CONSTRAINT [FK_MilitaryDistrictStation]
    FOREIGN KEY ([MilitaryDistrict_ID])
    REFERENCES [dbo].[MilitaryDistrict]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MilitaryDistrictStation'
CREATE INDEX [IX_FK_MilitaryDistrictStation]
ON [dbo].[Station]
    ([MilitaryDistrict_ID]);
GO

-- Creating foreign key on [Railroad_ID] in table 'Station'
ALTER TABLE [dbo].[Station]
ADD CONSTRAINT [FK_RailroadStation]
    FOREIGN KEY ([Railroad_ID])
    REFERENCES [dbo].[Railroad]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RailroadStation'
CREATE INDEX [IX_FK_RailroadStation]
ON [dbo].[Station]
    ([Railroad_ID]);
GO

-- Creating foreign key on [MilitaryUnit_ID] in table 'Phone'
ALTER TABLE [dbo].[Phone]
ADD CONSTRAINT [FK_PhoneMilitaryUnit]
    FOREIGN KEY ([MilitaryUnit_ID])
    REFERENCES [dbo].[MilitaryUnit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PhoneMilitaryUnit'
CREATE INDEX [IX_FK_PhoneMilitaryUnit]
ON [dbo].[Phone]
    ([MilitaryUnit_ID]);
GO

-- Creating foreign key on [MilitaryForces_ID] in table 'MilitaryUnit'
ALTER TABLE [dbo].[MilitaryUnit]
ADD CONSTRAINT [FK_MilitaryForcesMilitaryUnit]
    FOREIGN KEY ([MilitaryForces_ID])
    REFERENCES [dbo].[MilitaryForces]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MilitaryForcesMilitaryUnit'
CREATE INDEX [IX_FK_MilitaryForcesMilitaryUnit]
ON [dbo].[MilitaryUnit]
    ([MilitaryForces_ID]);
GO

-- Creating foreign key on [MilitaryTitle_Rank] in table 'MilitaryCertificate'
ALTER TABLE [dbo].[MilitaryCertificate]
ADD CONSTRAINT [FK_MilitaryTitleMilitaryCertificate]
    FOREIGN KEY ([MilitaryTitle_Rank])
    REFERENCES [dbo].[MilitaryTitle]
        ([Rank])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MilitaryTitleMilitaryCertificate'
CREATE INDEX [IX_FK_MilitaryTitleMilitaryCertificate]
ON [dbo].[MilitaryCertificate]
    ([MilitaryTitle_Rank]);
GO

-- Creating foreign key on [MilitaryUnit_ID] in table 'Deputy'
ALTER TABLE [dbo].[Deputy]
ADD CONSTRAINT [FK_MilitaryUnitDeputy]
    FOREIGN KEY ([MilitaryUnit_ID])
    REFERENCES [dbo].[MilitaryUnit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MilitaryUnitDeputy'
CREATE INDEX [IX_FK_MilitaryUnitDeputy]
ON [dbo].[Deputy]
    ([MilitaryUnit_ID]);
GO

-- Creating foreign key on [Deputy_ID] in table 'MilitaryCertificate'
ALTER TABLE [dbo].[MilitaryCertificate]
ADD CONSTRAINT [FK_DeputyMilitaryCertificate]
    FOREIGN KEY ([Deputy_ID])
    REFERENCES [dbo].[Deputy]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DeputyMilitaryCertificate'
CREATE INDEX [IX_FK_DeputyMilitaryCertificate]
ON [dbo].[MilitaryCertificate]
    ([Deputy_ID]);
GO

-- Creating foreign key on [Recruit_ID] in table 'Passport'
ALTER TABLE [dbo].[Passport]
ADD CONSTRAINT [FK_PassportRecruit]
    FOREIGN KEY ([Recruit_ID])
    REFERENCES [dbo].[Recruit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PassportRecruit'
CREATE INDEX [IX_FK_PassportRecruit]
ON [dbo].[Passport]
    ([Recruit_ID]);
GO

-- Creating foreign key on [Marriage_ID] in table 'Passport'
ALTER TABLE [dbo].[Passport]
ADD CONSTRAINT [FK_MarriagePassport]
    FOREIGN KEY ([Marriage_ID])
    REFERENCES [dbo].[Marriage]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MarriagePassport'
CREATE INDEX [IX_FK_MarriagePassport]
ON [dbo].[Passport]
    ([Marriage_ID]);
GO

-- Creating foreign key on [Troop_ID] in table 'Recruit'
ALTER TABLE [dbo].[Recruit]
ADD CONSTRAINT [FK_TroopRecruit]
    FOREIGN KEY ([Troop_ID])
    REFERENCES [dbo].[Troop]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TroopRecruit'
CREATE INDEX [IX_FK_TroopRecruit]
ON [dbo].[Recruit]
    ([Troop_ID]);
GO

-- Creating foreign key on [SportCategory_ID] in table 'Evolution'
ALTER TABLE [dbo].[Evolution]
ADD CONSTRAINT [FK_SportCategoryEvolution]
    FOREIGN KEY ([SportCategory_ID])
    REFERENCES [dbo].[SportCategory]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SportCategoryEvolution'
CREATE INDEX [IX_FK_SportCategoryEvolution]
ON [dbo].[Evolution]
    ([SportCategory_ID]);
GO

-- Creating foreign key on [SportType_ID] in table 'Evolution'
ALTER TABLE [dbo].[Evolution]
ADD CONSTRAINT [FK_SportTypeEvolution]
    FOREIGN KEY ([SportType_ID])
    REFERENCES [dbo].[SportType]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SportTypeEvolution'
CREATE INDEX [IX_FK_SportTypeEvolution]
ON [dbo].[Evolution]
    ([SportType_ID]);
GO

-- Creating foreign key on [Activity_ID] in table 'Evolution'
ALTER TABLE [dbo].[Evolution]
ADD CONSTRAINT [FK_ActivityEvolution]
    FOREIGN KEY ([Activity_ID])
    REFERENCES [dbo].[Activity]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ActivityEvolution'
CREATE INDEX [IX_FK_ActivityEvolution]
ON [dbo].[Evolution]
    ([Activity_ID]);
GO

-- Creating foreign key on [Education_ID] in table 'Evolution'
ALTER TABLE [dbo].[Evolution]
ADD CONSTRAINT [FK_EducationEvolution]
    FOREIGN KEY ([Education_ID])
    REFERENCES [dbo].[Education]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EducationEvolution'
CREATE INDEX [IX_FK_EducationEvolution]
ON [dbo].[Evolution]
    ([Education_ID]);
GO

-- Creating foreign key on [DutyForm_ID] in table 'Evolution'
ALTER TABLE [dbo].[Evolution]
ADD CONSTRAINT [FK_DutyFormEvolution]
    FOREIGN KEY ([DutyForm_ID])
    REFERENCES [dbo].[DutyForm]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DutyFormEvolution'
CREATE INDEX [IX_FK_DutyFormEvolution]
ON [dbo].[Evolution]
    ([DutyForm_ID]);
GO

-- Creating foreign key on [BadRegistry_ID] in table 'Evolution'
ALTER TABLE [dbo].[Evolution]
ADD CONSTRAINT [FK_BadRegistryEvolution]
    FOREIGN KEY ([BadRegistry_ID])
    REFERENCES [dbo].[BadRegistry]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BadRegistryEvolution'
CREATE INDEX [IX_FK_BadRegistryEvolution]
ON [dbo].[Evolution]
    ([BadRegistry_ID]);
GO

-- Creating foreign key on [Parents_ID] in table 'Evolution'
ALTER TABLE [dbo].[Evolution]
ADD CONSTRAINT [FK_ParentsEvolution]
    FOREIGN KEY ([Parents_ID])
    REFERENCES [dbo].[Parents]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ParentsEvolution'
CREATE INDEX [IX_FK_ParentsEvolution]
ON [dbo].[Evolution]
    ([Parents_ID]);
GO

-- Creating foreign key on [Speciality_ID] in table 'Evolution'
ALTER TABLE [dbo].[Evolution]
ADD CONSTRAINT [FK_SpecialityEvolution]
    FOREIGN KEY ([Speciality_ID])
    REFERENCES [dbo].[Speciality]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SpecialityEvolution'
CREATE INDEX [IX_FK_SpecialityEvolution]
ON [dbo].[Evolution]
    ([Speciality_ID]);
GO

-- Creating foreign key on [Recruit_ID] in table 'Medicine'
ALTER TABLE [dbo].[Medicine]
ADD CONSTRAINT [FK_MedicineRecruit]
    FOREIGN KEY ([Recruit_ID])
    REFERENCES [dbo].[Recruit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MedicineRecruit'
CREATE INDEX [IX_FK_MedicineRecruit]
ON [dbo].[Medicine]
    ([Recruit_ID]);
GO

-- Creating foreign key on [TDT_ID] in table 'Medicine'
ALTER TABLE [dbo].[Medicine]
ADD CONSTRAINT [FK_TDTMedicine]
    FOREIGN KEY ([TDT_ID])
    REFERENCES [dbo].[TDT]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TDTMedicine'
CREATE INDEX [IX_FK_TDTMedicine]
ON [dbo].[Medicine]
    ([TDT_ID]);
GO

-- Creating foreign key on [Recruit_ID] in table 'DriverLicense'
ALTER TABLE [dbo].[DriverLicense]
ADD CONSTRAINT [FK_DriverLicenseRecruit]
    FOREIGN KEY ([Recruit_ID])
    REFERENCES [dbo].[Recruit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DriverLicenseRecruit'
CREATE INDEX [IX_FK_DriverLicenseRecruit]
ON [dbo].[DriverLicense]
    ([Recruit_ID]);
GO

-- Creating foreign key on [Recruit_ID] in table 'MilitaryCard'
ALTER TABLE [dbo].[MilitaryCard]
ADD CONSTRAINT [FK_MilitaryCardRecruit]
    FOREIGN KEY ([Recruit_ID])
    REFERENCES [dbo].[Recruit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MilitaryCardRecruit'
CREATE INDEX [IX_FK_MilitaryCardRecruit]
ON [dbo].[MilitaryCard]
    ([Recruit_ID]);
GO

-- Creating foreign key on [Token_ID] in table 'Recruit'
ALTER TABLE [dbo].[Recruit]
ADD CONSTRAINT [FK_TokenRecruit]
    FOREIGN KEY ([Token_ID])
    REFERENCES [dbo].[Token]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TokenRecruit'
CREATE INDEX [IX_FK_TokenRecruit]
ON [dbo].[Recruit]
    ([Token_ID]);
GO

-- Creating foreign key on [Permission_ID] in table 'Recruit'
ALTER TABLE [dbo].[Recruit]
ADD CONSTRAINT [FK_PermissionRecruit]
    FOREIGN KEY ([Permission_ID])
    REFERENCES [dbo].[Permission]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PermissionRecruit'
CREATE INDEX [IX_FK_PermissionRecruit]
ON [dbo].[Recruit]
    ([Permission_ID]);
GO

-- Creating foreign key on [OrderSoldier_ID] in table 'Troop'
ALTER TABLE [dbo].[Troop]
ADD CONSTRAINT [FK_OrderSoldierTroop]
    FOREIGN KEY ([OrderSoldier_ID])
    REFERENCES [dbo].[OrderSoldier]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderSoldierTroop'
CREATE INDEX [IX_FK_OrderSoldierTroop]
ON [dbo].[Troop]
    ([OrderSoldier_ID]);
GO

-- Creating foreign key on [Troop_ID] in table 'OrderWare'
ALTER TABLE [dbo].[OrderWare]
ADD CONSTRAINT [FK_OrderWareTroop]
    FOREIGN KEY ([Troop_ID])
    REFERENCES [dbo].[Troop]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderWareTroop'
CREATE INDEX [IX_FK_OrderWareTroop]
ON [dbo].[OrderWare]
    ([Troop_ID]);
GO

-- Creating foreign key on [MilitaryUnit_ID] in table 'Troop'
ALTER TABLE [dbo].[Troop]
ADD CONSTRAINT [FK_MilitaryUnitTroop]
    FOREIGN KEY ([MilitaryUnit_ID])
    REFERENCES [dbo].[MilitaryUnit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MilitaryUnitTroop'
CREATE INDEX [IX_FK_MilitaryUnitTroop]
ON [dbo].[Troop]
    ([MilitaryUnit_ID]);
GO

-- Creating foreign key on [Deputy_ID] in table 'Troop'
ALTER TABLE [dbo].[Troop]
ADD CONSTRAINT [FK_DeputyTroop]
    FOREIGN KEY ([Deputy_ID])
    REFERENCES [dbo].[Deputy]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DeputyTroop'
CREATE INDEX [IX_FK_DeputyTroop]
ON [dbo].[Troop]
    ([Deputy_ID]);
GO

-- Creating foreign key on [DutyForm_ID] in table 'TroopDuty'
ALTER TABLE [dbo].[TroopDuty]
ADD CONSTRAINT [FK_DutyFormTroopDuty]
    FOREIGN KEY ([DutyForm_ID])
    REFERENCES [dbo].[DutyForm]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DutyFormTroopDuty'
CREATE INDEX [IX_FK_DutyFormTroopDuty]
ON [dbo].[TroopDuty]
    ([DutyForm_ID]);
GO

-- Creating foreign key on [Specialities_ID] in table 'SpecialityTroopDuty'
ALTER TABLE [dbo].[SpecialityTroopDuty]
ADD CONSTRAINT [FK_SpecialityTroopDuty_Speciality]
    FOREIGN KEY ([Specialities_ID])
    REFERENCES [dbo].[Speciality]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TroopDuties_ID] in table 'SpecialityTroopDuty'
ALTER TABLE [dbo].[SpecialityTroopDuty]
ADD CONSTRAINT [FK_SpecialityTroopDuty_TroopDuty]
    FOREIGN KEY ([TroopDuties_ID])
    REFERENCES [dbo].[TroopDuty]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SpecialityTroopDuty_TroopDuty'
CREATE INDEX [IX_FK_SpecialityTroopDuty_TroopDuty]
ON [dbo].[SpecialityTroopDuty]
    ([TroopDuties_ID]);
GO

-- Creating foreign key on [Recruit_ID] in table 'Evolution'
ALTER TABLE [dbo].[Evolution]
ADD CONSTRAINT [FK_EvolutionRecruit]
    FOREIGN KEY ([Recruit_ID])
    REFERENCES [dbo].[Recruit]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EvolutionRecruit'
CREATE INDEX [IX_FK_EvolutionRecruit]
ON [dbo].[Evolution]
    ([Recruit_ID]);
GO

-- Creating foreign key on [Station_ID] in table 'Troop'
ALTER TABLE [dbo].[Troop]
ADD CONSTRAINT [FK_StationTroop]
    FOREIGN KEY ([Station_ID])
    REFERENCES [dbo].[Station]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StationTroop'
CREATE INDEX [IX_FK_StationTroop]
ON [dbo].[Troop]
    ([Station_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------