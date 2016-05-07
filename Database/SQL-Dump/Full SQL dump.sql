/*
 Navicat Premium Data Transfer

 Source Server         : project
 Source Server Type    : SQL Server
 Source Server Version : 11005058
 Source Host           : 130.166.41.222\CSDB440
 Source Database       : s16guest28
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 11005058
 File Encoding         : utf-8

 Date: 05/07/2016 00:05:51 AM
*/

-- ----------------------------
--  Table structure for addresses
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[addresses]') AND type IN ('U'))
	DROP TABLE [dbo].[addresses]
GO
CREATE TABLE [dbo].[addresses] (
	[company_id] int NOT NULL,
	[addressLine1] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[addressLine2] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zip] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[city] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[state] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[country_id] int NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for branches
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[branches]') AND type IN ('U'))
	DROP TABLE [dbo].[branches]
GO
CREATE TABLE [dbo].[branches] (
	[id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[iteration_week] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for commits
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[commits]') AND type IN ('U'))
	DROP TABLE [dbo].[commits]
GO
CREATE TABLE [dbo].[commits] (
	[id] int IDENTITY(1,1) NOT NULL,
	[description] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[branch_id] int NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for companies
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[companies]') AND type IN ('U'))
	DROP TABLE [dbo].[companies]
GO
CREATE TABLE [dbo].[companies] (
	[id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for countries
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[countries]') AND type IN ('U'))
	DROP TABLE [dbo].[countries]
GO
CREATE TABLE [dbo].[countries] (
	[id] int IDENTITY(1,1) NOT NULL,
	[country] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for customer_company
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[customer_company]') AND type IN ('U'))
	DROP TABLE [dbo].[customer_company]
GO
CREATE TABLE [dbo].[customer_company] (
	[customer_id] int NOT NULL,
	[company_id] int NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for customers
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[customers]') AND type IN ('U'))
	DROP TABLE [dbo].[customers]
GO
CREATE TABLE [dbo].[customers] (
	[id] int IDENTITY(1,1) NOT NULL,
	[first_name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for downloads
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[downloads]') AND type IN ('U'))
	DROP TABLE [dbo].[downloads]
GO
CREATE TABLE [dbo].[downloads] (
	[id] int IDENTITY(1,1) NOT NULL,
	[link_id] int NOT NULL,
	[customer_id] int NOT NULL,
	[downloaded_at] date NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for emails
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[emails]') AND type IN ('U'))
	DROP TABLE [dbo].[emails]
GO
CREATE TABLE [dbo].[emails] (
	[customer_id] int NOT NULL,
	[email] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for features
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[features]') AND type IN ('U'))
	DROP TABLE [dbo].[features]
GO
CREATE TABLE [dbo].[features] (
	[id] int IDENTITY(1,1) NOT NULL,
	[description] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[featureType_id] int NOT NULL,
	[deprecated] bit NULL DEFAULT ((0))
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for featureTypes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[featureTypes]') AND type IN ('U'))
	DROP TABLE [dbo].[featureTypes]
GO
CREATE TABLE [dbo].[featureTypes] (
	[id] int IDENTITY(1,1) NOT NULL,
	[type] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for links
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[links]') AND type IN ('U'))
	DROP TABLE [dbo].[links]
GO
CREATE TABLE [dbo].[links] (
	[id] int IDENTITY(1,1) NOT NULL,
	[link] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[product_id] int NOT NULL,
	[version_id] int NOT NULL,
	[platform_id] int NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for phoneNumbers
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[phoneNumbers]') AND type IN ('U'))
	DROP TABLE [dbo].[phoneNumbers]
GO
CREATE TABLE [dbo].[phoneNumbers] (
	[customer_id] int NOT NULL,
	[phoneNumber] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[type] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for platforms
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[platforms]') AND type IN ('U'))
	DROP TABLE [dbo].[platforms]
GO
CREATE TABLE [dbo].[platforms] (
	[id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for products
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[products]') AND type IN ('U'))
	DROP TABLE [dbo].[products]
GO
CREATE TABLE [dbo].[products] (
	[id] int IDENTITY(1,1) NOT NULL,
	[name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for release_branch
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[release_branch]') AND type IN ('U'))
	DROP TABLE [dbo].[release_branch]
GO
CREATE TABLE [dbo].[release_branch] (
	[release_id] int NOT NULL,
	[branch_id] int NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for release_feature
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[release_feature]') AND type IN ('U'))
	DROP TABLE [dbo].[release_feature]
GO
CREATE TABLE [dbo].[release_feature] (
	[release_id] int NOT NULL,
	[feature_id] int NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for releases
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[releases]') AND type IN ('U'))
	DROP TABLE [dbo].[releases]
GO
CREATE TABLE [dbo].[releases] (
	[id] int IDENTITY(1,1) NOT NULL,
	[platform_id] int NOT NULL,
	[version_id] int NOT NULL,
	[releaseNumber] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[releaseType_id] int NOT NULL,
	[released_at] date NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for releaseTypes
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[releaseTypes]') AND type IN ('U'))
	DROP TABLE [dbo].[releaseTypes]
GO
CREATE TABLE [dbo].[releaseTypes] (
	[id] int IDENTITY(1,1) NOT NULL,
	[type] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for sysdiagrams
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[sysdiagrams]') AND type IN ('U'))
	DROP TABLE [dbo].[sysdiagrams]
GO
CREATE TABLE [dbo].[sysdiagrams] (
	[name] sysname NOT NULL,
	[principal_id] int NOT NULL,
	[diagram_id] int IDENTITY(1,1) NOT NULL,
	[version] int NULL,
	[definition] varbinary(max) NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for version_feature
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[version_feature]') AND type IN ('U'))
	DROP TABLE [dbo].[version_feature]
GO
CREATE TABLE [dbo].[version_feature] (
	[version_id] int NOT NULL,
	[platform_id] int NOT NULL,
	[feature_id] int NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for version_release
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[version_release]') AND type IN ('U'))
	DROP TABLE [dbo].[version_release]
GO
CREATE TABLE [dbo].[version_release] (
	[version_id] int NOT NULL,
	[platform_id] int NOT NULL,
	[release_id] int NOT NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for versions
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[versions]') AND type IN ('U'))
	DROP TABLE [dbo].[versions]
GO
CREATE TABLE [dbo].[versions] (
	[id] int IDENTITY(1,1) NOT NULL,
	[platform_id] int NOT NULL,
	[product_id] int NOT NULL,
	[versionNumber] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[supported] bit NULL DEFAULT ((1))
)
ON [PRIMARY]
GO

-- ----------------------------
--  Procedure structure for seeAllFeatures
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[seeAllFeatures]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[seeAllFeatures]
GO
CREATE PROCEDURE [dbo].[seeAllFeatures] 
AS
BEGIN
    SELECT
        products.name Product,
        features.description Feature_name,
        featureTypes.type Feature_type
    FROM products
        JOIN versions
            ON products.id=versions.product_id
        JOIN version_feature
            ON versions.id=version_feature.version_id
        JOIN features
            ON version_feature.feature_id=features.id
        JOIN featureTypes
            ON features.featureType_id=featureTypes.id;
END
GO

-- ----------------------------
--  Procedure structure for insertNewCountry
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[insertNewCountry]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[insertNewCountry]
GO
CREATE PROCEDURE [dbo].[insertNewCountry] 
    @newCountry as VARCHAR(255)
AS
BEGIN
    DECLARE @msg varchar(50)
    IF EXISTS (SELECT country FROM countries WHERE country=@newCountry)
		BEGIN
       		SET @msg = 'The country ' + @newCountry + ' alredy exists in the table.'
       		RAISERROR (@msg,10, 1)
		END
    ELSE
		BEGIN
       		INSERT INTO countries VALUES (@newCountry);
		END
END
GO

-- ----------------------------
--  Procedure structure for insertNewCustomerAndCompany
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[insertNewCustomerAndCompany]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[insertNewCustomerAndCompany]
GO
CREATE PROCEDURE [dbo].[insertNewCustomerAndCompany] 
    @first_name as VARCHAR(50),
    @last_name as VARCHAR(50),
    @company as VARCHAR(50)
AS
BEGIN
    DECLARE @msg VARCHAR(100)
    DECLARE @customer_id INT
    DECLARE @company_id INT

    IF EXISTS (
        SELECT 
            customers.first_name, 
            customers.last_name,
            companies.name
        FROM customers
            JOIN customer_company
                ON customers.id=customer_company.customer_id
            JOIN companies
                ON customer_company.company_id=companies.id
        WHERE customers.first_name=@first_name 
        AND customers.last_name=@last_name
        AND companies.name=@company
    )
        BEGIN
            SET @msg = 'Customer ' + @first_name + ' ' + @last_name + ' from ' + @company + ' already exists.'
            RAISERROR (@msg,10, 1)
        END
    ELSE
        BEGIN
            IF NOT EXISTS(
                SELECT 
                    customers.first_name, 
                    customers.last_name 
                FROM customers 
                WHERE customers.first_name=@first_name AND customers.last_name=@last_name
            )
                BEGIN
                    INSERT INTO customers (first_name, last_name) VALUES (@first_name, @last_name);
                END
        END
        BEGIN
            IF NOT EXISTS (
                SELECT companies.name 
                FROM companies
                WHERE companies.name=@company
            )
                BEGIN
                    INSERT INTO companies (name) VALUES (@company);
                END
            SELECT @customer_id = id FROM customers WHERE first_name=@first_name AND last_name=@last_name;
            SELECT @company_id = id FROM companies WHERE name=@company;
            INSERT INTO customer_company (customer_id, company_id) VALUES (@customer_id, @company_id);
        END
END
GO

-- ----------------------------
--  Procedure structure for updateProductVersion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[updateProductVersion]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[updateProductVersion]
GO
CREATE PROCEDURE [dbo].[updateProductVersion] 
    @productID as VARCHAR(50),
    @platformID as VARCHAR(50),
    @version as VARCHAR(50),
    @newVersionNumber as VARCHAR(50)
 AS
 BEGIN
    DECLARE @msg VARCHAR(100)

    IF NOT EXISTS (
        SELECT * 
        FROM versions 
        WHERE product_id=@productID AND platform_id=@platformID AND versionNumber=@version
    )
        BEGIN
            SET @msg = 'Could not locate that version and platform for product'
            RAISERROR (@msg,10, 1)
        END
    ELSE
        BEGIN
            UPDATE versions
            SET versionNumber=@newVersionNumber
            WHERE product_id=@productID 
            AND platform_id=@platformID 
            AND versionNumber=@version;
        END
END
GO

-- ----------------------------
--  Procedure structure for downloadsForTheMonth
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[downloadsForTheMonth]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[downloadsForTheMonth]
GO
CREATE PROCEDURE [dbo].[downloadsForTheMonth] 
    @productID as VARCHAR(50),
    @version as VARCHAR(50),
    @month as INT
AS
BEGIN
    SELECT
        products.name as Product,
        versions.versionNumber as Version,
        Count(downloads.id) as Downloads
        FROM products
            JOIN versions
                ON products.id=versions.product_id
            JOIN links
                ON versions.id=links.version_id 
            JOIN downloads
                ON links.id=downloads.link_id
        WHERE links.product_id=@productID
        AND versions.versionNumber=@version
        AND MONTH(downloads.downloaded_at)=@month
        GROUP BY versionNumbeR, products.name;
END
GO

-- ----------------------------
--  Procedure structure for featuresForReleases
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[featuresForReleases]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo].[featuresForReleases]
GO
CREATE PROCEDURE [dbo].[featuresForReleases] 
AS
BEGIN
    SELECT
        products.name,
        platforms.name,
        versions.versionNumber,
        releases.releaseNumber,
        count(features.id) as Features,
        featureTypes.type as Type
    FROM
    products
        JOIN versions
            ON versions.product_id=products.id
        JOIN platforms
            ON versions.platform_id=platforms.id
        JOIN version_release
            ON platforms.id=version_release.platform_id
        JOIN releases
            ON version_release.release_id=releases.id
        JOIN release_feature
            ON releases.id=release_feature.release_id
        JOIN features
            ON release_feature.feature_id=features.id
        JOIN featureTypes
            ON features.featureType_id=featureTypes.id
    GROUP BY products.name, platforms.name, versions.versionNumber, releases.releaseNumber, featureTypes.type;
END
GO


-- ----------------------------
--  Primary key structure for table addresses
-- ----------------------------
ALTER TABLE [dbo].[addresses] ADD
	CONSTRAINT [PK__addresse__3E267235B800C2C2] PRIMARY KEY CLUSTERED ([company_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table branches
-- ----------------------------
ALTER TABLE [dbo].[branches] ADD
	CONSTRAINT [PK__branches__3213E83F3C65FEC4] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table commits
-- ----------------------------
ALTER TABLE [dbo].[commits] ADD
	CONSTRAINT [PK__commits__3213E83F146750CF] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table companies
-- ----------------------------
ALTER TABLE [dbo].[companies] ADD
	CONSTRAINT [PK__companie__3213E83FF6A1CD30] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table countries
-- ----------------------------
ALTER TABLE [dbo].[countries] ADD
	CONSTRAINT [PK__countrie__3213E83FE6043F84] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table customer_company
-- ----------------------------
ALTER TABLE [dbo].[customer_company] ADD
	CONSTRAINT [PK__customer__8E87ACA664F047EB] PRIMARY KEY CLUSTERED ([customer_id],[company_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table customers
-- ----------------------------
ALTER TABLE [dbo].[customers] ADD
	CONSTRAINT [PK__customer__3213E83F41A2FED5] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table downloads
-- ----------------------------
ALTER TABLE [dbo].[downloads] ADD
	CONSTRAINT [PK__download__3213E83F2C5E4417] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table emails
-- ----------------------------
ALTER TABLE [dbo].[emails] ADD
	CONSTRAINT [PK__emails__CD65CB8556CDECF6] PRIMARY KEY CLUSTERED ([customer_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table features
-- ----------------------------
ALTER TABLE [dbo].[features] ADD
	CONSTRAINT [PK__features__3213E83F9BFACA77] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table featureTypes
-- ----------------------------
ALTER TABLE [dbo].[featureTypes] ADD
	CONSTRAINT [PK__featureT__3213E83FE90C9701] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table links
-- ----------------------------
ALTER TABLE [dbo].[links] ADD
	CONSTRAINT [PK__links__3213E83F32F26D3E] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table phoneNumbers
-- ----------------------------
ALTER TABLE [dbo].[phoneNumbers] ADD
	CONSTRAINT [PK__phoneNum__CD65CB85AC54C257] PRIMARY KEY CLUSTERED ([customer_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table platforms
-- ----------------------------
ALTER TABLE [dbo].[platforms] ADD
	CONSTRAINT [PK__platform__3213E83F3D68BFBD] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table products
-- ----------------------------
ALTER TABLE [dbo].[products] ADD
	CONSTRAINT [PK__products__3213E83F3DFB3302] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table release_branch
-- ----------------------------
ALTER TABLE [dbo].[release_branch] ADD
	CONSTRAINT [PK__release___810AFE0BB1F947E1] PRIMARY KEY CLUSTERED ([release_id],[branch_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table releases
-- ----------------------------
ALTER TABLE [dbo].[releases] ADD
	CONSTRAINT [PK__releases__3213E83F37142B2D] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table releaseTypes
-- ----------------------------
ALTER TABLE [dbo].[releaseTypes] ADD
	CONSTRAINT [PK__releaseT__3213E83F566403C4] PRIMARY KEY CLUSTERED ([id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Primary key structure for table sysdiagrams
-- ----------------------------
ALTER TABLE [dbo].[sysdiagrams] ADD
	CONSTRAINT [PK__sysdiagr__C2B05B617438BB60] PRIMARY KEY CLUSTERED ([diagram_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table sysdiagrams
-- ----------------------------
ALTER TABLE [dbo].[sysdiagrams] ADD
	CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED ([principal_id] ASC, [name] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table versions
-- ----------------------------
ALTER TABLE [dbo].[versions] ADD
	CONSTRAINT [PK__versions__E7EB1E5CA2162B1C] PRIMARY KEY CLUSTERED ([id],[platform_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Foreign keys structure for table addresses
-- ----------------------------
ALTER TABLE [dbo].[addresses] ADD
	CONSTRAINT [FK__addresses__count__1F04813B] FOREIGN KEY ([country_id]) REFERENCES [dbo].[countries] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table commits
-- ----------------------------
ALTER TABLE [dbo].[commits] ADD
	CONSTRAINT [FK__commits__branch___166F3B3A] FOREIGN KEY ([branch_id]) REFERENCES [dbo].[branches] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table customer_company
-- ----------------------------
ALTER TABLE [dbo].[customer_company] ADD
	CONSTRAINT [FK__customer___custo__29820FAE] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customers] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [FK__customer___compa__2A7633E7] FOREIGN KEY ([company_id]) REFERENCES [dbo].[companies] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table downloads
-- ----------------------------
ALTER TABLE [dbo].[downloads] ADD
	CONSTRAINT [FK__downloads__custo__31233176] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customers] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [FK__downloads__link___321755AF] FOREIGN KEY ([link_id]) REFERENCES [dbo].[links] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table features
-- ----------------------------
ALTER TABLE [dbo].[features] ADD
	CONSTRAINT [FK__features__featur__035C66C6] FOREIGN KEY ([featureType_id]) REFERENCES [dbo].[featureTypes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table links
-- ----------------------------
ALTER TABLE [dbo].[links] ADD
	CONSTRAINT [FK__links__product_i__2D52A092] FOREIGN KEY ([product_id]) REFERENCES [dbo].[products] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [FK__links__2E46C4CB] FOREIGN KEY ([version_id], [platform_id]) REFERENCES [dbo].[versions] ([id], [platform_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table release_branch
-- ----------------------------
ALTER TABLE [dbo].[release_branch] ADD
	CONSTRAINT [FK__release_b__relea__194BA7E5] FOREIGN KEY ([release_id]) REFERENCES [dbo].[releases] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [FK__release_b__branc__1A3FCC1E] FOREIGN KEY ([branch_id]) REFERENCES [dbo].[branches] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table release_feature
-- ----------------------------
ALTER TABLE [dbo].[release_feature] ADD
	CONSTRAINT [FK__release_f__relea__0DD9F539] FOREIGN KEY ([release_id]) REFERENCES [dbo].[releases] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [FK__release_f__featu__0ECE1972] FOREIGN KEY ([feature_id]) REFERENCES [dbo].[features] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table releases
-- ----------------------------
ALTER TABLE [dbo].[releases] ADD
	CONSTRAINT [FK__releases__0AFD888E] FOREIGN KEY ([version_id], [platform_id]) REFERENCES [dbo].[versions] ([id], [platform_id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [FK__releases__releas__0BF1ACC7] FOREIGN KEY ([releaseType_id]) REFERENCES [dbo].[releaseTypes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table version_feature
-- ----------------------------
ALTER TABLE [dbo].[version_feature] ADD
	CONSTRAINT [FK__version_feature__0544AF38] FOREIGN KEY ([version_id], [platform_id]) REFERENCES [dbo].[versions] ([id], [platform_id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [FK__version_f__featu__0638D371] FOREIGN KEY ([feature_id]) REFERENCES [dbo].[features] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table version_release
-- ----------------------------
ALTER TABLE [dbo].[version_release] ADD
	CONSTRAINT [FK__version_release__10B661E4] FOREIGN KEY ([version_id], [platform_id]) REFERENCES [dbo].[versions] ([id], [platform_id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [FK__version_r__relea__11AA861D] FOREIGN KEY ([release_id]) REFERENCES [dbo].[releases] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table versions
-- ----------------------------
ALTER TABLE [dbo].[versions] ADD
	CONSTRAINT [FK__versions__platfo__7CAF6937] FOREIGN KEY ([platform_id]) REFERENCES [dbo].[platforms] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [FK__versions__produc__7DA38D70] FOREIGN KEY ([product_id]) REFERENCES [dbo].[products] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Options for table addresses
-- ----------------------------
ALTER TABLE [dbo].[addresses] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table branches
-- ----------------------------
ALTER TABLE [dbo].[branches] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[branches]', RESEED, 1)
GO

-- ----------------------------
--  Options for table commits
-- ----------------------------
ALTER TABLE [dbo].[commits] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[commits]', RESEED, 1)
GO

-- ----------------------------
--  Options for table companies
-- ----------------------------
ALTER TABLE [dbo].[companies] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[companies]', RESEED, 1)
GO

-- ----------------------------
--  Options for table countries
-- ----------------------------
ALTER TABLE [dbo].[countries] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[countries]', RESEED, 1)
GO

-- ----------------------------
--  Options for table customer_company
-- ----------------------------
ALTER TABLE [dbo].[customer_company] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table customers
-- ----------------------------
ALTER TABLE [dbo].[customers] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[customers]', RESEED, 1)
GO

-- ----------------------------
--  Options for table downloads
-- ----------------------------
ALTER TABLE [dbo].[downloads] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[downloads]', RESEED, 1)
GO

-- ----------------------------
--  Options for table emails
-- ----------------------------
ALTER TABLE [dbo].[emails] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table features
-- ----------------------------
ALTER TABLE [dbo].[features] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[features]', RESEED, 1)
GO

-- ----------------------------
--  Options for table featureTypes
-- ----------------------------
ALTER TABLE [dbo].[featureTypes] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[featureTypes]', RESEED, 1)
GO

-- ----------------------------
--  Options for table links
-- ----------------------------
ALTER TABLE [dbo].[links] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[links]', RESEED, 1)
GO

-- ----------------------------
--  Options for table phoneNumbers
-- ----------------------------
ALTER TABLE [dbo].[phoneNumbers] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table platforms
-- ----------------------------
ALTER TABLE [dbo].[platforms] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[platforms]', RESEED, 1)
GO

-- ----------------------------
--  Options for table products
-- ----------------------------
ALTER TABLE [dbo].[products] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[products]', RESEED, 1)
GO

-- ----------------------------
--  Options for table release_branch
-- ----------------------------
ALTER TABLE [dbo].[release_branch] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table release_feature
-- ----------------------------
ALTER TABLE [dbo].[release_feature] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table releases
-- ----------------------------
ALTER TABLE [dbo].[releases] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[releases]', RESEED, 1)
GO

-- ----------------------------
--  Options for table releaseTypes
-- ----------------------------
ALTER TABLE [dbo].[releaseTypes] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[releaseTypes]', RESEED, 1)
GO

-- ----------------------------
--  Options for table sysdiagrams
-- ----------------------------
ALTER TABLE [dbo].[sysdiagrams] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[sysdiagrams]', RESEED, 1)
GO

-- ----------------------------
--  Options for table version_feature
-- ----------------------------
ALTER TABLE [dbo].[version_feature] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table version_release
-- ----------------------------
ALTER TABLE [dbo].[version_release] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table versions
-- ----------------------------
ALTER TABLE [dbo].[versions] SET (LOCK_ESCALATION = TABLE)
GO
DBCC CHECKIDENT ('[dbo].[versions]', RESEED, 1)
GO

