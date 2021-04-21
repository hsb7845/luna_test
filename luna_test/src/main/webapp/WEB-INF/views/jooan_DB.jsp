<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
--Create문
CREATE TABLE "STUDY"."COUPON" 
   (	"CSEQ" NUMBER(*,0) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(20), 
	"DISCOUNT" VARCHAR2(20), 
	"ID" VARCHAR2(20), 
	 CONSTRAINT "COUPON_PK" PRIMARY KEY ("CSEQ")

CREATE TABLE "STUDY"."P_BOARD" 
   (	"PSEQ" NUMBER(*,0) NOT NULL ENABLE, 
	"PNUM" NUMBER(*,0), 
	"PCONTENT" VARCHAR2(20), 
	"PDATE" DATE, 
	"PTITLE" VARCHAR2(100), 
	 CONSTRAINT "P_BOARD_PK" PRIMARY KEY ("PSEQ"))
	 
CREATE TABLE "STUDY"."P_CATEGORY" 
   (	"CNUM" NUMBER(*,0) NOT NULL ENABLE, 
	"PTYPE" VARCHAR2(100), 
	"PCOLOR" VARCHAR2(100), 
	"PSIZE" VARCHAR2(100), 
	 CONSTRAINT "P_CATEGORY_PK" PRIMARY KEY ("CNUM"))
	 
	 
--SELECT문
SELECT CSEQ, CONTENT, DISCOUNT, ID FROM COUPON 

SELECT CSEQ, CONTENT, DISCOUNT, ID FROM COUPON WHERE CSEQ = ?

SELECT PSEQ, PNUM, PCONTENT, PDATE, PTITLE FROM P_BOARD

SELECT PSEQ, PNUM, PCONTENT, PDATE, PTITLE FROM P_BOARD WHERE PSEQ =?

SELECT CNUM, PTYPE, PCOLOR, PSIZE FROM P_CATEGORY

SELECT CNUM, PTYPE, PCOLOR, PSIZE FROM P_CATEGORY WHERE CNUM =? 

--INSERT문
INSERT INTO coupon 
VALUES(cseq.nextval, '할인쿠폰', '2천원쿠폰', 'jooan')

INSERT INTO P_BOARD 
values(pseq.nextval, 1, '신상', sysdate, '시그니쳐목걸이')

INSERT INTO P_CATEGORY 
values(1, '형태?', 'red', '15호')

--UPDATE 문

UPDATE COUPON SET
CONTENT =?, DISCOUNT =?, ID =?
WHERE CSEQ = ?

UPDATE P_BOARD SET
PNUM =?, PCONTENT =?, PDATE =?, PTITLE =?
WHERE PSEQ = ?

UPDATE P_CATEGORY SET
PTYPE =?, PCOLOR =?, PSIZE =?
WHERE CNUM = ?

--DELETE 문

DELETE COUPON 
WHERE CSEQ = ?

DELETE P_BOARD
WHERE PSEQ = ?

DELETE P_CATEGORY 
WHERE CNUM = ?


</body>
</html>