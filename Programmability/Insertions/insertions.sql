INSERT INTO products  (name , description) 
VALUES ('EHR SYSTEM', 'Electronic Health Records System');

INSERT INTO platforms (name)
VALUES ('Windows'), ('Linux'), ('OSX');

INSERT INTO releaseTypes (type) 
VALUES ('New Product Release'), ('Bug-Fix Release');

INSERT INTO featureTypes (type) 
VALUES ('New Feature'), ('Removed Feature'), ('Bug Fix');

INSERT INTO features (description, featureType_id) 
VALUES ('Login Module', 1);

INSERT INTO features (description, featureType_id) 
VALUES ('Patient Registration', 1);

INSERT INTO features (description, featureType_id) 
VALUES ('Patient Profile', 1);

INSERT INTO features (description, featureType_id) 
VALUES ('Patient Release Form', 1);

INSERT INTO features (description, featureType_id) 
VALUES ('Physician Profile', 1);

INSERT INTO features (description, featureType_id) 
VALUES ('Address Verification', 1);

INSERT INTO features (description, featureType_id) 
VALUES ('Patient Authentication', 1);

INSERT INTO features (description, featureType_id) 
VALUES ('Patient Medication Form', 1);

INSERT INTO features (description, featureType_id) 
VALUES ('Patient E-bill', 1);

INSERT INTO features (description, featureType_id) 
VALUES ('Patient Reporting', 1);

INSERT INTO features (description, featureType_id) 
VALUES ('Patient Reporting Bux Fix', 3);

INSERT INTO versions (product_id, versionNumber, platform_id)
VALUES (1, '1.1', 1);

INSERT INTO versions (product_id, versionNumber, platform_id)
VALUES (1, '1.2', 2);

INSERT INTO versions (product_id, versionNumber, platform_id)
VALUES (1, '1.1', 2);

INSERT INTO versions (product_id, versionNumber, platform_id)
VALUES (1, '2.1', 1);

INSERT INTO versions (product_id, versionNumber, platform_id)
VALUES (1, '2.2', 2);

INSERT INTO countries (country) 
VALUES ('United States of America');

INSERT INTO countries (country) 
VALUES ('England');

INSERT INTO companies (name) 
VALUES ('ABC Record');

INSERT INTO companies (name) 
VALUES ('ZYX Corp');

INSERT INTO companies (name) 
VALUES ('99 Store');

INSERT INTO releases (releaseNumber, releaseType_id, version_id, platform_id, released_at)
VALUES ('1.1', 1, 1, 1, '2000-01-01');

INSERT INTO releases (releaseNumber, releaseType_id, version_id, platform_id, released_at)
VALUES ('1.1', 1, 3, 2, '2000-01-01');

INSERT INTO releases (releaseNumber, releaseType_id, version_id, platform_id, released_at)
VALUES ('1.1', 1, 2, 2, '2000-01-01');

INSERT INTO releases (releaseNumber, releaseType_id, version_id, platform_id, released_at)
VALUES ('2.1', 1, 4, 1, '2000-01-01');

INSERT INTO releases (releaseNumber, releaseType_id, version_id, platform_id, released_at)
VALUES ('2.1', 1, 5, 2, '2000-01-01');

INSERT INTO releases (releaseNumber, releaseType_id, version_id, platform_id, released_at)
VALUES ('2.2', 2, 5, 2, '2000-01-01');

INSERT INTO customers (first_name, last_name)
VALUES ('Peter', 'Smith');

INSERT INTO customers (first_name, last_name)
VALUES ('Maria', 'Bolunte');

INSERT INTO customers (first_name, last_name)
VALUES ('David', 'Sommerset');

INSERT INTO customers (first_name, last_name)
VALUES ('Maria', 'Bounte');

INSERT INTO emails (customer_id, email)
VALUES (1, 'p.smith@abc.com');

INSERT INTO emails (customer_id, email)
VALUES (2, 'maria@zyx.com');

INSERT INTO emails (customer_id, email)
VALUES (3, 'david.sommerset@99cents.store');

INSERT INTO emails (customer_id, email)
VALUES (4, 'maria.bounte@99cents.store');

INSERT INTO phoneNumbers (customer_id, phoneNumber, type)
VALUES (1, '1234858973', 'work');

INSERT INTO phoneNumbers (customer_id, phoneNumber, type)
VALUES (2, '128397863896', 'work');

INSERT INTO phoneNumbers (customer_id, phoneNumber, type)
VALUES (3, '17939787968', 'mobile');

INSERT INTO phoneNumbers (customer_id, phoneNumber, type)
VALUES (4, '17876398764', 'mobile');

INSERT INTO addresses (company_id, addressLine1, zip, city, state, country_id)
VALUES (1, '123 Privet Street', '91601', 'Los Angeles', 'CA', 1);

INSERT INTO addresses (company_id, addressLine1, city, country_id)
VALUES (2, '348 Jinx Road', 'London', 2);

INSERT INTO links (link, product_id, version_id, platform_id)
VALUES ('www.downloads.com/product/ehr/v-2.1/windows', 1, 4, 1);

INSERT INTO links (link, product_id, version_id, platform_id)
VALUES ('www.downloads.com/products/ehr/v-1.1/linux', 1, 3, 2);

INSERT INTO links (link, product_id, version_id, platform_id)
VALUES ('www.downloads.com/products/ehr/v-2.2/linux', 1, 5, 2);

INSERT INTO downloads (link_id, customer_id, downloaded_at)
VALUES (1, 1, '2000-06-01');

INSERT INTO downloads (link_id, customer_id, downloaded_at)
VALUES (1, 2, '2000-03-01');

INSERT INTO downloads (link_id, customer_id, downloaded_at)
VALUES (3, 3, '2000-07-01');

INSERT INTO downloads (link_id, customer_id, downloaded_at)
VALUES (3, 4, '2000-09-01');

INSERT INTO customer_company (customer_id, company_id)
VALUES (1, 1);

INSERT INTO customer_company (customer_id, company_id)
VALUES (2, 2);

INSERT INTO customer_company (customer_id, company_id)
VALUES (3, 3);

INSERT INTO customer_company (customer_id, company_id)
VALUES (4, 3);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (1, 1, 1);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (1, 1, 2);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (1, 1, 3);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (1, 1, 4);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (1, 1, 5);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (1, 1, 6);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (2, 2, 1);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (2, 2, 2);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (2, 2, 3);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (2, 2, 4);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (2, 2, 5);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (3, 2, 6);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (4, 1, 7);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (4, 1, 8);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (4, 1, 9);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (4, 1, 10);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (5, 2, 7);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (5, 2, 8);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (5, 2, 9);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (5, 2, 10);

INSERT INTO version_feature (version_id, platform_id, feature_id)
VALUES (5, 2, 11);

INSERT INTO version_release (version_id, platform_id, release_id)
VALUES (1, 1, 1);

INSERT INTO version_release (version_id, platform_id, release_id)
VALUES (2, 2, 2);

INSERT INTO version_release (version_id, platform_id, release_id)
VALUES (3, 2, 3);

INSERT INTO version_release (version_id, platform_id, release_id)
VALUES (4, 1, 4);

INSERT INTO version_release (version_id, platform_id, release_id)
VALUES (5, 2, 5);

INSERT INTO version_release (version_id, platform_id, release_id)
VALUES (5, 2, 6);

INSERT INTO release_feature (release_id, feature_id)
VALUES (1, 1);

INSERT INTO release_feature (release_id, feature_id)
VALUES (1, 2);

INSERT INTO release_feature (release_id, feature_id)
VALUES (1, 3);

INSERT INTO release_feature (release_id, feature_id)
VALUES (1, 4);

INSERT INTO release_feature (release_id, feature_id)
VALUES (1, 5);

INSERT INTO release_feature (release_id, feature_id)
VALUES (1, 6);

INSERT INTO release_feature (release_id, feature_id)
VALUES (2, 1);

INSERT INTO release_feature (release_id, feature_id)
VALUES (2, 2);

INSERT INTO release_feature (release_id, feature_id)
VALUES (2, 3);

INSERT INTO release_feature (release_id, feature_id)
VALUES (2, 4);

INSERT INTO release_feature (release_id, feature_id)
VALUES (2, 5);

INSERT INTO release_feature (release_id, feature_id)
VALUES (3, 6);

INSERT INTO release_feature (release_id, feature_id)
VALUES (4, 7);

INSERT INTO release_feature (release_id, feature_id)
VALUES (4, 8);

INSERT INTO release_feature (release_id, feature_id)
VALUES (4, 9);

INSERT INTO release_feature (release_id, feature_id)
VALUES (4, 10);

INSERT INTO release_feature (release_id, feature_id)
VALUES (5, 7);

INSERT INTO release_feature (release_id, feature_id)
VALUES (5, 8);

INSERT INTO release_feature (release_id, feature_id)
VALUES (5, 9);

INSERT INTO release_feature (release_id, feature_id)
VALUES (5, 10);

INSERT INTO release_feature (release_id, feature_id)
VALUES (5, 11);
