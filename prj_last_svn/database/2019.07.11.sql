
DROP TABLE members;

DROP SEQUENCE memno1_seq;
DROP TABLE membership;

DROP TABLE project;
DROP SEQUENCE project_seq;



CREATE TABLE Membership(
memno varchar2(100) PRIMARY KEY,
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

INSERT INTO Membership values('memno'||memno1_seq.nextval, 'suhyun27@hanmail.net',12345,'Tomas',sysdate,'마케팅','대리', sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Iglesias@gmail.com',12345,'Enzo',sysdate,'회계','대리', sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Tomato@naver.com',12345,'Havarty',sysdate,'총무','대리', sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'IUUU@gmail.com',12345,'Camilla',sysdate,'인사','과장', sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Helloworld@naver.com',12345,'Enrique',sysdate,'개발','팀장', sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'HelloGuy@naver.com',12345,'Smith',sysdate,'개발','사원', sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Olive@naver.com',12345,'Olive',sysdate,'연구','주임', sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Bob@gmail.com',12345,'Bob',sysdate,'영업','팀장', sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Timmy@naver.com',12345,'Timmy',sysdate,'홍보','과장', sysdate);

SELECT * FROM Membership;

CREATE SEQUENCE project_seq
START WITH 10100
INCREMENT BY 1
MAXVALUE 99999;

CREATE TABLE project(
   prjno varchar2(100) PRIMARY KEY,   --프로젝트번호
   prjname varchar2(100),      --프로젝트명
   prjstatus varchar2(30),      --프로젝트상태(진행사항
   client varchar2(50),      --클라이언트(고객
   stdate DATE,            --시작일
   duedate DATE,            --마감일
   uptdate DATE DEFAULT sysdate, --업데이트 날짜
   prjadmin varchar2(30),      --프로젝트매니저
   category varchar2(100),      --카테코리
   permission varchar2(30),   --접근권한
   memno varchar2(100),            --생성자
   description varchar2(200),   --상세내용
   CHECK (prjstatus IN('계획됨','진행중','완료됨','보류','취소','상태없음')) ENABLE,      --진행사항
   CHECK (permission IN('전체공개', '멤버공개','비공개')) ENABLE,               --접근권한
   FOREIGN KEY(memno) REFERENCES Membership(memno)                        --Membership memno
);

INSERT INTO project values('pro'||project_seq.nextval,'프롤로그','계획됨','2차발표',to_date('2019-08-02','YYYY-MM-dd')
,to_date('2019-08-02','YYYY-MM-dd'),sysdate,'IUUU','ITBANK','멤버공개','memno1000','어쩌란말이냐');

SELECT * FROM project;

CREATE TABLE members(
	membern varchar2(100) PRIMARY KEY,
	memno varchar2(100),
	prjno varchar2(100),
	auth varchar2(50),
	activation varchar2(50),
	uptdate DATE,
	FOREIGN KEY(memno) REFERENCES membership(memno),
	FOREIGN KEY(prjno) REFERENCES project(prjno)
);


CREATE SEQUENCE members_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999999;

SELECT * FROM membership;

INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1000','pro10101','admin','활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1001','pro10101','member','비활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1002','pro10101','member','비활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1003','pro10101','member','활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1004','pro10101','member','활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1005','pro10101','member','활성화',sysdate);

SELECT * FROM members;


SELECT a.auth, a.activation, a.uptdate, b.prjname, c.id, c.name , c.dept, c.job
		FROM MEMBERS a, PROJECT b, MEMBERSHIP c 
		WHERE a.memno=c.memno AND activation = '활성화';

SELECT a.auth, a.activation, a.uptdate, b.prjname, c.id, c.name , c.dept, c.job
		FROM MEMBERS a, PROJECT b, MEMBERSHIP c 
		WHERE a.memno=c.memno AND activation = '비활성화';

	
SELECT id, pw, name, dept, job FROM MEMBERSHIP
WHERE memno NOT IN( SELECT memno FROM MEMBERS );

create table RISK(
   riskno varchar2(100) PRIMARY KEY, 
   prjno varchar2(100),
   memno varchar2(100),
   taskno varchar2(100),
   title varchar2(200),
   content varchar2(1000),
   riskdegree varchar2(20),
   posibility varchar2(20),
   riskfile varchar2(500),
   tasktitle varchar2(100),
   supname varchar2(50),  --담당자 이름
   rgsdte DATE,
   uptdte DATE,
   FOREIGN KEY(prjno) REFERENCES project(prjno),
   FOREIGN KEY(memno) REFERENCES membership(memno)
);


CREATE SEQUENCE risk_seq
START WITH 1000
INCREMENT BY 1
MAXVALUE 99999;

insert into risk values('risk'||risk_seq.nextval, 'pro10101', 'memno1000', 1, '간트차트분석 이다앙~', '분석어려움', '높음', '높음', '', '수니업무','수니',sysdate, sysdate);
insert into risk values('risk'||risk_seq.nextval, 'pro10101', 'memno1000', 2, '캘린더분석 이다앙~', '분석어려움', '중간', '낮음', '', '지정업무','지정',sysdate, sysdate);
insert into risk values('risk'||risk_seq.nextval, 'pro10101', 'memno1000', 3, '채팅분석 이다앙~', '분석어려움', '낮음', '높음', '', '수진업무','수진',sysdate, sysdate);
insert into risk values('risk'||risk_seq.nextval, 'pro10101', 'memno1000', 4, '커스터마이징분석 이다앙~', '분석어려움', '중간', '중간', '', '정민업무','정민',sysdate, sysdate);
insert into risk values('risk'||risk_seq.nextval, 'pro10101', 'memno1000', 5, '자바분석 이다앙~', '분석어려움', '높음', '중간', '', '토마스업무','토마스',sysdate, sysdate);
insert into risk values('risk'||risk_seq.nextval, 'pro10101', 'memno1001', 5, '자바분석 이다앙~2', '분석어려움22', '높음', '중간', '', '스티븐업무','스티븐',sysdate, sysdate);

insert into risk values('risk'||risk_seq.nextval, 'pro10101', 'memno1000', 1, 'dddd', '', '높음','높음','', '하하업무','하하',sysdate, sysdate);
insert into risk values('risk'||risk_seq.nextval, 'pro10101', 'memno1000', 1, 'dd', 'dd', '높음','높음','', '영빈장군업무','영빈장군',sysdate, sysdate);

SELECT * FROM risk;


SELECT * FROM risk WHERE prjno = 'pro10100';

SELECT * FROM risk WHERE riskno = 1;


select b.*, a.tasktitle tasktitle, c.name name from taskexp a, risk b, membership c 
where b.memno = c.memno AND a.prjno = b.prjno and a.taskno = b.taskno AND b.prjno = 10100;

SELECT SUM(count) sum FROM (select POSIBILITY, count(*) count from risk WHERE prjno = 10100 
GROUP BY POSIBILITY);


select riskdegree, count(*) count from risk WHERE prjno = 10100 GROUP BY RISKDEGREE ORDER BY DECODE(riskdegree,'높음',1,'중간',2,'낮음',3);


SELECT posibility, round((Count/sum)*100) count FROM (SELECT * FROM (select POSIBILITY, count(*) count from risk WHERE prjno = 10100 
GROUP BY POSIBILITY) a, 
(SELECT SUM(count) sum FROM (select POSIBILITY, count(*) count from risk WHERE prjno = 10100 
GROUP BY POSIBILITY)) b) c ORDER BY DECODE(POSIBILITY,'높음',1,'중간',2,'낮음',3);


select b.*, a.tasktitle tasktitle, c.name name from taskexp a, risk b, membership c 
      where b.memno = c.memno AND a.prjno = b.prjno and a.taskno = b.taskno AND b.prjno = 10100;

select b.*, a.tasktitle tasktitle, c.name name from taskexp a, risk b, membership c 
where b.memno = c.memno AND a.prjno = b.prjno and a.taskno = b.taskno AND b.prjno = 10100
and riskno = 1;








CREATE TABLE task(
   tid varchar2(100) PRIMARY KEY,               --업무번호
   prjno varchar2(100),                     --프로젝트 번호(참조)
   tname varchar2(100),                     --업무명
   progress NUMBER,                        --진행상태
   description varchar2(100),                  --내용
   code varchar2(100),                        --요건 잘 모르겠음 분석필요
   status varchar2(100),                     --활성화여부
   depends varchar2(100),                     --상위명
   startdate NUMBER,                           --시작일
   enddate NUMBER,                           --마감일
   duration NUMBER,                        --기간
   startIsMilestone NUMBER,                  --시작일 고정 여부 (boolean 형태이지만 DB에서는 사용 불가한 데이터 타입이라 0 or 1 사용하여 구분)
   endIsMilestone NUMBER,                     --마감일 고정 여부
   assigsId varchar2(100),                     --할당된 멤버들 
   importance varchar2(100),                  --중요도
   uptdate DATE,                           --업데이트 날짜
   approval varchar2(100),                     --승인 여부
   FOREIGN KEY(prjno) REFERENCES project(prjno),
   FOREIGN KEY(assigsId) REFERENCES assigs(assigsId)
);


CREATE SEQUENCE task_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999;



INSERT INTO task values('task'||task_seq.nextval,'pro10101','수니업무',0,'백앤드 개발 수정입니다.','','STATUS_ACTIVE','',2001010,6024100,5,0,0,'assigs1','높음',sysdate,'');

SELECT * FROM task;

SELECT * FROM assigs;

CREATE TABLE assigs(
   assigsId varchar2(100) PRIMARY KEY,
   memno varchar2(100),
   prjno varchar2(100),
   membern varchar2(100),
   effort varchar2(100),
   FOREIGN KEY(prjno) REFERENCES project(prjno),
   FOREIGN KEY(memno) REFERENCES Membership(memno),
   FOREIGN KEY(membern) REFERENCES members(membern)
);

SELECT * FROM membership;
SELECT * FROM members;
SELECT * FROM project;


CREATE SEQUENCE assigs_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 99999999;

INSERT INTO assigs VALUES('assigs'||assigs_seq.nextval,'memno1000','pro10101','membern1','100000');

SELECT * FROM assigs;

SELECT * FROM RESOURCE01;
SELECT * FROM role;





