-- # create table question_format_labels in roadmap.
DROP TABLE IF EXISTS `roadmap`.`question_format_labels`;
CREATE TABLE `roadmap`.`question_format_labels`(
      id         INT,
      description    VARCHAR(255),
      question_id   INT,
      number       INT,
      created_at     DATETIME,
      updated_at    DATETIME);

DROP PROCEDURE IF EXISTS AddColumn;
DELIMITER //
CREATE PROCEDURE AddColumn(IN db tinytext, IN tbl tinytext, IN col tinytext, IN typ text)
BEGIN
  IF EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE column_name = col 
    AND table_name = tbl 
    AND table_schema=db) 
  THEN
    SET @drop = CONCAT('ALTER TABLE `', db, '`.`', tbl, '` DROP COLUMN `', col, '`');
    PREPARE stmt FROM @drop;
    EXECUTE stmt;
  END IF;

  IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE column_name = col 
    AND table_name = tbl 
    AND table_schema=db) 
  THEN
    SET @add = CONCAT('ALTER TABLE `', db, '`.`', tbl, '` ADD `', col, '` ', typ);
    PREPARE stmt FROM @add;
    EXECUTE stmt;
    END IF;
END;//
DELIMITER ;

-- # add contact_info column to Orgs table to keep track of the relationship between user and plan in user_plans table
call AddColumn('roadmap', 'orgs', 'contact_name', 'VARCHAR(255)');
call AddColumn('roadmap', 'answers', 'label_id', 'VARCHAR(255)');

-- *********************************************************************************************************************
-- *********************************************************************************************************************

-- INSERT ROADMAP MASTER TABELS DATA

-- # Insert data in Identifier Schemes
ALTER TABLE `roadmap`.`identifier_schemes` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;  
TRUNCATE TABLE `roadmap`.`identifier_schemes`;

INSERT INTO `roadmap`.`identifier_schemes`(
  `id`,   `name`,      `description`,   `active`,   `logo_url`,         
                                `user_landing_url`,   `created_at`,    `updated_at`)

VALUES 
  (1,    'orcid',    'ORCID',      1,    'http://orcid.org/sites/default/files/images/orcid_16x16.png',   
                                'https://orcid.org',  '2011-08-03 11:48:40',  '2011-08-03 11:48:40'),
  (2,    'shibboleth',  'Shibboleth',    1,     NULL,  
                                 NULL,           '2011-08-03 11:48:40',  '2011-08-03 11:48:40');


-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`identifier_schemes` ENABLE KEYS;
-- *********************************************************************************************************************
-- *********************************************************************************************************************

-- # Insert data in Languages
ALTER TABLE `roadmap`.`languages` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;  
TRUNCATE TABLE `roadmap`.`languages`;

INSERT INTO `roadmap`.`languages`(`id`,   `abbreviation`,   `description`,   `name`,       `default_language`)
VALUES 
  (1,   'en_GB',   '',   'English (GB)',  false);
  (2,   'en_US',   '',   'English (US)',  true);
  ## Comment out all other landugaes excpet US English for now.
  -- (3,   'fr',      '',   'Français',      false),
  -- (4,   'de',      '',   'Deutsch',       false),
  -- (5,   'es',      '',   'Español',       false);

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`languages` ENABLE KEYS;
-- *********************************************************************************************************************
-- *********************************************************************************************************************

-- # Insert data in Perms
ALTER TABLE `roadmap`.`perms` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;  
TRUNCATE TABLE `roadmap`.`perms`;

INSERT INTO `roadmap`.`perms`(
  `id`,     `name`,                   `created_at`,           `updated_at`)
VALUES 
  (1,   'admin',                  '2011-08-03 11:48:40',  '2011-08-03 11:48:40'),
  (2,   'org_admin',              '2011-08-03 11:48:40',  '2011-08-03 11:48:40'),
  (3,   'add_organisations',      '2011-08-03 11:48:40',  '2011-08-03 11:48:40'),
  (4,   'change_org_affiliation', '2011-08-03 11:48:40',  '2011-08-03 11:48:40'),
  (5,   'grant_permissions',      '2011-08-03 11:48:40',  '2011-08-03 11:48:40'),
  (6,   'modify_templates',       '2011-08-03 11:48:40',  '2011-08-03 11:48:40'),
  (7,   'modify_guidance',        '2011-08-03 11:48:40',  '2011-08-03 11:48:40'),
  (8,   'use_api',                '2011-08-03 11:48:40',  '2011-08-03 11:48:40'),
  (9,   'change_org_details',     '2011-08-03 11:48:40',  '2011-08-03 11:48:40'),
  (10,  'grant_api_to_orgs',     '2011-08-03 11:48:40',   '2011-08-03 11:48:40');      

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`perms` ENABLE KEYS;
-- *********************************************************************************************************************
-- *********************************************************************************************************************

-- ## Insert data in Question Formats
ALTER TABLE `roadmap`.`question_formats` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;  
TRUNCATE TABLE `roadmap`.`question_formats`;

INSERT INTO `roadmap`.`question_formats`(
  `id`, `title`,          `description`,   `created_at`,       `updated_at`,          `option_based`,  `formattype`)
VALUES
  (1,    'Text area',         NULL,     '2014-04-01 08:53:26',  '2014-04-01 08:53:26',    0,        0),
  (2,    'Text field',        NULL,     '2014-04-01 08:54:20',  '2017-06-06 14:43:12',    0,        1),
  (3,    'Radio buttons',     NULL,     '2014-04-01 08:55:38',  '2017-06-06 14:43:12',    1,        2),
  (4,    'Check box',         NULL,     '2014-04-01 08:56:45',  '2017-06-06 14:43:12',    1,        3),
  (5,    'Dropdown',          NULL,     '2014-04-01 08:57:46',  '2017-06-06 14:43:12',    1,        4),
  (6,    'Multi select box',  NULL,     '2014-04-01 08:59:24',  '2017-06-06 14:43:12',    1,        5); 
  ##Not supporting Numeric and Date types currently.
  -- (7,    'Numeric',           NULL,     '2014-04-01 08:59:24',  '2017-06-06 14:43:12',    1,        6),  
  -- (8,    'Date',              NULL,     '2014-04-01 08:59:24',  '2017-06-06 14:43:12',    1,        7);

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`question_formats` ENABLE KEYS;
-- *********************************************************************************************************************
-- *********************************************************************************************************************

-- # # Insert data in Regions
ALTER TABLE `roadmap`.`regions` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;  
TRUNCATE TABLE `roadmap`.`regions`;

INSERT into `roadmap`.`regions`(`id`,   `abbreviation`,   `description`,   `name`,   `super_region_id`)
VALUES  
  (1, 'uk',       'default region',      'UK',            NULL),
  (2, 'de',       NULL,                  'DE',            NULL),
  (3, 'horizon', 'European super region','Horizon2020',   NULL);

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`regions` ENABLE KEYS;
-- **********************************************************************************************************************
-- **********************************************************************************************************************

-- # # Insert data in Token Permission Types
ALTER TABLE `roadmap`.`token_permission_types` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;  
TRUNCATE TABLE `roadmap`.`token_permission_types`;

INSERT INTO `token_permission_types` (`id`, `token_type`, `text_description`, `created_at`, `updated_at`)
VALUES
  (1, 'guidances', 'allows a user access to the guidances api endpoint', '2017-06-06 09:11:56', '2017-06-06 09:11:56'),
  (2, 'plans', 'allows a user access to the plans api endpoint', '2017-06-06 09:11:56', '2017-06-06 09:11:56'),
  (3, 'templates', 'allows a user access to the templates api endpoint', '2017-06-06 09:11:56', '2017-06-06 09:11:56'),
  (5, 'statistics', 'allows a user access to the statistics api endpoint', '2017-08-23 16:47:52', '2017-08-23 16:47:52');

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`token_permission_types` ENABLE KEYS;
-- **********************************************************************************************************************
-- **********************************************************************************************************************


DROP PROCEDURE IF EXISTS AddColumn;


-- Insert all of the schema migrations so that they do not try to run during the next deploy!
TRUNCATE TABLE `roadmap`.`schema_migrations`;

## SCHEMA MIGRATIONS AS OF DMP2-STAGE DB
INSERT INTO `schema_migrations` (`version`)
VALUES
  (''),
  ('20130603140800'),
  ('20130603143109'),
  ('20130611111340'),
  ('20130611111359'),
  ('20130611113325'),
  ('20130611132258'),
  ('20130611133033'),
  ('20130611135155'),
  ('20130611135806'),
  ('20130611140229'),
  ('20130611141026'),
  ('20130611151644'),
  ('20130611151704'),
  ('20130611151729'),
  ('20130611151750'),
  ('20130611152208'),
  ('20130611153828'),
  ('20130611153921'),
  ('20130611154055'),
  ('20130611154109'),
  ('20130612113321'),
  ('20130612133806'),
  ('20130612133938'),
  ('20130621101824'),
  ('20130625125419'),
  ('20130705113828'),
  ('20130705145146'),
  ('20130705151214'),
  ('20130708092900'),
  ('20130717093801'),
  ('20130717093814'),
  ('20130717115239'),
  ('20130717125231'),
  ('20130717125748'),
  ('20130717130107'),
  ('20130724112909'),
  ('20130724123043'),
  ('20130730102219'),
  ('20130731124011'),
  ('20130731124532'),
  ('20130731130811'),
  ('20130731131354'),
  ('20130731131846'),
  ('20130731132153'),
  ('20130731133039'),
  ('20130812100100'),
  ('20130902141025'),
  ('20130902141150'),
  ('20130902142403'),
  ('20130903072531'),
  ('20130903084409'),
  ('20130903123015'),
  ('20130905073232'),
  ('20130913134657'),
  ('20130913161023'),
  ('20130918130838'),
  ('20130918154825'),
  ('20130926121718'),
  ('20130927091932'),
  ('20130927092206'),
  ('20131108151505'),
  ('20131111090129'),
  ('20131118094629'),
  ('20131126133804'),
  ('20131126135301'),
  ('20131127100520'),
  ('20131128150644'),
  ('20131129143550'),
  ('20131212111049'),
  ('20140210121753'),
  ('20140214120652'),
  ('20140214155629'),
  ('20140218113637'),
  ('20140331160554'),
  ('20140331162130'),
  ('20140407105254'),
  ('20140407153318'),
  ('20140423200913'),
  ('20140429114226'),
  ('20140604092907'),
  ('20140707143840'),
  ('20150415150436'),
  ('20150416092404'),
  ('20150416101954'),
  ('20150416103652'),
  ('20150416105712'),
  ('20150416112327'),
  ('20150416113232'),
  ('20150416113625'),
  ('20150416114743'),
  ('20150416120233'),
  ('20150416131657'),
  ('20150416133602'),
  ('20150427110644'),
  ('20150427145433'),
  ('20150430135839'),
  ('20150501150321'),
  ('20150518153927'),
  ('20150805105542'),
  ('20150809210811'),
  ('20151208142029'),
  ('20151208142836'),
  ('20160105114044'),
  ('20160603124621'),
  ('20160609081745'),
  ('20160615095101'),
  ('20160719102542'),
  ('20160719140055'),
  ('20160729091510'),
  ('20160805101216'),
  ('20160805103704'),
  ('20160805103912'),
  ('20160805105928'),
  ('20160805105941'),
  ('20160810193149'),
  ('20160822130601'),
  ('20160822130701'),
  ('20161021100420'),
  ('20161024163546'),
  ('20161024163920'),
  ('20161102221313'),
  ('20161115105808'),
  ('20161115114309'),
  ('20161115121831'),
  ('20161115123658'),
  ('20161115124634'),
  ('20161115132137'),
  ('20161115143222'),
  ('20161122152339'),
  ('20161205095623'),
  ('20161205095624'),
  ('20161205095625'),
  ('20161206122926'),
  ('20161208122123'),
  ('20170124235829'),
  ('20170130173049'),
  ('20170201194502'),
  ('20170227122226'),
  ('20170302111544'),
  ('20170303220255'),
  ('20170412143945'),
  ('20170421170849'),
  ('20170427110141'),
  ('20170428083711'),
  ('20170516184429'),
  ('20170606215136'),
  ('20170607154433'),
  ('20170619173045'),
  ('20170702012742'),
  ('20170710182442'),
  ('20170712084314'),
  ('20170719114516'),
  ('20171013152425'),
  ('20171024214257'),
  ('20171024220146'),
  ('20171025200301'),
  ('20171102164156'),
  ('20171102185518'),
  ('20171122195828'),
  ('20171124133802'),
  ('20171130195230'),
  ('20180123161959'),
  ('20180126210659'),
  ('20180131181949'),
  ('20180212124444');


##NEW SCHEMA MIGRATIONS FORM DMPTOOL PRODUCTION
INSERT INTO `schema_migrations` (`version`)
VALUES
  