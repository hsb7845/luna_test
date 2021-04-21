<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
CREATE TABLE "BUY_LIST"
(
    bseq           NUMBER(10,0)            NOT NULL, 
    id             VARCHAR2(20)   NOT NULL,
    pseq           NUMBER(10,0)              NOT NULL,
    buydate        DATE           NOT NULL,
    trackingnum    varchar2(20)              NOT NULL,
    delstatus      VARCHAR2(20)   NOT NULL,
    pcount         NUMBER(10,0)             NOT NULL,
    name           VARCHAR2(20)     NOT NULL,
    phone          VARCHAR2(50)      NOT NULL,
    address        VARCHAR2(100)   NOT NULL,
    CONSTRAINT bseq_pk  PRIMARY KEY (bseq)
)

CREATE TABLE STOCK
(
    pnum        NUMBER(10,0)          NOT NULL, 
    pname       VARCHAR2(20)     NOT NULL, 
    scount      NUMBER(10,0)             NOT NULL, 
    cost        NUMBER(10,0)            NOT NULL, 
    cnum        NUMBER(10,0)              NOT NULL, 
    pcontent    VARCHAR2(4000)         NOT NULL, 
    price       NUMBER(10,0)             NOT NULL, 
    CONSTRAINT pnum_pk PRIMARY KEY (pnum)
)

CREATE TABLE P_Option
(
    oseq        NUMBER(10,0)           NOT NULL, 
    pseq        NUMBER(10,0)           NULL, 
    otitle      VARCHAR2(20)    NULL, 
    ocontent    VARCHAR2(4000)    NULL, 
    CONSTRAINT  oseq_pk PRIMARY KEY (oseq)
)
</div>
</body>
</html>