CREATE TABLE calendar(
	calno NUMBER PRIMARY KEY,
	prjno NUMBER,
	title varchar2(50),
	

);

SELECT * FROM members;

DROP TABLE members;


DROP SEQUENCE memno1_seq;
DROP TABLE membership;

DROP TABLE project;
DROP SEQUENCE project_seq;





CREATE TABLE Membership(
memno NUMBER PRIMARY KEY,
id varchar2(50) UNIQUE,
pw varchar2(30),
name varchar2(30),
joindate DATE,
dept varchar2(50),
job varchar2(50),
updated DATE
);

CREATE SEQUENCE memno1_seq
START WITH 1000
INCREMENT BY 1
MAXVALUE 99999;
--DROP TABLE Membership;
--DROP SEQUENCE memno1_seq;
INSERT INTO Membership values(memno1_seq.nextval, 'suhyun27@hanmail.net',12345,'Tomas',sysdate,'마케팅','대리', sysdate);
INSERT INTO Membership values(memno1_seq.nextval, 'Iglesias@gmail.com',12345,'Enzo',sysdate,'회계','대리', sysdate);
INSERT INTO Membership values(memno1_seq.nextval, 'Tomato@naver.com',12345,'Havarty',sysdate,'총무','대리', sysdate);
INSERT INTO Membership values(memno1_seq.nextval, 'IUUU@gmail.com',12345,'Camilla',sysdate,'인사','과장', sysdate);
INSERT INTO Membership values(memno1_seq.nextval, 'Helloworld@naver.com',12345,'Enrique',sysdate,'개발','팀장', sysdate);

SELECT * FROM Membership;

CREATE SEQUENCE project_seq
START WITH 10100
INCREMENT BY 1
MAXVALUE 99999;

CREATE TABLE project(
   prjno NUMBER PRIMARY KEY,   --프로젝트번호
   prjname varchar2(100),      --프로젝트명
   prjstatus varchar2(30),      --프로젝트상태(진행사항
   client varchar2(50),      --클라이언트(고객
   stdate DATE,            --시작일
   duedate DATE,            --마감일
   uptdate DATE DEFAULT sysdate, --업데이트 날짜
   prjadmin varchar2(30),      --프로젝트매니저
   category varchar2(100),      --카테코리
   permission varchar2(30),   --접근권한
   memno NUMBER,            --생성자
   description varchar2(200),   --상세내용
   CHECK (prjstatus IN('계획됨','진행중','완료됨','보류','취소','상태없음')) ENABLE,      --진행사항
   CHECK (permission IN('전체공개', '멤버공개','비공개')) ENABLE,               --접근권한
   FOREIGN KEY(memno) REFERENCES Membership(memno)                        --Membership memno
);

INSERT INTO project values(project_seq.nextval,'프롤로그','계획됨','2차발표',to_date('2019-08-02','YYYY-MM-dd')
,to_date('2019-08-02','YYYY-MM-dd'),sysdate,'IUUU','ITBANK','멤버공개',1003,'어쩌란말이냐');

SELECT * FROM project;



CREATE TABLE members(
	memno NUMBER,
	prjno NUMBER,
	auth varchar2(50),
	activation varchar2(50),
	uptdate DATE,
	FOREIGN KEY(memno) REFERENCES membership(memno),
	FOREIGN KEY(prjno) REFERENCES project(prjno)
);


INSERT INTO members VALUES(1000,10100,'관리자','활성화',sysdate);
INSERT INTO members VALUES(1001,10100,'멤버','비활성화',sysdate);
INSERT INTO members VALUES(1002,10100,'멤버','비활성화',sysdate);

SELECT * FROM members;


SELECT a.auth, a.activation, a.uptdate, b.prjname, c.id, c.name , c.dept, c.job
		FROM MEMBERS a, PROJECT b, MEMBERSHIP c 
		WHERE a.memno=c.memno AND activation = '활성화';

SELECT a.auth, a.activation, a.uptdate, b.prjname, c.id, c.name , c.dept, c.job
		FROM MEMBERS a, PROJECT b, MEMBERSHIP c 
		WHERE a.memno=c.memno AND activation = '비활성화';

	
	SELECT id, pw, name, dept, job FROM MEMBERSHIP
		WHERE memno NOT IN( SELECT memno FROM MEMBERS );
	
	INSERT INTO Membership values(memno1_seq.nextval, 'suhyun27@hanmail.net',12345,'Tomas',sysdate,'마케팅','대리', sysdate);
