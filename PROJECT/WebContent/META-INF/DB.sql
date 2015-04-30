--모든 테이블을 삭제하는 문장.
Begin
    for c in (select table_name from user_tables) loop
    execute immediate ('drop table '||c.table_name||' cascade constraints');
    end loop;
    End;
    .
run

/* 계정 */
CREATE TABLE ACCOUNTS (
   EMPNO NUMBER NOT NULL, /* 사원번호 */
   PWD VARCHAR2(20) NOT NULL, /* 패스워드 */
   EMAIL VARCHAR2(40) NOT NULL, /* 이메일주소 */
   ADDR VARCHAR2(200) NOT NULL, /* 주소 */
   CELPHONE VARCHAR2(20) NOT NULL, /* 핸드폰 번호 */
   P_PICTURE VARCHAR2(200), /* 프로필사진 */
   P_CONTENT VARCHAR2(200) /* 프로필내용 */
);

CREATE UNIQUE INDEX PK_ACCOUNTS
   ON ACCOUNTS (
      EMPNO ASC
   );

ALTER TABLE ACCOUNTS
   ADD
      CONSTRAINT PK_ACCOUNTS
      PRIMARY KEY (
         EMPNO
      );

/* 사원 */
CREATE TABLE EMP (
   EMPNO NUMBER NOT NULL, /* 사원번호 */
   ENAME VARCHAR2(20) NOT NULL, /* 이름 */
   TEAMNAME VARCHAR2(20), /* 팀명 */
   SIGNCHECK VARCHAR2(10) NOT NULL, /* 결제 확인 */
   MSGCHECK VARCHAR2(10) NOT NULL, /* 쪽지 확인 */
   ADMIN VARCHAR2(10) NOT NULL, /* 관리자 */
   DEPTCODE NUMBER, /* 부서코드 */
   TEAMCODE NUMBER, /* 팀코드 */
   GRADE NUMBER NOT NULL /* 직급코드 */
);

CREATE UNIQUE INDEX PK_EMP
   ON EMP (
      EMPNO ASC
   );

ALTER TABLE EMP
   ADD
      CONSTRAINT PK_EMP
      PRIMARY KEY (
         EMPNO
      );

/* 부서 */
CREATE TABLE DEPT (
   DEPTCODE NUMBER NOT NULL, /* 부서코드 */
   DEPTNAME VARCHAR2(20) NOT NULL /* 부서명 */
);

CREATE UNIQUE INDEX PK_DEPT
   ON DEPT (
      DEPTCODE ASC
   );

ALTER TABLE DEPT
   ADD
      CONSTRAINT PK_DEPT
      PRIMARY KEY (
         DEPTCODE
      );

/* 직급 */
CREATE TABLE GRADE (
   GRADE NUMBER NOT NULL, /* 직급코드 */
   GRADENAME VARCHAR2(20) NOT NULL /* 직급명 */
);

CREATE UNIQUE INDEX PK_GRADE
   ON GRADE (
      GRADE ASC
   );

ALTER TABLE GRADE
   ADD
      CONSTRAINT PK_GRADE
      PRIMARY KEY (
         GRADE
      );

/* 팀 */
CREATE TABLE TEAM (
   TEAMCODE NUMBER NOT NULL, /* 팀코드 */
   TEAMNAME VARCHAR2(20) NOT NULL, /* 팀명 */
   DEPTCODE NUMBER NOT NULL /* 부서코드 */
);

CREATE UNIQUE INDEX PK_TEAM
   ON TEAM (
      TEAMCODE ASC
   );

ALTER TABLE TEAM
   ADD
      CONSTRAINT PK_TEAM
      PRIMARY KEY (
         TEAMCODE
      );

/* 게시판 */
CREATE TABLE C_BRD (
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   NOTICE VARCHAR2(10) NOT NULL, /* 공지사항 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   REF NUMBER, /* 답글 */
   DPTH NUMBER, /* 들여쓰기 */
   STEP NUMBER, /* 답글계층 */
   COUNT NUMBER, /* 조회수 */
   ENAME VARCHAR2(20) /* 이름 */
);

CREATE UNIQUE INDEX PK_C_BRD
   ON C_BRD (
      NUM ASC
   );

ALTER TABLE C_BRD
   ADD
      CONSTRAINT PK_C_BRD
      PRIMARY KEY (
         NUM
      );

/* 쪽지 */
CREATE TABLE MESSAGE (
   MSGNUM NUMBER NOT NULL, /* 쪽지번호 */
   EMPNO NUMBER NOT NULL, /* 사원번호 */
   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   FILEPATH VARCHAR2(40), /* 첨부파일 */
   SENDEMPNO NUMBER NOT NULL /* 받는사람 */
);

CREATE UNIQUE INDEX PK_MESSAGE
   ON MESSAGE (
      MSGNUM ASC
   );

ALTER TABLE MESSAGE
   ADD
      CONSTRAINT PK_MESSAGE
      PRIMARY KEY (
         MSGNUM
      );

/* 자료실 */
CREATE TABLE C_DBRD (
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   DATA VARCHAR2(200), /* 자료 */
   COUNT NUMBER, /* 조회수 */
   ENAME VARCHAR2(20) /* 이름 */
);

CREATE UNIQUE INDEX PK_C_DBRD
   ON C_DBRD (
      NUM ASC
   );

ALTER TABLE C_DBRD
   ADD
      CONSTRAINT PK_C_DBRD
      PRIMARY KEY (
         NUM
      );

/* 공지사항 */
CREATE TABLE C_N_BRD (
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   COUNT NUMBER, /* 조회수 */
   ENAME VARCHAR2(20) /* 이름 */
);

CREATE UNIQUE INDEX PK_C_N_BRD
   ON C_N_BRD (
      NUM ASC
   );

ALTER TABLE C_N_BRD
   ADD
      CONSTRAINT PK_C_N_BRD
      PRIMARY KEY (
         NUM
      );

/* 부서 자료실 */
CREATE TABLE D_DBRD (
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   NUM NUMBER NOT NULL, /* 글번호 */
   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   DEPTCODE VARCHAR2(20) NOT NULL, /* 부서번호 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   DATA VARCHAR2(200), /* 자료 */
   REF NUMBER, /* 답글 */
   DPTH NUMBER, /* 들여쓰기 */
   STEP NUMBER, /* 답글계층 */
   COUNT NUMBER, /* 조회수 */
   ENAME VARCHAR2(20) /* 이름 */
);

CREATE UNIQUE INDEX PK_D_DBRD
   ON D_DBRD (
      NUM ASC
   );

ALTER TABLE D_DBRD
   ADD
      CONSTRAINT PK_D_DBRD
      PRIMARY KEY (
         NUM
      );

/* 부서 게시판 */
CREATE TABLE D_BRD (
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   NUM NUMBER NOT NULL, /* 글번호 */
   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   NOTICE VARCHAR2(10) NOT NULL, /* 공지사항 */
   DEPTCODE VARCHAR2(20) NOT NULL, /* 부서번호 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   REF NUMBER, /* 답글 */
   DPTH NUMBER, /* 들여쓰기 */
   STEP NUMBER, /* 답글계층 */
   COUNT NUMBER, /* 조회수 */
   ENAME VARCHAR2(20) /* 이름 */
);

CREATE UNIQUE INDEX PK_D_BRD
   ON D_BRD (
      NUM ASC
   );

ALTER TABLE D_BRD
   ADD
      CONSTRAINT PK_D_BRD
      PRIMARY KEY (
         NUM
      );

/* 팀 게시판 */
CREATE TABLE T_BRD (
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   NUM NUMBER NOT NULL, /* 글번호 */
   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   NOTICE VARCHAR2(10) NOT NULL, /* 공지사항 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   REF NUMBER, /* 답글 */
   DPTH NUMBER, /* 들여쓰기 */
   STEP NUMBER, /* 답글계층 */
   TEAMCODE NUMBER NOT NULL, /* 팀코드 */
   COUNT NUMBER, /* 조회수 */
   ENAME VARCHAR2(20) /* 이름 */
);

CREATE UNIQUE INDEX PK_T_BRD
   ON T_BRD (
      NUM ASC
   );

ALTER TABLE T_BRD
   ADD
      CONSTRAINT PK_T_BRD
      PRIMARY KEY (
         NUM
      );

/* 게시판 댓글 */
CREATE TABLE RE_C_BRD (
   RENUM NUMBER NOT NULL, /* 댓글번호 */
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   CONTENT VARCHAR2(200) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   ENAME VARCHAR2(20) /* 이름 */
);

CREATE UNIQUE INDEX PK_RE_C_BRD
   ON RE_C_BRD (
      RENUM ASC
   );

ALTER TABLE RE_C_BRD
   ADD
      CONSTRAINT PK_RE_C_BRD
      PRIMARY KEY (
         RENUM
      );

/* 관리자 부여 */
CREATE TABLE DOMAIN_SET (
   EMPNO NUMBER NOT NULL, /* 사원번호 */
   EMPTEL VARCHAR2(20) NOT NULL, /* 사내전화번호 */
   HIREDATE DATE NOT NULL, /* 입사일 */
   FIREDATE DATE, /* 퇴사일 */
   SEX VARCHAR2(200) NOT NULL, /* 성별 */
   BIRTH DATE NOT NULL, /* 생년월일 */
   exist VARCHAR2(10) NOT NULL /* 재직여부 */
);

CREATE UNIQUE INDEX PK_DOMAIN_SET
   ON DOMAIN_SET (
      EMPNO ASC
   );

ALTER TABLE DOMAIN_SET
   ADD
      CONSTRAINT PK_DOMAIN_SET
      PRIMARY KEY (
         EMPNO
      );

/* 부서 자료실 댓글 */
CREATE TABLE RE_D_DBRD (
   RENUM NUMBER NOT NULL, /* 댓글번호 */
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   CONTENT VARCHAR2(200) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   ENAME VARCHAR2(20) /* 이름 */
);

CREATE UNIQUE INDEX PK_RE_D_DBRD
   ON RE_D_DBRD (
      RENUM ASC
   );

ALTER TABLE RE_D_DBRD
   ADD
      CONSTRAINT PK_RE_D_DBRD
      PRIMARY KEY (
         RENUM
      );

/* 부서 게시판 댓글 */
CREATE TABLE RE_D_BRD (
   RENUM NUMBER NOT NULL, /* 댓글번호 */
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   CONTENT VARCHAR2(200) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   ENAME VARCHAR2(20) /* 이름 */
);

CREATE UNIQUE INDEX PK_RE_D_BRD
   ON RE_D_BRD (
      RENUM ASC
   );

ALTER TABLE RE_D_BRD
   ADD
      CONSTRAINT PK_RE_D_BRD
      PRIMARY KEY (
         RENUM
      );

/* 팀 게시판 댓글 */
CREATE TABLE RE_T_BRD (
   RENUM NUMBER NOT NULL, /* 댓글번호 */
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   CONTENT VARCHAR2(200) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   ENAME VARCHAR2(20) /* 이름 */
);

CREATE UNIQUE INDEX PK_RE_T_BRD
   ON RE_T_BRD (
      RENUM ASC
   );

ALTER TABLE RE_T_BRD
   ADD
      CONSTRAINT PK_RE_T_BRD
      PRIMARY KEY (
         RENUM
      );

/* 스케쥴 */
CREATE TABLE SCHEDULE (
   SCNUM NUMBER NOT NULL, /* 스케쥴 번호 */
   EMPNO NUMBER NOT NULL, /* 사원번호 */
   STARTDATE DATE NOT NULL, /* 시작 시간 */
   ENDDATE DATE NOT NULL, /* 끝나는 시간 */
   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(225) /* 내용 */
);

CREATE UNIQUE INDEX PK_SCHEDULE
   ON SCHEDULE (
      SCNUM ASC
   );

ALTER TABLE SCHEDULE
   ADD
      CONSTRAINT PK_SCHEDULE
      PRIMARY KEY (
         SCNUM
      );

/* 결제 */
CREATE TABLE SIGN (
   SIGNNUM NUMBER NOT NULL, /* 결제번호 */
   STARTER NUMBER, /* 기안자 */
   EMPNO NUMBER NOT NULL, /* 결제 올린사람 */
   GETSIGN NUMBER NOT NULL, /* 결제 받는사람 */
   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(225) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   REF NUMBER NOT NULL, /* 기안자 결제번호 */
   STEP NUMBER NOT NULL, /* 결제 계층 */
   STATUS VARCHAR2(10) NOT NULL /* 상태 */
);

CREATE UNIQUE INDEX PK_SIGN
   ON SIGN (
      SIGNNUM ASC
   );

ALTER TABLE SIGN
   ADD
      CONSTRAINT PK_SIGN
      PRIMARY KEY (
         SIGNNUM
      );

ALTER TABLE ACCOUNTS
   ADD
      CONSTRAINT FK_DOMAIN_SET_TO_ACCOUNTS
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES DOMAIN_SET (
         EMPNO
      );

ALTER TABLE EMP
   ADD
      CONSTRAINT FK_GRADE_TO_EMP
      FOREIGN KEY (
         GRADE
      )
      REFERENCES GRADE (
         GRADE
      );

ALTER TABLE EMP
   ADD
      CONSTRAINT FK_TEAM_TO_EMP
      FOREIGN KEY (
         TEAMCODE
      )
      REFERENCES TEAM (
         TEAMCODE
      );

ALTER TABLE EMP
   ADD
      CONSTRAINT FK_DEPT_TO_EMP
      FOREIGN KEY (
         DEPTCODE
      )
      REFERENCES DEPT (
         DEPTCODE
      );

ALTER TABLE TEAM
   ADD
      CONSTRAINT FK_DEPT_TO_TEAM
      FOREIGN KEY (
         DEPTCODE
      )
      REFERENCES DEPT (
         DEPTCODE
      );

ALTER TABLE C_BRD
   ADD
      CONSTRAINT FK_EMP_TO_C_BRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE MESSAGE
   ADD
      CONSTRAINT FK_EMP_TO_MESSAGE
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE C_DBRD
   ADD
      CONSTRAINT FK_EMP_TO_C_DBRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE C_N_BRD
   ADD
      CONSTRAINT FK_EMP_TO_C_N_BRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE D_DBRD
   ADD
      CONSTRAINT FK_EMP_TO_D_DBRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE D_BRD
   ADD
      CONSTRAINT FK_EMP_TO_D_BRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE T_BRD
   ADD
      CONSTRAINT FK_EMP_TO_T_BRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE RE_C_BRD
   ADD
      CONSTRAINT FK_C_BRD_TO_RE_C_BRD
      FOREIGN KEY (
         NUM
      )
      REFERENCES C_BRD (
         NUM
      );

ALTER TABLE RE_C_BRD
   ADD
      CONSTRAINT FK_EMP_TO_RE_C_BRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE DOMAIN_SET
   ADD
      CONSTRAINT FK_EMP_TO_DOMAIN_SET
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE RE_D_DBRD
   ADD
      CONSTRAINT FK_D_DBRD_TO_RE_D_DBRD
      FOREIGN KEY (
         NUM
      )
      REFERENCES D_DBRD (
         NUM
      );

ALTER TABLE RE_D_DBRD
   ADD
      CONSTRAINT FK_EMP_TO_RE_D_DBRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE RE_D_BRD
   ADD
      CONSTRAINT FK_D_BRD_TO_RE_D_BRD
      FOREIGN KEY (
         NUM
      )
      REFERENCES D_BRD (
         NUM
      );

ALTER TABLE RE_D_BRD
   ADD
      CONSTRAINT FK_EMP_TO_RE_D_BRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE RE_T_BRD
   ADD
      CONSTRAINT FK_T_BRD_TO_RE_T_BRD
      FOREIGN KEY (
         NUM
      )
      REFERENCES T_BRD (
         NUM
      );

ALTER TABLE RE_T_BRD
   ADD
      CONSTRAINT FK_EMP_TO_RE_T_BRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE SCHEDULE
   ADD
      CONSTRAINT FK_EMP_TO_SCHEDULE
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE SIGN
   ADD
      CONSTRAINT FK_EMP_TO_SIGN
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );
      
-- memberinfo 뷰 생성 쿼리문
create or replace view memberinfo
as 
  (select e.empno as empno, e.ename as ename, ds.birth as birth, ds.sex as sex, a.celphone as celphone, a.email as email, 
  e.deptcode as deptcode, d.deptname as deptname, e.teamcode as teamcode, e.teamname as teamname, e.grade as grade, g.gradename as gradename, 
  ds.emptel as emptel, a.p_picture as p_picture, a.p_content as p_content
  from emp e
  join domain_set ds
  on e.empno = ds.empno
  join accounts a
  on e.empno = a.empno
  join dept d
  on e.deptcode = d.deptcode
  join grade g
  on e.grade = g.grade);
  
commit;
      
create sequence Comp_board_num --사내게시판 num 시퀀스
     increment by 1 
     start with 1        
     nocache;
     
create sequence Comp_board_Refer -- 사내게시판 refer 시퀀스
     increment by 1 
     start with 1        
     nocache;
     
create sequence Comp_Databoard_Num -- 사내자료실 num 시퀀스
     increment by 1 
     start with 1        
     nocache;
     
     
--직급 추가     
insert into grade (grade,gradename) values(1,'대표이사');
insert into grade (grade,gradename) values(2,'부장');
insert into grade (grade,gradename) values(3,'팀장');
insert into grade (grade,gradename) values(4,'사원');
     
--부서코드 추가
insert into dept (deptcode,deptname) values(100,'대표이사');
insert into dept (deptcode,deptname) values(200,'개발부');
insert into dept (deptcode,deptname) values(300,'총무부');
insert into dept (deptcode,deptname) values(400,'영업부');

--팀코드 추가
insert into team (deptcode,teamcode,teamname) values(100,1000,'대표이사');
insert into team (deptcode,teamcode,teamname) values(200,2000,'개발부장');
insert into team (deptcode,teamcode,teamname) values(200,2001,'솔루션팀');
insert into team (deptcode,teamcode,teamname) values(200,2002,'외주팀');
insert into team (deptcode,teamcode,teamname) values(300,3000,'총무부장');
insert into team (deptcode,teamcode,teamname) values(300,3001,'경리팀');
insert into team (deptcode,teamcode,teamname) values(300,3002,'인사팀');
insert into team (deptcode,teamcode,teamname) values(300,3003,'경영팀');
insert into team (deptcode,teamcode,teamname) values(400,4000,'영업부장');
insert into team (deptcode,teamcode,teamname) values(400,4001,'기술경영팀');
insert into team (deptcode,teamcode,teamname) values(400,4002,'A/S팀');
     
commit;

--쪽지... 결제 확인... 어떻게 할것인가 현재 not null 이라 무조건 넣어 줘야함...
insert into emp (empno,ename,teamname,signcheck,msgcheck,admin,deptcode,teamcode,grade)values(150129,'홍순호','대표이사','true','true','true',100,1000,1);
---------------------------------------------------------------------------------------------(  사번  ,  이름    ,  팀이름 , 사인체크, 메세지체크,어드민 ,부서코드,팀코드,직급)   
commit;
      
insert into domain_set (empno,emptel,hiredate,firedate,sex,birth,exist) values (150129,'02-2286-0321',sysdate,sysdate,'남자',sysdate,'true');
-------------------------------------------------------------------------------( 사번    ,     사내전화번호    ,  입사일    , 퇴사일    , 성별   , 생년월일 , 재직여부)
commit;


--회원가입
--insert into accounts (empno,pwd,email,addr,celphone,p_picture,p_content) values (150129,1004,'0113784358@naver.com','서울시 성동구 행당동 317-130','010-5378-4358','사진경호','프로필내용'); 
--commit;

