/*
|--------------------------------------------------------------------------
| Procedure to see all features for products including bug fixes.
|--------------------------------------------------------------------------
|
| @params none
| Excute procedure by calling: EXEC seeAllFeatures;
|
 */

CREATE PROCEDURE seeAllFeatures
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

/*
|--------------------------------------------------------------------------
| Procedure to insert a new country.
|--------------------------------------------------------------------------
| @params @newCountry (VARCHAR(255))
| Excute procedure by calling: EXEC insertNewCountry @newCountry='Russia';
|
 */

CREATE PROCEDURE insertNewCountry
    @newCountry as VARCHAR(255)
AS
BEGIN
    DECLARE @msg varchar(50)
    IF EXISTS (
        SELECT country 
        FROM countries 
        WHERE country=@newCountry
    )
        BEGIN
            SET @msg = 'The Country ' + @newCountry + ' alredy exists in the table.'
            RAISERROR (@msg,10, 1)
        END
    ELSE
        BEGIN
            INSERT INTO countries VALUES (@newCountry);
        END
END

/*
|--------------------------------------------------------------------------
| Procedure to insert a new customer from a company.
|--------------------------------------------------------------------------
|
| @params: @first_name VARCHAR(50), @last_name VARCHAR(50), @company VARCHAR(50)
| Execute procedure by calling: insertNewCustomerAndCompany @first_name='Mike', @last_name='Smith', @company='ABC Record';
 */

CREATE PROCEDURE insertNewCustomerAndCompany
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

/*
|--------------------------------------------------------------------------
| Procedure to update a product version.
|--------------------------------------------------------------------------
|
| @params: @product, @platformID, @version, @newVersionNumber
| Execute procedure by calling: updateProductVersion @product_id='productID', @platform_id='platformID', @version='version', @newVersionNumber='newVersionNumber'
 */

 CREATE PROCEDURE updateProductVersion
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


/*
|--------------------------------------------------------------------------
| Procedure to see downloads for a specific version.
|--------------------------------------------------------------------------
|
| @params: @product, @version
| Execute procedure by calling: EXEC downloadsForTheMonth @productID=1, @version=2.1, @month=6 or 3
| This will return PRODUCT, VERSION, AND DOWNLOADS
 */

CREATE PROCEDURE downloadsForTheMonth
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

/*
|--------------------------------------------------------------------------
| Procedure to see features for releases and versions of product.
|--------------------------------------------------------------------------
|
| Execute procedure by calling: EXEC featuresForReleases;
| 
 */


CREATE PROCEDURE featuresForReleases
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

