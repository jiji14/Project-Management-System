SELECT * FROM membership WHERE id = 'suhyun27@hanmail.net' AND pw = '12345';
SELECT * FROM membership;
UPDATE membership SET prjno = 'pro10101' WHERE memno = 'memno1008';
SELECT * FROM project;
SELECT * FROM risk;
SELECT * FROM members;
SELECT * FROM tasks;
SELECT * FROM assigs;
------------------------------------------------
/*드랍더테이블*/
DROP TABLE RISK;
DROP TABLE tasks;
DROP TABLE assigs;
DROP TABLE members;
DROP TABLE project;
DROP TABLE Membership;
/*드랍더시퀀스*/
DROP SEQUENCE memno1_seq;
DROP SEQUENCE project_seq;
DROP SEQUENCE members_seq;
DROP SEQUENCE risk_seq;
DROP SEQUENCE tasks_seq;
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
prjno varchar2(50) DEFAULT 'pro0',
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
SELECT * FROM calendar;
UPDATE MEMBERSHIP SET prjno='pro0' WHERE prjno = '';

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
   activation varchare2(50)
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
SELECT * FROM risk;

INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1000','pro10102','admin','활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1001','pro10103','member','비활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1002','pro10100','member','비활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1003','pro10101','member','활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1004','pro10102','member','활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1005','pro10102','member','활성화',sysdate);
INSERT INTO members VALUES('membern'||members_seq.nextval,'memno1006','pro10100','member','활성화',sysdate);

SELECT * FROM members;

/*UPDATE SET prjno='pro10102' WHERE memno = 'memno1000'*/

SELECT a.auth, a.activation, a.uptdate, b.prjno, b.id, b.name, b.dept, b.job 
	  FROM members a, membership b 
	  WHERE a.memno=b.memno AND activation='활성화' AND a.prjno = 'pro10100';
	  
 SELECT a.auth, a.activation, a.uptdate, b.prjno, b.id, b.name, b.dept, b.job 
	  FROM members a, membership b 
	  WHERE a.memno=b.memno AND activation='비활성화' AND a.prjno = 'pro10100';
	  

--SELECT suniId id, suniPw pw,
--컬럼과 VO의 이름이 달라도 내가 바꿔줄수있다. 단, vo,mapper 같아야한다. 
	
     SELECT * FROM project;
     SELECT * FROM members;
     SELECT * FROM membership;

SELECT id, pw, name, dept, job FROM MEMBERSHIP
WHERE memno NOT IN( SELECT memno FROM MEMBERS );
SELECT * FROM risk;

drop table risk;

select * from project where prjno='pro10101';

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

SELECT * FROM task WHERE prjno='pro10100';

SELECT name, a.prjno prjno FROM members a, membership b WHERE a.prjno ='pro10100' AND a.activation = '활성화' AND a.memno = b.memno;

INSERT INTO risk values('risk'||risk_seq.nextval, 'pro10100', '간트차트 생각보다 오래걸림', '간트차트', '간트차트가 생각보다 시간이 오래걸려, 시간안에 끝낼수 있을까',
'높음', '높음', '박수현', '인력 투입', '못끄내면 쉬운 간트차트로 고고', '', '','진행중', sysdate);
INSERT INTO risk values('risk'||risk_seq.nextval, 'pro10100', '캘린더 할시간 있을까?', '캘린더', '캘린더를 할 시간이 있을지 모르겠음, 시간안에 끝낼수 있을까',
'중간', '중간', '박수현', '기다림', '선생님이 해주실듯', '', '','보류', sysdate);
INSERT INTO risk values('risk'||risk_seq.nextval, 'pro10100', '채팅 배운적 없음...', '채팅', '소켓 통신?, 채팅 끝냄!!',
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
INSERT INTO assigs VALUES('assigs'||assigs_seq.nextval,'memno1000','pro10100','membern4','100000');


INSERT INTO assigs VALUES('assigs'||assigs_seq.nextval,'memno1001','pro10101','membern4','100000');
INSERT INTO assigs VALUES('assigs'||assigs_seq.nextval,'memno1002','pro10100','membern4','100000');
INSERT INTO assigs VALUES('assigs'||assigs_seq.nextval,'memno1003','pro10101','membern1','100000');
INSERT INTO assigs VALUES('assigs'||assigs_seq.nextval,'memno1004','pro10103','membern1','100000');

SELECT * FROM assigs;

SELECT * FROM MEMBERS;


SELECT * FROM project;
DROP TABLE tasks;
CREATE TABLE tasks(
   taskid varchar2(100),               --업무번호
 
SELECT * FROM tasks;
CREATE TABLE tasks(
   taskId varchar2(100) PRIMARY KEY,               --업무번호

<<<<<<< .mine
SELECT * FROM tasks;

DROP TABLE tasks;

CREATE TABLE tasks(
   taskId varchar2(100) PRIMARY KEY,               --업무번호
   prjno varchar2(100),                     --프로젝트 번호(참조)
   name varchar2(100),                     --업무명
   progress NUMBER,                        --진행상태
   description varchar2(100),                  --내용
   status varchar2(100),                     --활성화여부
   depends varchar2(100),                     --상위명
   startdate NUMBER,                           --시작일
   duration NUMBER,                        --기간
   enddate NUMBER,
   startIsMilestone NUMBER,                  --시작일 고정 여부 (boolean 형태이지만 DB에서는 사용 불가한 데이터 타입이라 0 or 1 사용하여 구분)
   endIsMilestone NUMBER,                     --마감일 고정 여부
   assigsId varchar2(100),                     --할당된 멤버들 
   isHidden NUMBER DEFAULT 0 CHECK (isHidden IN(0,1)) , --숨김여부
   importance varchar2(100),                  --중요도
   uptdate DATE,                           --업데이트 날짜
   approval varchar2(100),                     --승인 여부
   FOREIGN KEY(prjno) REFERENCES project(prjno),
   FOREIGN KEY(assigsId) REFERENCES assigs(assigsId)
);

DROP SEQUENCE tasks_seq;
CREATE SEQUENCE tasks_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999;

SELECT * FROM tasks;
SELECT * FROM assigs;

INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','수니업무',0,'백앤드 개발 수정입니다.','STATUS_ACTIVE','',2001010,5,1563773788758,0,0,'assigs2',0,'높음',sysdate,'승인');
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','수니업무',0,'백앤드 개발 수정입니다.','STATUS_ACTIVE','',2001010,5,1563774788758,0,0,'assigs2',0,'높음',sysdate,'승인');
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','수니업무',0,'백앤드 개발 수정입니다.','STATUS_ACTIVE','',2001010,5,1563775788758,0,0,'assigs2',0,'높음',sysdate,'승인');
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','수니업무',0,'백앤드 개발 수정입니다.','STATUS_ACTIVE','',2001010,5,1563776788758,0,0,'assigs2',0,'높음',sysdate,'승인');


SELECT * FROM tasks;
SELECT * FROM assigs;

||||||| .r5302
SELECT * FROM tasks;

DROP TABLE tasks;

CREATE TABLE tasks(
   taskId varchar2(100) PRIMARY KEY,               --업무번호
   prjno varchar2(100),                     --프로젝트 번호(참조)
   name varchar2(100),                     --업무명
   progress NUMBER,                        --진행상태
   description varchar2(100),                  --내용
   status varchar2(100),                     --활성화여부
   depends varchar2(100),                     --상위명
   startdate NUMBER,                           --시작일
   duration NUMBER,                        --기간
   enddate NUMBER,
   startIsMilestone NUMBER,                  --시작일 고정 여부 (boolean 형태이지만 DB에서는 사용 불가한 데이터 타입이라 0 or 1 사용하여 구분)
   endIsMilestone NUMBER,                     --마감일 고정 여부
   assigsId varchar2(100),                     --할당된 멤버들 
   isHidden NUMBER DEFAULT 0 CHECK (isHidden IN(0,1)) , --숨김여부
   importance varchar2(100),                  --중요도
   uptdate DATE,                           --업데이트 날짜
   approval varchar2(100),                     --승인 여부
   FOREIGN KEY(prjno) REFERENCES project(prjno),
   FOREIGN KEY(assigsId) REFERENCES assigs(assigsId)
);

DROP SEQUENCE tasks_seq;
CREATE SEQUENCE tasks_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999;

SELECT * FROM tasks;
SELECT * FROM assigs;

INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','수니업무',0,'백앤드 개발 수정입니다.','STATUS_ACTIVE','',2001010,5,1563773788758,0,0,'assigs2',0,'높음',sysdate,'승인');
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','수니업무',0,'백앤드 개발 수정입니다.','STATUS_ACTIVE','',2001010,5,1563774788758,0,0,'assigs2',0,'높음',sysdate,'승인');
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','수니업무',0,'백앤드 개발 수정입니다.','STATUS_ACTIVE','',2001010,5,1563775788758,0,0,'assigs2',0,'높음',sysdate,'승인');
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','수니업무',0,'백앤드 개발 수정입니다.','STATUS_ACTIVE','',2001010,5,1563776788758,0,0,'assigs2',0,'높음',sysdate,'승인');


SELECT * FROM tasks;


SELECT * FROM RESOURCE01;
SELECT * FROM role;

<<<<<<< .mine
SELECT * FROM members;

DROP TABLE TASKS;
DROP SEQUENCE task_seq;

SELECT * FROM MEMBERSHIP;


DROP TABLE TASKS;
DROP SEQUENCE task_seq;


=======
>>>>>>> .r5304
SELECT * FROM project;

ALTER TABLE membership ADD()

ALTER TABLE 테이블명 ADD(컬럼명 데이타타입(사이즈));
FOREIGN KEY(prjno) REFERENCES project(prjno)


SELECT * FROM membership;
SELECT * FROM project;
SELECT * FROM members;
SELECT * FROM ASSIGS;
SELECT * FROM task;

SELECT ASSIGsID, EFFORT, memno, membern FROM assigs WHERE PRJNO = 'pro10102';

SELECT * FROM assigs;

DELETE membership WHERE prjno = 10100;

INSERT INTO TASK VALUES(#{id}, #{name}, #{progress}, #{description, jdbcType=VARCHAR}, 
#{code, jdbcType=VARCHAR}, #{level}, #{status}, #{depends, jdbcType=VARCHAR}, #{start}, #{duration}, 
#{end}, #{startIsMilestone}, #{endIsMilestone}, #{pjCode});




CREATE TABLE tasks(
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
   approval varchar2(100),                     --승인 여부 (미승인, 승인, 반려)
   isHidden NUMBER,						-- todolist에서 쓸 칼럼 (0: false 1: true)
   FOREIGN KEY(prjno) REFERENCES project(prjno),
   FOREIGN KEY(assigsId) REFERENCES assigs(assigsId)
);


SELECT * FROM risk;
SELECT * FROM tasks;
||||||| .r5302
CREATE TABLE tasks(
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
   approval varchar2(100),                     --승인 여부 (미승인, 승인, 반려)
   isHidden NUMBER,						-- todolist에서 쓸 칼럼 (0: false 1: true)
   FOREIGN KEY(prjno) REFERENCES project(prjno),
   FOREIGN KEY(assigsId) REFERENCES assigs(assigsId)
);



SELECT * FROM task;

DROP TABLE tasks;

CREATE TABLE tasks(
   taskid varchar2(100) PRIMARY KEY,               --업무번호
   prjno varchar2(100),                     --프로젝트 번호(참조)
   name varchar2(100),                     --업무명
   progress NUMBER,                        --진행상태
   description varchar2(100),                  --내용
   status varchar2(100),                     --활성화여부
   depends varchar2(100),                     --상위명
   startdate NUMBER,                           --시작일
   duration NUMBER,                        --기간
   enddate NUMBER,                           --마감일
   startIsMilestone NUMBER,                  --시작일 고정 여부 (boolean 형태이지만 DB에서는 사용 불가한 데이터 타입이라 0 or 1 사용하여 구분)
   endIsMilestone NUMBER,                     --마감일 고정 여부
   assigsId varchar2(100),                     --할당된 멤버들 
   importance varchar2(100),                  --중요도
   uptdate DATE,                           --업데이트 날짜
   approval varchar2(100),                     --승인 여부 (미승인, 승인, 반려)
   isHidden NUMBER DEFAULT 0 CHECK (isHidden IN(0,1)) , --숨김여부
   FOREIGN KEY(prjno) REFERENCES project(prjno),
   FOREIGN KEY(assigsId) REFERENCES assigs(assigsId)
);

DROP SEQUENCE tasks_seq;


CREATE SEQUENCE tasks_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999;

INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','수니업무',0,'업무 첫번째','STATUS_ACTIVE','',1155654821200,5,1563773788758,0,0,'assigs1','높음',sysdate,'미승인',0);
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','수진업무',0,'업무 두번째','STATUS_ACTIVE','',1155654821200,5,1563773788758,0,0,'assigs2','높음',sysdate,'미승인',0);
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','정민업무',0,'업무 세번째','STATUS_ACTIVE','',1155654821200,5,1563773788758,0,0,'assigs3','높음',sysdate,'미승인',0);
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10100','지정업무',0,'업무 네번째','STATUS_ACTIVE','',1155654821200,5,1563773788758,0,0,'assigs3','높음',sysdate,'미승인',0);
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10101','경수업무',0,'업무 다섯번째','STATUS_ACTIVE','',1155654821200,5,1563773788758,0,0,'assigs1','높음',sysdate,'미승인',0);
INSERT INTO tasks values('tasks'||tasks_seq.nextval,'pro10102','백현업무',0,'업무 여섯번째','STATUS_ACTIVE','',1155654821200,5,1563773788758,0,0,'assigs2','높음',sysdate,'미승인',0);

SELECT * FROM assigs;

SELECT * FROM tasks;

UPDATE assigs SET prjno = 'pro10102' WHERE assigsid = 'assigs1';
UPDATE assigs SET prjno = 'pro10100' WHERE assigsid = 'assigs2';
UPDATE tasks SET prjno = 'pro10100' WHERE assigsid = 'assigs2';
UPDATE tasks SET prjno = 'pro10102' WHERE assigsid = 'assigs1';

SELECT * FROM tasks a, assigs b WHERE a.assigsId = b.assigsId AND memno='memno1000' AND a.prjno='pro10100';
UPDATE tasks SET APPROVAL='승인';


SELECT * FROM calendar;
DROP TABLE CALENDAR;
CREATE TABLE calendar(
   id NUMBER PRIMARY KEY,
   title varchar2(100),
   begin varchar2(50),
   END varchar2(50),
   content varchar2(1000),
   color varchar2(10),
   textColor varchar2(10),
   allDay varchar2(1)
);

CREATE SEQUENCE cal_seq
MINVALUE 1
MAXVALUE 99999
INCREMENT BY 1
START WITH 1
cache 20;

INSERT INTO calendar values(
   cal_seq.nextval,
   'Meeting',
   '2019-07-18T09:00:00',
   '2019-07-19T09:00:00',
   '모임일정내용입니다',
   '#585858',
   '#ffffff',
   '1'
);

SELECT * FROM project;
SELECT * FROM calendar;
/*
this.title = title;
      this.start = start;
      this.end = end;
      this.content = content;
      this.color = color;
      this.textColor = textColor;0
      this.allDay = allDay;
*/

SELECT * FROM tasks;
SELECT * FROM MEMBERship;
SELECT * FROM MEMBERS;
SELECT * FROM ASSIGS;
SELECT * FROM membership;

