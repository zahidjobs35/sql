drop table Branch;

create table Branch
(branchno char(5) not null,
 street varchar(35),
 city varchar(10),
 postcode varchar(10),
 primary key(branchno)
);


drop table Staff;

create table Staff
(staffno char(5) not null,
 fname varchar(10),
 lname varchar(10),
 position varchar(10),
 sex char(1),
 dob char(9),
 salary smallint,
 branchno char(5),
 primary key(staffno)
);

drop PropertyForRent;

create table PropertyForRent 
(propertyno char(5) not null, 
 street varchar(35), 
 city varchar(10),
 postcode varchar(10),
 type varchar(10),
 rooms smallint,
 rent int,
 ownerno char(5),
 staffno char(5),
 branchno char(5),
 primary key(propertyno)
);

drop table Client;

create table Client
(clientno char(5) not null,
 fname varchar(10),
 lname varchar(10),
 telno char(15),
 preftype varchar(10),
 maxrent int,
 primary key(clientno)
);


drop table PrivateOwner;

create table PrivateOwner 
(ownerno char(5) not null,
 fname varchar(10),
 lname varchar(10),
 address varchar(50),
 telno char(15),
 primary key(ownerno)
);


drop table Viewing;

create table Viewing
(clientno char(5) not null,
 propertyno char(5) not null,
 viewdate char(9),
 commnt varchar(15),
 primary key(clientno,propertyno)
);

drop table Registration;

create table Registration
(clientNo char(5) not null,
branchNo char(5) not null,
staffNo char(5),
dateJoined char(9),
primary key(clientNo,branchNo)
);

TABLE user
-- Stores user's basic info.
( user_id       INTEGER         PRIMARY KEY
, username      VARCHAR(50)    NOT NULL
, password      VARCHAR(50)    NOT NULL
, ...
, ...
, ...
);

TABLE author
-- Stores author's basic info
( author_id      INTEGER         PRIMARY KEY
, author_name    VARCHAR(50)
, date_of_birth  DATE
, ...
, ...
, ...
);

TABLE publisher
-- Stores publisher's basic info
( publisher_id   INTEGER         PRIMARY KEY
, publisher_name VARCHAR(50)
, ...
, ...
, ...
);

TABLE book
-- Stores book info
( book_id        INTEGER         PRIMARY KEY
, title          VARCHAR(50)    NOT NULL
, author_id      INTEGER         NOT NULL
, publisher_id   INTEGER         NOT NULL
, published_dt   DATE
, ...
, ...
, ...
, FOREIGN KEY (author_id) REFERENCES author(author_id)
, FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

TABLE common_lookup
-- This column stores common values that are used in various select lists.
-- The first three values are going to be
-- a - Read
-- b - Currently reading
-- c - Want to read
( element_id    INTEGER         PRIMARY KEY
, element_value VARCHAR(2000)  NOT NULL
);

TABLE user_books
-- This table contains which user has read / is reading / want to read which book
-- There is a many-to-many relationship between users and books.
-- One user may read many books and one single book can be read by many users.
-- Hence we use this table to maintain that information.
( user_id        INTEGER         NOT NULL
, book_id        INTEGER         NOT NULL
, status_id      INTEGER         NOT NULL
, ...
, ...
, ...
, FOREIGN KEY (user_id) REFERENCES user(user_id)
, FOREIGN KEY (book_id) REFERENCES book(book_id)
, FOREIGN KEY (status_id) REFERENCES common_lookup(element_id)
);

TABLE audit_entry_log
-- This is an audit entry log table where you can track changes and log them here.
( audit_entry_log_id    INTEGER         PRIMARY KEY
, audit_entry_type      VARCHAR(10)    NOT NULL
     -- Stores the entry type or DML event - INSERT, UPDATE or DELETE.
, table_name            VARCHAR(30)
    -- Stores the name of the table which got changed
, column_name           VARCHAR(30)
    -- Stores the name of the column which was changed
, primary_key           INTEGER
    -- Stores the PK column value of the row which was changed.
    -- This is to uniquely identify the row which has been changed.
, ts                    TIMESTAMP
    -- Timestamp when the change was made.
, old_number            NUMBER(36, 2)
    -- If the changed field was a number, the old value should be stored here.
    -- If it's an INSERT event, this would be null.
, new_number            NUMBER(36,2)
    -- If the changed field was a number, the new value in it should be stored here.
    -- If it's a DELETE statement, this would be null.
, old_text              VARCHAR(2000)
    -- Similar to old_number but for a text/varchar field.
, new_text              VARCHAR(2000)
    -- Similar to new_number but for a text/varchar field.
, old_date              VARCHAR(2000)
    -- Similar to old_date but for a date field.
, new_date              VARCHAR(2000)
    -- Similar to new_number but for a date field.
, ...
, ... -- Any other data types you wish to include.
, ...
);


DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authors` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` text COLLATE utf8_unicode_ci NOT NULL,
  `first_name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (1,'Lopez Baranda','Christina'),(2,'Jin-Soon','Sin'),(3,'Jones','Hannah'),(4,'Novak','Stanislaw'),(5,'Turay','Tandice'),(6,'Roy','Shanta'),(7,'Berger','Henry'),(8,'Khatami','Paree');
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `ISBN` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (1,'Creating relational databases for fun and profit','7654321123456'),(2,'Relational databases for really, really smart people','9876543212345'),(3,'My life with relational databases: a memoir','3212345678909'),(4,'Relational databases: an existential journey','8172635412345');
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BooksAuthors`
--

DROP TABLE IF EXISTS `BooksAuthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BooksAuthors` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  KEY `book_id` (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `BooksAuthors_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`),
  CONSTRAINT `BooksAuthors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BooksAuthors`
--

LOCK TABLES `BooksAuthors` WRITE;
/*!40000 ALTER TABLE `BooksAuthors` DISABLE KEYS */;
INSERT INTO `BooksAuthors` VALUES (3,6),(2,4),(2,5),(1,1),(1,3),(1,5),(4,8);
/*!40000 ALTER TABLE `BooksAuthors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Editions`
--

DROP TABLE IF EXISTS `Editions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Editions` (
  `edition_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `date_of_publication` year(4) NOT NULL,
  `edition_number` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`edition_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `Editions_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Editions`
--

LOCK TABLES `Editions` WRITE;
/*!40000 ALTER TABLE `Editions` DISABLE KEYS */;
INSERT INTO `Editions` VALUES (1,3,2001,'1'),(2,3,2003,'2'),(3,4,2003,'1'),(5,1,2000,'1'),(6,3,2005,'3'),(8,2,2012,'1'),(9,3,2009,'4');
/*!40000 ALTER TABLE `Editions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
