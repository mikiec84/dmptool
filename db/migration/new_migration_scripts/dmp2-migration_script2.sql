-- # set SQL properties to resolve problems with institution.id = 0
SET SQL_MODE         = NO_AUTO_VALUE_ON_ZERO;
SET SQL_SAFE_UPDATES = 0;

-- # Copy the institutions of dmp2 into roadmap Orgs
-- To disable constraints 
## Org Types:  1 = institution, 2 = funder, 3 = Institution+funder, 4 = organisation 
ALTER TABLE `roadmap`.`orgs` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;  
TRUNCATE TABLE `roadmap`.`orgs`;  

INSERT INTO `roadmap`.`orgs` (                          
  `id`,        `name`,        `abbreviation`,    `target_url`,  `wayfless_entity`,              
  `parent_id`,    `org_type`,      `is_other`,      `sort_name`,  `banner_text`,                
  `logo_file_name`,  `logo_uid`,      `logo_name`,    `region_id`,
  `contact_name`,   `contact_email`,   `created_at`,     `updated_at`,                  
  `language_id`)                    
                          
SELECT 
  `id`,        `full_name`,      `nickname`,      `url`,         NULL,                        
   NULL,            
   CASE  
     WHEN `full_name` LIKE '%University%' THEN 1
     WHEN `full_name` LIKE '%College%' THEN 1
     WHEN `full_name` LIKE '%Library%' THEN 1
     ELSE 4
   END,          NULL,         NULL,      `desc`,                
   NULL,             NULL,       NULL,         NULL,                      
  `contact_info`,   `contact_email`,  `created_at`,      `updated_at`,
  (SELECT `id` FROM `roadmap`.`languages` WHERE `roadmap`.`languages`.`default_language` = 1)

FROM `dmptool`.`institutions`;  

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`orgs` ENABLE KEYS;
-- ***FIELDS LEFT OUT**** `url_text`, `submission_mailer_subject`, `submission_mailer_body`, `logo` ****FIELDS LEFT OUT**
-- **********************************************************************************************************************
-- **********************************************************************************************************************

-- #Check for duplicate records in users table as there seem to be some duplicate values for email which has unqiue contraint in roadmap.
-- SELECT COUNT(*) FROM users;
-- 24443
-- SELECT COUNT(DISTINCT email) FROM dmp2.users;
-- 24440

-- select `id`, `institution_id`,  `email`, `first_name`, `last_name`, `created_at`, `updated_at` from users where email in (
--     select email from users
--     group by email having count(*) > 1
-- );
-- 13697  0  davi0635@stthomas.edu        Merrie    Davidson  2015-06-05 15:36:54  2015-06-05 15:36:54
-- 13698  0  davi0635@stthomas.edu        Merrie    Davidson  2015-06-05 15:36:54  2015-06-05 15:36:54
-- 13834  0  director.ejecutivo@cigiden.cl    Juan     Soto     2015-06-18 21:06:02  2015-06-18 21:06:02
-- 13835  0  director.ejecutivo@cigiden.cl    Juan     Soto     2015-06-18 21:06:02  2015-06-18 21:06:02
-- 15538  0  helene.n.andreassen@uit.no      Helene N.  Andreassen  2015-10-25 19:57:28  2015-10-25 20:00:36
-- 15539  0  helene.n.andreassen@uit.no      Helene N.  Andreassen  2015-10-25 19:57:31  2015-10-25 19:57:31


-- # Copy all of the dmp2 users into roadmap Users  
-- Disable the constraints
ALTER TABLE `roadmap`.`users` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;  
TRUNCATE TABLE `roadmap`.`users`;  

INSERT IGNORE INTO `roadmap`.`users` (                          
  `id`,          `org_id`,          `email`,    `firstname`,  `surname`,              
  `orcid_id`,        `shibboleth_id`,      `encrypted_password`,                  
  `reset_password_token`,  `reset_password_sent_at`,  `remember_created_at`,                    
  `sign_in_count`,    `current_sign_in_at`,    `last_sign_in_at`,    `current_sign_in_ip`,                
  `last_sign_in_ip`,    `confirmed_at`,        `confirmation_sent_at`,    `confirmation_token`,                
  `invitation_token`,    `invitation_created_at`,  `invitation_sent_at`,  `invitation_accepted_at`,                
  `other_organisation`,  `accept_terms`,        `api_token`,                    
  `invited_by_id`,    `invited_by_type`,      `language_id`,      `recovery_email`,                        
  `created_at`,      `updated_at`)                                            
SELECT
  `id`,          `institution_id`,      `email`,    `first_name`,  `last_name`,                                    
  NULL,          NULL,            NULL,                    
  NULL,          NULL,            `created_at`,                    
  NULL,           NULL,            NULL,      NULL,                    
  NULL,          `created_at`,            NULL,      NULL,                  
  NULL,          NULL,            NULL,      NULL,                  
  NULL,          0,              `auth_token`,                    
  NULL,          NULL,            NULL,        NULL,                    
  `created_at`,       `updated_at`                  
FROM `dmptool`.`users`;  

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`users` ENABLE KEYS;
-- *******FIELDS LEFT OUT**** `token`, `token_expiration`, `active`, `deleted_at` ****FIELDS LEFT OUT******
-- **********************************************************************************************************************
-- **********************************************************************************************************************

-- # Copy DMP authentications (shibboleth accounts) into roadmap user_identifiers and then copy identifier_scheme_id for shibboleth from roadmaptest Identifier Schemes into user_identifiers table    
-- Disable the constraints
ALTER TABLE `roadmap`.`user_identifiers` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;  
TRUNCATE TABLE `roadmap`.`user_identifiers`;  
    
INSERT INTO `roadmap`.`user_identifiers` (                          
  `identifier`,  `user_id`,  `created_at`,  `updated_at`,  
  `identifier_scheme_id`)                
                          
SELECT   
  `uid`,      `user_id`,  `created_at`,  `updated_at`, 
  (SELECT `id` from `roadmap`.`identifier_schemes` where `roadmap`.`identifier_schemes`.`name` = 'shibboleth')

FROM `dmptool`.`authentications`                          
WHERE `dmptool`.`authentications`.`provider` = 'shibboleth';  

INSERT INTO `roadmap`.`user_identifiers` (                          
  `identifier`,                `user_id`,    `created_at`,    `updated_at`,  
  `identifier_scheme_id`)                
                          
SELECT   
  SUBSTRING_INDEX(`orcid_id`, '/', -1),    `id`,      `created_at`,    `updated_at`, 
  (SELECT `id` from `roadmap`.`identifier_schemes` where `roadmap`.`identifier_schemes`.`name` = 'orcid')

FROM `dmptool`.`users`                          
WHERE `dmptool`.`users`.`orcid_id` IS NOT  NULL;

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`user_identifiers` ENABLE KEYS;
-- **********************************************************************************************************************
-- **********************************************************************************************************************

-- #Copy DMP Users shib data into roadmap Org identifiers table  
-- Disable the constraints
ALTER TABLE `roadmap`.`org_identifiers` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;    
TRUNCATE TABLE `roadmap`.`org_identifiers`;  

INSERT INTO `roadmap`.`org_identifiers` (                          
  `identifier`,    `org_id`,    `attrs`,  
  `created_at`,    `updated_at`,  
  `identifier_scheme_id`)              
                          
SELECT  
  `shib_entity_id`,  `id`,      CONCAT( '{"domain":','"',`shib_domain`,'"', '}' ),  
  `created_at`,    `updated_at`, 
  (SELECT id from roadmap.identifier_schemes where roadmap.identifier_schemes.name = 'shibboleth')

FROM `dmptool`.`institutions`;

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`org_identifiers` ENABLE KEYS;                    
-- **********************************************************************************************************************
-- **********************************************************************************************************************

-- # Copy dmp2 Authorizations into Roadmap UsersPerms join table. 
-- Disable the constraints
ALTER TABLE `roadmap`.`users_perms` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;      
TRUNCATE TABLE `roadmap`.`users_perms`;

# DMP Admin gets all permissions of Perms table assigned.
INSERT INTO `roadmap`.`users_perms` (
  `user_id`,             `perm_id`)
SELECT 
  `dmptool`.`authorizations`.`user_id`,   `roadmap`.`perms`.`id`

FROM `dmptool`.`authorizations` 
CROSS JOIN `roadmap`.`perms`
WHERE `authorizations`.`role_id` = 1
ORDER BY `authorizations`.`user_id`, `perms`.`id`;

# All Other roles have certain Permsissions ("modify_templates", "modify_guidance", "grant_permissions", "change_org_details" ) assigned to them.
INSERT INTO `roadmap`.`users_perms` (
  `user_id`,             `perm_id`)
SELECT  DISTINCT
  `authorizations`.`user_id`,   `Select_Permissions`.`id`

FROM `dmptool`.`authorizations` 
CROSS JOIN 
(SELECT `id`, `name` from `roadmap`.`perms` 
WHERE `name` IN ("modify_templates", "modify_guidance", "grant_permissions", "change_org_details" )) as `Select_Permissions`
WHERE `authorizations`.`role_id` != 1
ORDER BY `authorizations`.`user_id`, `Select_Permissions`.`id`;

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`perms` ENABLE KEYS;
-- **********************************************************************************************************************
-- **********************************************************************************************************************

-- # Copy dmp2 Labels into roadmap Question Format labels table
-- Disable the constraints
ALTER TABLE `roadmap`.`question_format_labels` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `roadmap`.`question_format_labels`;

INSERT INTO `roadmap`.`question_format_labels`(
  `id`,   `description`,      `question_id`,       `number`,     `created_at`,   `updated_at`)
  
SELECT
  `id`,   `desc`,       `requirement_id`,     `position`,    `created_at`,   `updated_at`
FROM `dmptool`.`labels`;

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`question_format_labels` ENABLE KEYS;
-- ***********************************************************************************************************************
-- ***********************************************************************************************************************

-- # Copy dmp2 Plans into roadmap Plans table where visibility is "Institutional"
-- Disable the constraints
ALTER TABLE `roadmap`.`plans` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;      
TRUNCATE TABLE `roadmap`.`plans`;

INSERT INTO `roadmap`.`plans`(
  `id`,            `title`,                `template_id`,        `grant_number`,   `identifier`,  
  `description`,        `slug`,                  `funder_name`,          `visibility`,      
  `data_contact`,        `data_contact_email`,          `data_contact_phone`,
  `principal_investigator`,   `principal_investigator_identifier`,  `principal_investigator_email`,
  `created_at`,        `updated_at`)

SELECT   
  `id`,            `name`,                  `requirements_template_id`,     NULL,      `solicitation_identifier`,
   NULL,             NULL,                   NULL,                  0,  
   NULL,              NULL,                   NULL,
   NULL,             NULL,                      NULL,  
  `created_at`,        `updated_at`
FROM `dmptool`.`plans`
WHERE `visibility` = 'institutional'
AND LENGTH(`name`) < 255;

-- # Copy dmp2 Plans into roadmap Plans table where visibility is "Public"
INSERT INTO `roadmap`.`plans`(
  `id`,            `title`,                `template_id`,        `grant_number`,   `identifier`,  
  `description`,        `slug`,                  `funder_name`,          `visibility`,      
  `data_contact`,        `data_contact_email`,          `data_contact_phone`,
  `principal_investigator`,   `principal_investigator_identifier`,  `principal_investigator_email`,
  `created_at`,        `updated_at`)

SELECT   
  `id`,            `name`,                  `requirements_template_id`,      NULL,      `solicitation_identifier`,
   NULL,              NULL,                   NULL,                  1,  
   NULL,              NULL,                   NULL,
   NULL,              NULL,                   NULL,  
  `created_at`,        `updated_at`
FROM `dmptool`.`plans`
WHERE `visibility` = 'public'
AND LENGTH(`name`) < 255;

-- # Copy dmp2 Plans into roadmap Plans table where visibility is  "unit" or "test"
INSERT INTO `roadmap`.`plans`(
  `id`,            `title`,                `template_id`,        `grant_number`,   `identifier`,  
  `description`,        `slug`,                  `funder_name`,          `visibility`,      
  `data_contact`,        `data_contact_email`,          `data_contact_phone`,
  `principal_investigator`,   `principal_investigator_identifier`,  `principal_investigator_email`,
  `created_at`,        `updated_at`)

SELECT   
  `id`,            `name`,                  `requirements_template_id`,     NULL,      `solicitation_identifier`,
   NULL,             NULL,                   NULL,                  2,  
   NULL,              NULL,                   NULL,
   NULL,              NULL,                   NULL,  
  `created_at`,        `updated_at`
FROM `dmptool`.`plans`
WHERE `visibility` IN ('test', 'unit')
AND LENGTH(`name`) < 255;

-- # Copy dmp2 Plans into roadmap Plans table where visibility is "Private"
INSERT INTO `roadmap`.`plans`(
  `id`,            `title`,                `template_id`,        `grant_number`,   `identifier`,  
  `description`,        `slug`,                  `funder_name`,          `visibility`,      
  `data_contact`,        `data_contact_email`,          `data_contact_phone`,
  `principal_investigator`,   `principal_investigator_identifier`,  `principal_investigator_email`,
  `created_at`,        `updated_at`)

SELECT   
  `id`,            `name`,                  `requirements_template_id`,      NULL,      `solicitation_identifier`,
   NULL,             NULL,                    NULL,                3,  
   NULL,             NULL,                     NULL,
   NULL,             NULL,                    NULL,  
  `created_at`,        `updated_at`
FROM `dmptool`.`plans`
WHERE `visibility` = 'private'
AND LENGTH(`name`) < 255;

-- # Copy dmp2 Plans into roadmap Plans table where title length is too long.
INSERT INTO `roadmap`.`plans`(
  `id`,            `title`,                `template_id`,        `grant_number`,   `identifier`,  
  `description`,        `slug`,                  `funder_name`,          `visibility`,      
  `data_contact`,        `data_contact_email`,          `data_contact_phone`,
  `principal_investigator`,   `principal_investigator_identifier`,  `principal_investigator_email`,
  `created_at`,        `updated_at`)

SELECT   
  `id`,            SUBSTRING_INDEX(`name`, ' ', 6),    `requirements_template_id`,      NULL,      `solicitation_identifier`,
   NULL,             NULL,                    NULL,                3,  
   NULL,             NULL,                     NULL,
   NULL,             NULL,                    NULL,  
  `created_at`,        `updated_at`
FROM `dmptool`.`plans`
WHERE LENGTH(`name`) > 255
AND `visibility` = 'private';

INSERT INTO `roadmap`.`plans`(
  `id`,            `title`,                `template_id`,        `grant_number`,   `identifier`,  
  `description`,        `slug`,                  `funder_name`,          `visibility`,      
  `data_contact`,        `data_contact_email`,          `data_contact_phone`,
  `principal_investigator`,   `principal_investigator_identifier`,  `principal_investigator_email`,
  `created_at`,        `updated_at`)

SELECT   
  `id`,            SUBSTRING_INDEX(`name`, ' ', 6),    `requirements_template_id`,      NULL,      `solicitation_identifier`,
   NULL,             NULL,                    NULL,                2,  
   NULL,             NULL,                     NULL,
   NULL,             NULL,                    NULL,  
  `created_at`,        `updated_at`
FROM `dmptool`.`plans`
WHERE LENGTH(`name`) > 255
AND `visibility` IN ('test', 'unit');

INSERT INTO `roadmap`.`plans`(
  `id`,            `title`,                `template_id`,        `grant_number`,   `identifier`,  
  `description`,        `slug`,                  `funder_name`,          `visibility`,      
  `data_contact`,        `data_contact_email`,          `data_contact_phone`,
  `principal_investigator`,   `principal_investigator_identifier`,  `principal_investigator_email`,
  `created_at`,        `updated_at`)

SELECT   
  `id`,            SUBSTRING_INDEX(`name`, ' ', 6),    `requirements_template_id`,      NULL,      `solicitation_identifier`,
   NULL,             NULL,                    NULL,                1,  
   NULL,             NULL,                     NULL,
   NULL,             NULL,                    NULL,  
  `created_at`,        `updated_at`
FROM `dmptool`.`plans`
WHERE LENGTH(`name`) > 255
AND `visibility` IN ('public');

INSERT INTO `roadmap`.`plans`(
  `id`,            `title`,                `template_id`,        `grant_number`,   `identifier`,  
  `description`,        `slug`,                  `funder_name`,          `visibility`,      
  `data_contact`,        `data_contact_email`,          `data_contact_phone`,
  `principal_investigator`,   `principal_investigator_identifier`,  `principal_investigator_email`,
  `created_at`,        `updated_at`)

SELECT   
  `id`,            SUBSTRING_INDEX(`name`, ' ', 6),    `requirements_template_id`,      NULL,      `solicitation_identifier`,
   NULL,             NULL,                    NULL,                0,  
   NULL,             NULL,                     NULL,
   NULL,             NULL,                    NULL,  
  `created_at`,        `updated_at`
FROM `dmptool`.`plans`
WHERE LENGTH(`name`) > 255
AND `visibility` IN ('institutional');

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`plans` ENABLE KEYS;
-- *********************************************************************************************************************
-- *********************************************************************************************************************

-- # Copy user_plans of dmp2 into Roles in Roadmap
-- Disable the constraints
ALTER TABLE `roadmap`.`roles` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;      
TRUNCATE TABLE `roadmap`.`roles`;

-- Owners
INSERT INTO `roadmap`.`roles`(
  `id`,    `user_id`,      `plan_id`,    `access`,     `created_at`,        `updated_at`)

SELECT 
  `id`,    `user_id`,      `plan_id`,      14,     `created_at`,        `updated_at`
FROM `dmptool`.`user_plans`
WHERE `owner` = 0;

-- Coowners
INSERT INTO `roadmap`.`roles`(
  `id`,    `user_id`,      `plan_id`,    `access`,     `created_at`,        `updated_at`)

SELECT 
  `id`,    `user_id`,      `plan_id`,      15,     `created_at`,        `updated_at`
FROM `dmptool`.`user_plans`
WHERE `owner` = 1;

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`roles` ENABLE KEYS;
-- ALTER TABLE `roadmap`.`roles` DROP FOREIGN KEY `fk_rails_ab35d699f0`;
-- **********************************************************************************************************************
-- **********************************************************************************************************************

-- # Copy dmp2 Comments into Notes tale of roadmap and assign the 1st response of the respective plan as answer_id for the note.
-- Disable the constraints

ALTER TABLE `roadmap`.`notes` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;      
TRUNCATE TABLE `roadmap`.`notes`;
        
INSERT INTO `roadmap`.`notes` ( 
  `id`,                `user_id`,                `text`,    
  `archived`,             `archived_by`,    
  `created_at`,             `updated_at`,               `answer_id`)

SELECT   
  `dmptool`.`comments`.`id`,       `dmptool`.`comments`.`user_id`,       `dmptool`.`comments`.`value`, 
    0,                  NULL , 
   `dmptool`.`comments`.`created_at`,   `dmptool`.`comments`.`updated_at`,     `RESPONSE`.`minresponse`

FROM `dmptool`.`comments`
LEFT JOIN (SELECT `dmptool`.`responses`.`plan_id`, MIN(`dmptool`.`responses`.`id`) as `minresponse`
FROM `dmptool`.`responses`
GROUP BY `dmptool`.`responses`.`plan_id`) `RESPONSE` 
ON `dmptool`.`comments`.`plan_id` = `RESPONSE`.`plan_id`
ORDER BY `dmptool`.`comments`.`id`;

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`notes` ENABLE KEYS;
-- *********************************************************************************************************************
-- *********************************************************************************************************************

-- # Join Plans ids and Guidance_Groups ids and copy into PlansGuidanceGroups
-- -- Disable the constraints
-- ALTER TABLE `roadmap`.`plans_guidance_groups` DISABLE KEYS;
-- SET FOREIGN_KEY_CHECKS = 0;      
-- TRUNCATE TABLE `roadmap`.`plans_guidance_groups`;

-- INSERT INTO `roadmap`.`plans_guidance_groups` ( `plan_id`,  `guidance_group_id` ) 
-- select y.plan_id, guidance_groups.id 
-- from `roadmap`.`guidance_groups` 
-- join 
-- (select plans.id as plan_id, users.org_id as org_id
-- from `roadmap`.`plans`
-- left outer join `roadmap`.`roles` on plans.id = roles.plan_id
-- left outer join `roadmap`.`users` on users.id = roles.user_id
-- join `roadmap`.`orgs` on orgs.id = users.org_id) y
-- on y.org_id = guidance_groups.org_id;

-- -- Enable Back the constraints
-- SET FOREIGN_KEY_CHECKS = 1;
-- ALTER TABLE `roadmap`.`plans_guidance_groups` ENABLE KEYS;

-- *********************************************************************************************************************
-- *********************************************************************************************************************
