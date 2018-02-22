## Ldap User Migration
# STEP 1 -- Create a LDAP Users table to Import the Ldap Users CSV data.
CREATE TABLE IF NOT EXISTS `ldap_users`
 (display_name varchar(255),
 email varchar(255),
 ldap_uid varchar(255),
 ldap_password  varchar(255));
  
### Import Ldap CSV file

# List the total records 
SELECT * FROM `ldap_users`;

-- ***********************************************************************************************************************

# STEP 2 --  Create a table to store records that are a join of Users and Ldap Users details of corresponding users.

CREATE TABLE IF NOT EXISTS `match_ldap_users`
(display_name varchar(255), 
 user_id int,
 email varchar(255),
 ldap_uid varchar(255),
 ldap_password  varchar(255));

INSERT INTO `match_ldap_users` (
`user_id`, 		`ldap_uid`,					`display_name`, 			`email`, 						 
`ldap_password` )
SELECT 
`users`.`id`,	`ldap_users`.`ldap_uid`,   `ldap_users`.`display_name`,  `ldap_users`.`email`, 
`ldap_users`.`ldap_password`
FROM `ldap_users`
JOIN `users`
ON `users`.`login_id` = `ldap_users`.`ldap_uid`
WHERE `users`.`id` <> 24809;

SELECT * FROM `match_ldap_users`;

-- ***********************************************************************************************************************

# STEP 3 - Udpate Users table with their ldap info from this table and then drop the tables.

UPDATE `roadmap`.`users` 
INNER JOIN `roadmap`.`match_ldap_users`
ON `users`.`id` = `match_ldap_users`.`user_id`
SET `users`.`ldap_username` = `match_ldap_users`.`ldap_uid`; 

UPDATE `roadmap`.`users` 
INNER JOIN `roadmap`.`match_ldap_users`
ON `users` .`id` = `match_ldap_users`.`user_id`
SET `users` .`ldap_password` = `match_ldap_users`.`ldap_password`; 

DROP TABLE IF EXISTS `roadmap`.`ldap_users`;
DROP TABLE IF EXISTS `roadmap`.`match_ldap_users`;

-- ***********************************************************************************************************************