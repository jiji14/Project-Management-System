SELECT * FROM board;
SELECT * FROM boardfile;

  SELECT * FROM (
	      SELECT ROWNUM rn, a.*, level FROM BoardExp a 
	      where 1=1
	       START WITH refnum=0
	         CONNECT BY PRIOR num = refnum
	         ORDER siblings BY NUM DESC )
	         WHERE rn BETWEEN 1 AND 10;
	 
        
CREATE TABLE board(
no int,
refno int,
title varchar2(100),
content varchar2(1000),
writer varchar2(50),
readcnt int,
credte DATE,
uptdte DATE,
etc varchar2(200)
);

CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;

	INSERT INTO board values(board_seq.nextval,#{refno},#{title},
	#{content},#{writer},0,sysdate,sysdate,'');

SELECT board_seq.nextval FROM dual;	
	         

INSERT INTO board values(board_seq.nextval, 2, '아하', '저기', 'Gamora', 0, sysdate, sysdate);
INSERT INTO board values(board_seq.nextval, 3, '아아', '이거', 'Rocket', 0, sysdate, sysdate);
INSERT INTO board values(board_seq.nextval, 4, '드디어', '어렵다', 'Druthu', 0, sysdate, sysdate);
INSERT INTO board values(board_seq.nextval, 5, '완료', '됬다', 'Taserface', 0, sysdate, sysdate);
INSERT INTO board values(board_seq.nextval, 6, '하였다', '드디어', 'Nand', 0, sysdate, sysdate);
INSERT INTO board values(board_seq.nextval, 7, '오예', '완료다', 'Flash', 0, sysdate, sysdate);

SELECT * FROM board;
--답글 등록..(5번글 기준)
-- NO: 7
-- refno : 5
-- title: RE:문의합니다(변경)
-- content : 입력할 내용 -----원본글 -----

 
 LECT count(*) FROM board;


SELECT * FROM(
SELECT rownum rn, a.*, LEVEL FROM board a
WHERE 1=1
START WITH refno=0
CONNECT BY PRIOR NO = REFNO
ORDER siblings BY NO DESC)
WHERE rn BETWEEN 11 AND 15; 
-- 5개씩 보여주는 데이터 처리 페이지에서 두번쨰 페이지
-- 1. 페이징 처리는 해당 페이지의 시작번호와 마지막 번호를 입력받아 처리되어야 한다.
-- 2. 페이지 번호와 한번에 보여줄 데이터 건수를  통해서 페이지의 시작번호와 마지막번호가 나온다. 몇개씩 보여줄것인가와 시작번호/마지막번호를 기준으로 몇페이지로 잘라서 나오는게 핵심.
-- 3. 하단에 화면 인터페이스 정의
--		[1][2][3][4]
-- 4. 마지막 번호는 데이터 총건수와 한페이지에 보여줄 데이터 건수를 통해서 나올 수 있다. 
--    ex) 총데이터 건수가 17, 한번에 보여줄 페이지수 5이면 총 페이지 수는? 4  CEIL(17/5)
--    ex) 총데이터 건수가 20, 한번에 보여줄 페이지수 5이면 총 페이지 수는? 4  CEIL(20/5)
--    ex) 총데이터 건수가 15, 한번에 보여줄 페이지수 5이면 총 페이지 수는? 3  CEIL(15/5)

-- # 페이지 처리 개발 순서
--1. 총건수를 데이터 로딩 처리.
--2. 지정된 한페이지에서 보여줄 데이터건수를 설정하여, 화면에 보여 줄 페이지 LIST를 하단에 처리한다. 
--3. 리스트에서 클릭했을 때, 로직에 의해 시작번호와 마지막번호를 통해, 
--4. 해당 페이지에 로딩될 데이터를 처리한다.

SELECT * FROM boardfile;

CREATE TABLE boardfile(
no int,
fname varchar2(200),
credte DATE,
uptdte DATE,
etc varchar2(200)
);


INSERT INTO BOARDFILE values(27,'파일명',sysdate, sysdate, '');
INSERT INTO BOARDFILE values(28,'파일명',sysdate, sysdate, '');
INSERT INTO BOARDFILE values(29,'파일명',sysdate, sysdate, '');
INSERT INTO BOARDFILE values(board_seq.currval,'파일명',sysdate, sysdate,'');
SELECT * FROM boardfile;

SELECT fname FROM BOARDFILE
WHERE NO = 29;
 