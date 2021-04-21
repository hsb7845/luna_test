<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 멤버 테이블  -->
CREATE TABLE "MEMBER" (
	ID VARCHAR2(20),
	PWD VARCHAR2(20),
	EMAIL VARCHAR2(20),
	EMAIL_CHK VARCHAR2(20),
	ADDRESS VARCHAR2(100),
	BIRTH DATE,
	SEX VARCHAR2(100),
	PHONE VARCHAR2(50),
	JOINDATE DATE,
	ADMIN VARCHAR2(20),
	NICKNAME VARCHAR2(20),
	NAME VARCHAR2(20),
	POINT NUMBER(38,0),
	CONSTRAINT "MEMBER_PK" PRIMARY KEY ("ID")
);

INSERT INTO "MEMBER" (ID, PWD, EMAIL, EMAIL_CHK, ADDRESS, BIRTH, SEX, PHONE, JOINDATE, ADMIN, NICKNAME, NAME, POINT) 
VALUES('111', '222', '222@naver.com', '222', '서울 관악구', to_date('2021-02-01','yyyy-MM-dd'), '여', '01012341234', sysdate, '222', '222', '222', 10);



<!-- cart테이블 -->
CREATE TABLE CART (
	SEQ NUMBER(38,0) NOT NULL,
	ID VARCHAR2(100),
	PNUM NUMBER(38,0),
	PCOUNT NUMBER(38,0)
);

INSERT INTO CART (SEQ, ID, PNUM, PCOUNT) 
VALUES(1, '111', 1, 1);


<!-- img_file 테이블 -->

CREATE TABLE IMG_FILE (
	IMGNUM NUMBER(38,0),
	FILESIZE VARCHAR2(100),
	IMGNAME VARCHAR2(20),
	ID VARCHAR2(20),
	PSEQ NUMBER(38,0),
	RSEQ NUMBER(38,0),
	ESEQ NUMBER(38,0)
);

INSERT INTO IMG_FILE (IMGNUM, FILESIZE, IMGNAME, ID, PSEQ, RSEQ, ESEQ) 
VALUES(1, '400*400', 'pen', '111', 1, 1, 1);


</body>
</html>