# MySQL Snippets

<!-- MarkdownTOC -->

* [Setting Up a New DB](#setting-up-a-new-db)
  * [Find the Database File](#find-the-database-file)
* [User and Database Manipulation](#user-and-database-manipulation)
  * [Listing and Selection](#listing-and-selection)
* [Import and Export](#import-and-export)
* [Search and Replace](#search-and-replace)
* [Optimization](#optimization)
* [Troubleshooting](#troubleshooting)
  * [Skip Tables](#skip-tables)
* [Unsorted](#unsorted)

<!-- /MarkdownTOC -->

**SEE ALSO:** [wp-cli-snippets.md](wp-cli-snippets.md)

<a id="user-and-database-manipulation"></a>

<a id="setting-up-a-new-db"></a>
## Setting Up a New DB

```mysql
CREATE DATABASE dbname;

SELECT User FROM mysql.user;

-- Grant all privileges to user on all databases
GRANT ALL ON *.* TO 'user'@'dbname' IDENTIFIED BY 'pass';
-- Show user privileges
SHOW GRANTS FOR 'riverho3_wp175'@'localhost';

GRANT ALL ON riverho3_wp175.* TO 'riverho3_wp175'@'localhost' IDENTIFIED BY 'j8I-S8p28';

GRANT ALL PRIVILEGES ON riverho3_wp175.* TO 'riverho3_wp175'@'localhost'

SELECT * FROM wp_options WHERE option_name='home'
```

<a id="find-the-database-file"></a>
### Find the Database File

* To find database location, check `/etc/mysql/my.cnf`
* `/var/lib/mysql` is the default directory

<a id="user-and-database-manipulation"></a>
## User and Database Manipulation

```mysql
-- Database Location: check /etc/mysql/my.cnf
-- /var/lib/mysql is the default directory

-- List Users
SELECT User FROM mysql.user;

-- Grant all privileges to user on all databases
GRANT ALL ON *.* TO 'wordpress'@'localhost' IDENTIFIED BY 'pass';
-- Grant privileges on a single database
GRANT ALL ON db_name.localhost TO 'user_name'@'localhost' IDENTIFIED BY 'pass';

-- Show user privilegGRANT ALL ON riverho3_wp175.localhost TO 'riverho3_wp175'@'localhost' IDENTIFIED BY 'j8I-S8p28.';
GRANT ALL ON riverho3_wp175.localhost TO 'riverho3_wp175'@'localhost' IDENTIFIED BY 'j8I-S8p28.';

SHOW GRANTS FOR 'haseph6_wo389'@'localhost';

```

<a id="listing-and-selection"></a>
### Listing and Selection


```mysql

-- List Tables
USE db_name;
SHOW TABLES;

-- List Column Names:
SELECT column_name FROM information_schema.columns WHERE table_name = 'wp_options' AND table_schema = 'haseph'


-- Select Field:
SELECT * FROM wp_options WHERE option_name='home';
```

<a id="import-and-export"></a>
## Import and Export

Import:

```mysql
mysql -u USERNAME -p DATABASE_NAME < filename.sql
```

Export (WordPress Specific):

```mysql
-- Note: you can do this w/ wp db export. I always add the drop tables param

mysqldump -u <user> -p<pass> --quick --extended-insert <db-name> > backup.sql
```

Export (General):

```mysql
mysqldump -u USERNAME -p DATABASE_NAME > filename.sql
```

<a id="search-and-replace"></a>
## Search and Replace

```mysql
UPDATE wp_options SET option_value = replace(option_value, 'https://oldsite.com', 'https://newsite.dev.cc') WHERE option_name = 'home' OR option_name = 'siteurl';

UPDATE wp_posts SET post_content = replace(post_content, 'https://oldsite.com', 'https://newsite.dev.cc');

UPDATE wp_postmeta SET meta_value = replace(meta_value,'https://oldsite.com','https://newsite.dev.cc');
```

<a id="optimization"></a>
## Optimization

Use InnoDB instead of myISAM

```mysql
-- Check if any of your tables are using myISAM
-- Doesn't seem to be working... use wpcli instead
-- wp db query "SHOW TABLE STATUS WHERE Engine = 'MyISAM'" --allow-root
SELECT TABLE_NAME, ENGINE FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'database' and ENGINE = 'myISAM';
```
<a id="troubleshooting"></a>
## Troubleshooting

<a id="skip-tables"></a>
### Skip Tables

If MySQL won't start:

```bash
sudo mysqld_safe --skip-grant-tables &
```


<a id="unsorted"></a>
## Unsorted

```mysql
/* match a string at the beginning of string */
SELECT 'Test' REGEXP '^The'; -- 0
SELECT 'The Test' REGEXP '^The'; -- 1

/* if a name is not prefixed with 'The ' then add it */
UPDATE [table]
SET Name = CONCAT('The ', TRIM(Name))
WHERE Name NOT REGEXP '^The'

/* copy a column from one table to another */
INSERT INTO [table] ([column]) SELECT [column] FROM [table]

/* remove all whitespace */
UPDATE [table] SET [column] = REPLACE([column], ' ', '')

/* (this is BASH) drop all tables in a database */
mysqldump -u[USERNAME] -p[PASSWORD] --add-drop-table --no-data [DATABASE] | grep ^DROP | mysql -u[USERNAME] -p[PASSWORD] [DATABASE]

/* change to collation of a table and all of its existing columns */
alter table [table] convert to character set utf8 collate utf8_general_ci;
```

```bash
# Drop Tables
mysqldump -u[USERNAME] -p[PASSWORD] --add-drop-table --no-data [DATABASE] | grep ^DROP | mysql -u[USERNAME] -p[PASSWORD] [DATABASE]
```

