BEGIN TRANSACTION;
CREATE TABLE `SERVICE` (
	`SERVICE_ID`	INTEGER,
	`SERVICE_DESC`	TEXT,
	`SERVICE_FEE`	NUMERIC,
	`DENTIST_ID`	INTEGER,
	PRIMARY KEY(SERVICE_ID)
	FOREIGN KEY(DENTIST_ID) REFERENCES DENTIST(DENTIST_ID)
);
INSERT INTO `SERVICE` (SERVICE_ID,SERVICE_DESC,SERVICE_FEE,DENTIST_ID) VALUES (1,'X',200,1),
 (2,'Y',300,2),
 (3,'G',250,1),
 (4,'D',350,2);
CREATE TABLE `PATIENT` (
	`PATIENT_ID`	INTEGER,
	`F_NAME`	TEXT,
	`P_NAME`	TEXT,
	`TITLE`	TEXT,
	`STREET`	TEXT,
	`POSTCODE`	NUMERIC,
	`PHONE`	TEXT,
	`BIRTHDATE`	TEXT,
	`DENTICARE_ID`	TEXT,
	PRIMARY KEY(PATIENT_ID)
);
INSERT INTO `PATIENT` (PATIENT_ID,F_NAME,P_NAME,TITLE,STREET,POSTCODE,PHONE,BIRTHDATE,DENTICARE_ID) VALUES (1,'HENCY','VAT','MISS','63 FL',52365,'0012543562','01/01/1965','1'),
 (2,'ROBERT','MUNI','MR.','62 FL',42365,'0022543562','01/01/1966','2'),
 (3,'SUMA','TERA','MR.','13 CA',52365,'0032543562','01/01/1967','3'),
 (4,'RABOIN','JACY','MISS','23 DL',52365,'0042543562','01/01/1968','4'),
 (5,'KITA','SUVA','MR.','16 CA',52365,'0062543562','01/01/1969','5'),
 (6,'MILA','CON','MR.','26 NY',52365,'0072543562','01/01/1965','6');
CREATE TABLE `INVOICE` (
	`INVOICE_ID`	INTEGER,
	`COMMENT`	INTEGER,
	`STATUS`	INTEGER,
	`TOTALFEE`	INTEGER,
	`CLIENT_ID`	INTEGER,
	PRIMARY KEY(INVOICE_ID),
	FOREIGN KEY(CLIENT_ID) REFERENCES CLIENT(CLIENT_ID)
);
INSERT INTO `INVOICE` (INVOICE_ID,COMMENT,STATUS,TOTALFEE,CLIENT_ID) VALUES (1,'NOT PAID','B',500,2),
 (2,'PAID','G',230,2),
 (3,'PAID','G',650,3);
CREATE TABLE `DENTIST` (
	`DENTIST_ID`	INTEGER,
	`F_NAME`	TEXT,
	`P_NAME`	TEXT,
	`TITLE`	TEXT,
	`PHONE`	INTEGER,
	`QUALIFICATIONS`	INTEGER,
	`CUSTOMER_ID`	INTEGER,
	PRIMARY KEY(DENTIST_ID)
);
INSERT INTO `DENTIST` (DENTIST_ID,F_NAME,P_NAME,TITLE,PHONE,QUALIFICATIONS) VALUES (1,'DALAR','MENHA','DR.',256325,'MCP'),
 (2,'KAMBIA','JACK','DR',1254682,'FRCP'),
 (3,'ROBIN','SARMA','DR',1254682,'FRCP'),
 (4,'DIPAK','MEHTA','DR',1254682,'MCP'),
 (5,'TOHIN','MALLIK','DR',1254682,'FRCP'),
 (6,'GIBA','TAKOR','DR',1254682,'FRCP'),
 (7,'SALAM','MIA','DR',1254682,'FRCP');
CREATE TABLE `CUSTOMER` (
	`CUSTOMER_ID`	INTEGER,
	`F_NAME`	TEXT,
	`P_NAME`	TEXT,
	`TITLE`	TEXT,
	`STREET`	TEXT,
	`POSTCODE`	NUMERIC,
	`PHONE`	TEXT,
	PRIMARY KEY(CUSTOMER_ID)
);
INSERT INTO `CUSTOMER` (CUSTOMER_ID,F_NAME,P_NAME,TITLE,STREET,POSTCODE,PHONE) VALUES (1,'HENCY','VAT','MISS','63 FL',52365,'0012543562'),
 (2,'ROBERT','MUNI','MR.','62 FL',42365,'0022543562'),
 (3,'SUMA','TERA','MR.','13 CA',52365,'0032543562'),
 (4,'RABOIN','JACY','MISS','23 DL',52365,'0042543562'),
 (5,'KITA','SUVA','MR.','16 CA',52365,'0062543562'),
 (6,'MILA','CON','MR.','26 NY',52365,'0072543562');
CREATE TABLE `CLIENT` (
	`CLIENT_ID`	INTEGER,
	`F_NAME`	TEXT,
	`P_NAME`	TEXT,
	`TITLE`	TEXT,
	`STREET`	TEXT,
	`POSTCODE`	NUMERIC,
	`PHONE`	TEXT,
	PRIMARY KEY(CLIENT_ID)
);
INSERT INTO `CLIENT` (CLIENT_ID,F_NAME,P_NAME,TITLE,STREET,POSTCODE,PHONE) VALUES (2,'KITA','BENNY','MISS.','34 NY',52365,'0012546322'),
 (3,'ZULIA','KHAN','MR.','65 CA',63254,'0012563254'),
 (4,'ROBERT','NULI','MR.','63 FL',52365,'0012543562'),
 (5,'TSNSHA','NULI','MISS','63 FL',52365,'0012543562'),
 (6,'JACK','KELLY','MR.','63 FL',52365,'0012543562'),
 (7,'RUPA','HEMA','MISS','63 FL',52365,'0012543562');
CREATE TABLE `APPOINTMENT` (
	`DATE`	TEXT,
	`TIME`	TEXT,
	CLIENT_ID  INTEGER,
	SERVICE_ID INTEGER,
	DENTIST_ID	INTEGER,
	`PATIENT_ID`	INTEGER,
	FOREIGN KEY(CLIENT_ID) REFERENCES CLIENT(CLIENT_ID),
	FOREIGN KEY(SERVICE_ID) REFERENCES SERVICE(SERVICE_ID),
	FOREIGN KEY(DENTIST_ID) REFERENCES DENTIST(DENTIST_ID)
);
INSERT INTO `APPOINTMENT` (DATE,TIME,CLIENT_ID,SERVICE_ID,DENTIST_ID) VALUES ('01/01/2016','10.00',1,1,1),
 ('01/02/2016','12.00',1,2,1),
 ('01/01/2016','01.00',2,1,2);
COMMIT;
