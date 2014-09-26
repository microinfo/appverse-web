CREATE TABLE ACCOUNT_TYPE (ID BIGINT NOT NULL, CODE VARCHAR(40), DESCRIPTION VARCHAR(128), PRIMARY KEY (ID));
CREATE TABLE ACCOUNT (ID BIGINT NOT NULL, BALANCE REAL NOT NULL, BALANCE_CURRENCY VARCHAR(3) NOT NULL, CREATED TIMESTAMP NOT NULL, CREATED_BY VARCHAR(100) NOT NULL, LASTMONTH_BALANCE REAL NOT NULL, LASTMONTH_BALANCE_CURRENCY VARCHAR(3) NOT NULL, NUMBER VARCHAR(40) NOT NULL, STATUS VARCHAR(255) NOT NULL, UPDATED TIMESTAMP, UPDATED_BY VARCHAR(100), VERSION BIGINT, ACCOUNT_TYPE BIGINT NOT NULL, PRIMARY KEY (ID));
CREATE TABLE USER (ID BIGINT NOT NULL, ACTIVE BOOLEAN NOT NULL, ADDRESS VARCHAR(255) NOT NULL, COUNTRY VARCHAR(2) NOT NULL, CREATED TIMESTAMP NOT NULL, CREATED_BY VARCHAR(100) NOT NULL, EMAIL VARCHAR(40) NOT NULL, ID_CARD VARCHAR(255) NOT NULL, LAST_LOGGED_DATE TIMESTAMP NOT NULL, LASTNAME VARCHAR(40) NOT NULL, MOBILE_NUMBER VARCHAR(255) NOT NULL, NAME VARCHAR(40) NOT NULL, PASSWORD VARCHAR(40) NOT NULL, PHONE_NUMBER VARCHAR(255) NOT NULL, REFERENCE VARCHAR(40) NOT NULL, STATUS VARCHAR(255) NOT NULL, TITLE VARCHAR(4), UPDATED TIMESTAMP, UPDATED_BY VARCHAR(100), USERNAME VARCHAR(40) NOT NULL, VERSION BIGINT, PRIMARY KEY (ID));
CREATE TABLE ACCOUNT_USER (ID BIGINT NOT NULL, ALIAS VARCHAR(40), CREATED TIMESTAMP NOT NULL, CREATED_BY VARCHAR(100) NOT NULL, STATUS VARCHAR(255) NOT NULL, UPDATED TIMESTAMP, UPDATED_BY VARCHAR(100), VERSION BIGINT NOT NULL, USER_ID BIGINT NOT NULL, ACCOUNT_ID BIGINT NOT NULL, PRIMARY KEY (ID));
ALTER TABLE ACCOUNT ADD CONSTRAINT UNQ_ACCOUNT_7 UNIQUE (NUMBER);
ALTER TABLE USER ADD CONSTRAINT UNQ_USER_6 UNIQUE (EMAIL);
ALTER TABLE USER ADD CONSTRAINT UNQ_USER_19 UNIQUE (USERNAME);
ALTER TABLE ACCOUNT ADD CONSTRAINT FK_ACCOUNT_ACCOUNT_TYPE FOREIGN KEY (ACCOUNT_TYPE) REFERENCES ACCOUNT_TYPE (ID);
ALTER TABLE ACCOUNT_USER ADD CONSTRAINT FK_ACCOUNT_USER_USER_ID FOREIGN KEY (USER_ID) REFERENCES USER (ID);
ALTER TABLE ACCOUNT_USER ADD CONSTRAINT FK_ACCOUNT_USER_ACCOUNT_ID FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNT (ID);
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT NUMERIC(38), PRIMARY KEY (SEQ_NAME));
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('USER_SEQ', 0);
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('ACCOUNT_TYPE_SEQ', 0);
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('ACCOUNT_SEQ', 0);
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('ACCOUNT_USER_SEQ', 0);
