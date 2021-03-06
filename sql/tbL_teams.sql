CREATE TABLE TEAMS(
ID NUMBER,
NAME VARCHAR2(100),
DESCRIPTION VARCHAR2(4000),
TEAM_LEADER VARCHAR2(200), --USER_NAME in APEX_APPL_ACL_USERS
CREATED_AT DATE
);

ALTER TABLE TEAMS
ADD CONSTRAINT TEAMS_PK PRIMARY KEY (ID);

ALTER TABLE TEAMS
ADD CONSTRAINT TEAMS_UQ  UNIQUE (NAME);

ALTER TABLE TEAMS
ADD CONSTRAINT TEAMS_LEADER_UQ UNIQUE(TEAM_LEADER);



CREATE  SEQUENCE TEAMS_SEQ 
 START WITH 1 
 INCREMENT BY 1;
 
 
 CREATE OR REPLACE TRIGGER TEAMS_BI_TRG
BEFORE INSERT ON TEAMS
FOR EACH ROW
BEGIN
  SELECT TEAMS_SEQ.NEXTVAL, sysdate
  INTO :new.ID, :new.CREATED_AT
  FROM dual;
END;
/