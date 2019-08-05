SELECT * FROM membership;
SELECT * FROM members;
------------------------------------------------
/*드랍더테이블*/
DROP TABLE RISK;
DROP TABLE task;
DROP TABLE assigs;
DROP TABLE members;
DROP TABLE project;
DROP TABLE Membership;
/*드랍더시퀀스*/
DROP SEQUENCE memno1_seq;
DROP SEQUENCE project_seq;
DROP SEQUENCE members_seq;
DROP SEQUENCE risk_seq;
DROP SEQUENCE task_seq;
DROP SEQUENCE assigs_seq;
/*주의하십쇼 주의주의*/
------------------------------------------------
CREATE TABLE Membership(
memno varchar2(100) PRIMARY KEY,
id varchar2(50) UNIQUE,
pw varchar2(30),
name varchar2(30),
joindate DATE,
dept varchar2(50),
job varchar2(50),
prjno varchar2(50) DEFAULT NULL,
updated DATE
);


CREATE SEQUENCE memno1_seq
START WITH 1000
INCREMENT BY 1
MAXVALUE 99999;

INSERT INTO Membership values('memno'||memno1_seq.nextval, 'suhyun27@hanmail.net',12345,'Tomas',sysdate,'마케팅','대리', NULL, sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Iglesias@gmail.com',12345,'Enzo',sysdate,'회계','대리', NULL, sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Tomato@naver.com',12345,'Havarty',sysdate,'총무','대리', NULL, sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'IUUU@gmail.com',12345,'Camilla',sysdate,'인사','과장', NULL, sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Helloworld@naver.com',12345,'Enrique',sysdate,'개발','팀장', NULL, sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'HelloGuy@naver.com',12345,'Smith',sysdate,'개발','사원', NULL, sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Olive@naver.com',12345,'Olive',sysdate,'연구','주임', NULL, sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Bob@gmail.com',12345,'Bob',sysdate,'영업','팀장', NULL, sysdate);
INSERT INTO Membership values('memno'||memno1_seq.nextval, 'Timmy@naver.com',12345,'Timmy',sysdate,'홍보','과장', NULL, sysdate);

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
   CHECK (permission IN('팀프로젝트','개인프로젝트')) ENABLE,               --접근권한
   FOREIGN KEY(memno) REFERENCES Membership(memno)                        --Membership memno
);

INSERT INTO project values('pro'||project_seq.nextval,'프롤로그','계획됨','2차발표',to_date('2019-08-02','YYYY-MM-dd')
,to_date('2019-08-02','YYYY-MM-dd'),sysdate,'IUUU','ITBANK','개인프로젝트','memno1000','어쩌란말이냐');
INSERT INTO project values('pro'||project_seq.nextval,'제목이라니','진행중','고객님이라니',to_date('2019-08-02','YYYY-MM-dd')
,to_date('2019-08-15','YYYY-MM-dd'),sysdate,'총책임자라니','카테고리필요하니?','팀프로젝트','memno1001','내용이라니');
INSERT INTO project values('pro'||project_seq.nextval,'두썸띵','보류','호갱님',to_date('2019-03-18','YYYY-MM-dd')
,to_date('2019-08-09','YYYY-MM-dd'),sysdate,'회사어딘가','ITBANK','팀프로젝트','memno1002','나좀뽑아죠요');
INSERT INTO project values('pro'||project_seq.nextval,'유엔빌리지','완료됨','대상감',to_date('2019-07-10','YYYY-MM-dd')
,to_date('2019-08-02','YYYY-MM-dd'),sysdate,'배쿠','ITBANK','개인프로젝트','memno1003','노래짱조아');

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


INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1000','pro10102','admin','활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1001','pro10103','member','비활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1002','pro10100','member','비활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1003','pro10101','member','활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1004','pro10102','member','활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1005','pro10102','member','활성화',sysdate);

SELECT * FROM members;

/*UPDATE SET prjno='pro10102' WHERE memno = 'memno1000'*/

SELECT a.auth, a.activation, a.uptdate, b.prjname, c.id, c.name , c.dept, c.job
      FROM MEMBERS a, PROJECT b, MEMBERSHIP c 
      WHERE a.memno=c.memno AND activation = '활성화';

SELECT a.auth, a.activation, a.uptdate, b.prjname, c.id, c.name , c.dept, c.job
      FROM MEMBERS a, PROJECT b, MEMBERSHIP c 
      WHERE a.memno=c.memno AND activation = '비활성화';

   
SELECT id, pw, name, dept, job FROM MEMBERSHIP
WHERE memno NOT IN( SELECT memno FROM MEMBERS );
SELECT * FROM risk;

drop table risk;

create table RISK(
   riskno varchar2(20), 
   prjno varchar2(20),
   title varchar2(200), /*제목*/
   taskname varchar2(20), /*관련 업무*/
   description varchar2(1000), /*내용*/
   riskdegree varchar2(20), /*위험도 - 높음, 중간, 낮음*/
   posibility varchar2(20), /*가능성 - 높음, 중간, 낮음*/
   owner varchar2(20), /*담당자*/
   solutionPlan varchar2(1000), /*해결방안 - 1. 기다린다. 2. 다른부서에 넘기기 3. 기타 ()*/
   canhappen varchar2(500), /*일어날수있는일*/
   updateIssue varchar2(1000), /*업데이트상황*/
   realSolution varchar2(1000), /*실제 해결방법*/
   status varchar2(20), /* 진행중, 보류, 완료 */
   rgsdte DATE,
   CHECK (riskdegree IN('높음','중간','낮음')) ENABLE,
   CHECK (posibility IN('높음','중간','낮음')) ENABLE,
   CHECK (status IN('진행중','보류','완료')) ENABLE,
   FOREIGN KEY(prjno) REFERENCES project(prjno)
);

CREATE SEQUENCE risk_seq
START WITH 1000
INCREMENT BY 1
MAXVALUE 99999;


INSERT INTO risk values('risk'||risk_seq.nextval, 'pro10102', '간트차트 생각보다 오래걸림', '간트차트', '간트차트가 생각보다 시간이 오래걸려, 시간안에 끝낼수 있을까',
'높음', '높음', '박수현', '인력 투입', '못끄내면 쉬운 간트차트로 고고', '', '','진행중', sysdate);
INSERT INTO risk values('risk'||risk_seq.nextval, 'pro10102', '캘린더 할시간 있을까?', '캘린더', '캘린더를 할 시간이 있을지 모르겠음, 시간안에 끝낼수 있을까',
'중간', '중간', '박수현', '기다림', '선생님이 해주실듯', '', '','보류', sysdate);
INSERT INTO risk values('risk'||risk_seq.nextval, 'pro10102', '채팅 배운적 없음...', '채팅', '소켓 통신?, 채팅 끝냄!!',
'낮음', '낮음', '홍정민', '열심히하자', '스티븐의 능력으로 해결!', '', '','완료', sysdate);
SELECT * FROM risk;

SELECT SUM(count) sum FROM (select POSIBILITY, count(*) count from risk WHERE prjno = 'pro10102'
GROUP BY POSIBILITY);


select riskdegree, count(*) count from risk WHERE prjno = 10102 GROUP BY RISKDEGREE ORDER BY DECODE(riskdegree,'높음',1,'중간',2,'낮음',3);


SELECT posibility, round((Count/sum)*100) count FROM (SELECT * FROM (select POSIBILITY, count(*) count from risk WHERE prjno = 'pro10102' 
GROUP BY POSIBILITY) a, 
(SELECT SUM(count) sum FROM (select POSIBILITY, count(*) count from risk WHERE prjno = 'pro10102'
GROUP BY POSIBILITY)) b) c ORDER BY DECODE(POSIBILITY,'높음',1,'중간',2,'낮음',3);


select b.*, a.tasktitle tasktitle, c.name name from taskexp a, risk b, membership c 
      where b.memno = c.memno AND a.prjno = b.prjno and a.taskno = b.taskno AND b.prjno = 'pro10103';

select b.*, a.tasktitle tasktitle, c.name name from taskexp a, risk b, membership c 
where b.memno = c.memno AND a.prjno = b.prjno and a.taskno = b.taskno AND b.prjno = 'pro10102'
and riskno = 1;


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

CREATE SEQUENCE assigs_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 99999999;

INSERT INTO assigs VALUES('assigs'||assigs_seq.nextval,'memno1000','pro10102','membern4','100000');

SELECT * FROM assigs;

SELECT * FROM MEMBERS;

SELECT * FROM task;
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



INSERT INTO task values('task'||task_seq.nextval,'pro10100','수니업무',0,'백앤드 개발 수정입니다.','','STATUS_ACTIVE','',2001010,6024100,5,0,0,'assigs1','높음',sysdate,'');



SELECT * FROM RESOURCE01;
SELECT * FROM role;


ALTER TABLE membership ADD()

ALTER TABLE 테이블명 ADD(컬럼명 데이타타입(사이즈));
FOREIGN KEY(prjno) REFERENCES project(prjno)
