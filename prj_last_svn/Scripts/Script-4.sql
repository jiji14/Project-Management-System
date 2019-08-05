SELECT * FROM members;

SELECT * FROM membership;

CREATE SEQUENCE ui_sequence
START WITH 1;

DROP TABLE

CREATE TABLE uiformat(
   uino varchar2(100) PRIMARY KEY,   --프로젝트번호
   memno varchar2(100),            --생성자
   box1 varchar2(50) default '#project',
   box2 varchar2(50) DEFAULT '#memLog',
   box3 varchar2(50) DEFAULT '#risk',
   box4 varchar2(50) DEFAULT '#board', 
   FOREIGN KEY(memno) REFERENCES Membership(memno)                        --Membership memno
);

INSERT INTO uiformat(uino, memno) values('uino'||ui_sequence.nextval, 'memno1002');
SELECT * FROM uiformat;

DROP TABLE uiformat;
