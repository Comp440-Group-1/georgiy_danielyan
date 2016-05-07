/*
|--------------------------------------------------------------------------
| Product, Release, and Versioning Related Tables
|--------------------------------------------------------------------------
|
| Tables: products, platforms, versions, featureTypes, features, releaseTypes , releases
| Pivot Tables: version_feature, release_feature, version_release
|
 */

CREATE TABLE products (
    id INT IDENTITY(1,1) NOT NULL     ,
    name VARCHAR(50) NOT NULL         ,
    description VARCHAR(255) NOT NULL ,
    PRIMARY KEY (id)
);

CREATE TABLE platforms (
    id INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(50)             ,
    PRIMARY KEY (id)
);

CREATE TABLE versions (
    id INT IDENTITY(1,1) NOT NULL                      ,
    platform_id INT NOT NULL                           ,
    product_id INT NOT NULL                            , 
    versionNumber VARCHAR(50)                          ,
    supported BIT DEFAULT 1                            ,
    PRIMARY KEY (id, platform_id)                      ,
    FOREIGN KEY (platform_id) REFERENCES platforms(id) ,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE featureTypes (
    id INT IDENTITY(1,1) NOT NULL,
    type VARCHAR(50)             ,
    PRIMARY KEY (id)
);

CREATE TABLE features (
    id INT IDENTITY(1,1) NOT NULL                    ,
    description VARCHAR(255) NOT NULL                ,
    featureType_id INT NOT NULL                      ,
    deprecated BIT DEFAULT 0                         ,
    PRIMARY KEY (id)                                 ,
    FOREIGN KEY (featureType_id) REFERENCES featureTypes(id)
);

CREATE TABLE version_feature (
    version_id INT NOT NULL                                                   ,
    platform_id INT NOT NULL                                                  ,
    feature_id INT NOT NULL                                                   ,
    FOREIGN KEY (version_id, platform_id) REFERENCES versions(id, platform_id),
    FOREIGN KEY (feature_id) REFERENCES features(id)
);

CREATE TABLE releaseTypes (
    id INT IDENTITY(1,1) NOT NULL,
    type VARCHAR(50) NOT NULL    ,
    PRIMARY KEY (id)
);

CREATE TABLE releases (
    id INT IDENTITY(1,1) NOT NULL                                             ,
    platform_id INT NOT NULL                                                  ,
    version_id INT NOT NULL                                                   ,
    releaseNumber VARCHAR(255) NOT NULL                                       ,
    releaseType_id INT NOT NULL                                               ,
    released_at DATE                                                          ,
    PRIMARY KEY (id)                                                          ,
    FOREIGN KEY (version_id, platform_id) REFERENCES versions(id, platform_id),
    FOREIGN KEY (releaseType_id) REFERENCES releaseTypes(id)
);

CREATE TABLE release_feature (
    release_id INT NOT NULL                          ,
    feature_id INT NOT NULL                          , 
    FOREIGN KEY (release_id) REFERENCES releases(id) ,
    FOREIGN KEY (feature_id) REFERENCES features(id) ,
);

CREATE TABLE version_release (
    version_id INT NOT NULL                                                   ,
    platform_id INT NOT NULL                                                  ,
    release_id INT NOT NULL                                                   , 
    FOREIGN KEY (version_id, platform_id) REFERENCES versions(id, platform_id),
    FOREIGN KEY (release_id) REFERENCES releases(id)
);

/*
|--------------------------------------------------------------------------
| Source Control Related Tables
|--------------------------------------------------------------------------
|
| Tables: branches, commits
| Pivot Tables: release_branch
 */

CREATE TABLE branches (
    id INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL    ,
    iteration_week VARCHAR(255)  ,
    PRIMARY KEY (id)
);

CREATE TABLE commits (
    id INT IDENTITY(1,1) NOT NULL     ,
    description VARCHAR(255) NOT NULL ,
    branch_id INT NOT NULL            ,
    PRIMARY KEY (id)                  ,
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

CREATE TABLE release_branch (
    release_id INT NOT NULL , 
    branch_id INT NOT NULL , 
    PRIMARY KEY (release_id, branch_id),
    FOREIGN KEY (release_id) REFERENCES releases(id),
    FOREIGN KEY (branch_id)  REFERENCES branches(id)
);

/*
|--------------------------------------------------------------------------
| Customer/Company Related Tables 
|--------------------------------------------------------------------------
|
| Tables: countries, addresses, emails, phoneNumbers, companies, customers
| Pivot Tables: customer_company
|
*/

CREATE TABLE countries (
    id INT IDENTITY(1,1) NOT NULL ,
    country VARCHAR(255) NOT NULL ,
    PRIMARY KEY (id)
);

CREATE TABLE addresses (
    company_id INT NOT NULL                            ,
    addressLine1 VARCHAR(255) NOT NULL                 ,
    addressLine2 VARCHAR(50)                           ,
    zip VARCHAR(50)                                    ,
    city VARCHAR(50) NOT NULL                          ,
    state VARCHAR(50)                                  ,
    country_id INT NOT NULL                            ,
    PRIMARY KEY (company_id)                           ,
    FOREIGN KEY (country_id) REFERENCES countries(id)  ,
);

CREATE TABLE emails (
    customer_id INT  NOT NULL    ,
    email VARCHAR(255) NOT NULL  ,
    PRIMARY KEY (customer_id)
);

CREATE TABLE phoneNumbers (
    customer_id INT  NOT NULL       ,
    phoneNumber VARCHAR(50) NOT NULL,
    type VARCHAR(50)                ,
    PRIMARY KEY (customer_id)
);

CREATE TABLE companies (
    id INT IDENTITY(1,1) NOT NULL ,
    name VARCHAR(50) NOT NULL     ,
    PRIMARY KEY (id)              ,
);

CREATE TABLE customers (
    id INT IDENTITY(1,1) NOT NULL   ,
    first_name varchar(50) NOT NULL ,
    last_name varchar(50) NOT NULL  ,
    PRIMARY KEY (id)                ,
);

CREATE TABLE customer_company (
    customer_id INT NOT NULL                            ,
    company_id INT NOT NULL                             ,
    PRIMARY KEY (customer_id, company_id)               ,
    FOREIGN KEY (customer_id) REFERENCES customers(id)  ,
    FOREIGN KEY (company_id) REFERENCES companies(id)
);

/*
|--------------------------------------------------------------------------
| Customer Downloads Related Tables
|--------------------------------------------------------------------------
|
| Tables: downloads, links
|
 */

CREATE TABLE links (
    id INT IDENTITY(1,1) NOT NULL                                              ,
    link VARCHAR(255)                                                          ,
    product_id INT NOT NULL                                                    ,
    version_id INT NOT NULL                                                    ,
    platform_id INT NOT NULL                                                   ,
    PRIMARY KEY (id)                                                           ,
    FOREIGN KEY (product_id) REFERENCES products(id)                           ,
    FOREIGN KEY (version_id, platform_id) REFERENCES versions(id, platform_id) ,
);

CREATE TABLE downloads (
    id INT IDENTITY(1,1) NOT NULL                      ,
    link_id INT NOT NULL                               ,
    customer_id INT NOT NULL                           ,
    downloaded_at DATE NOT NULL                   ,
    PRIMARY KEY (id)                                   ,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ,
    FOREIGN KEY (link_id) REFERENCES links(id)         ,
);
