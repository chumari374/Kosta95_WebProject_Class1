/* 계정 */
CREATE TABLE Accounts (
   EMPNO NUMBER NOT NULL, /* 사원번호 */
   PWD VARCHAR2(20) NOT NULL, /* 패스워드 */
   EMAIL VARCHAR2(40) NOT NULL, /* 이메일주소 */
   ADDR VARCHAR2(20) NOT NULL, /* 주소 */
   CELPHONE VARCHAR2(20) NOT NULL, /* 핸드폰 번호 */
   P_PICTURE VARCHAR2(200), /* 프로필사진 */
   P_CONTENT VARCHAR2(200), /* 프로필내용 */
   SIGNCHECK VARCHAR2(10) NOT NULL, /* 결제 확인 */
   MSGCHECK VARCHAR2(10) NOT NULL /* 쪽지 확인 */
);

CREATE UNIQUE INDEX PK_Accounts
   ON Accounts (
      EMPNO ASC
   );

ALTER TABLE Accounts
   ADD
      CONSTRAINT PK_Accounts
      PRIMARY KEY (
         EMPNO
      );

/* 사원 */
CREATE TABLE EMP (
   EMPNO NUMBER NOT NULL, /* 사원번호 */
   ENAME VARCHAR2(20) NOT NULL, /* 이름 */
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
CREATE TABLE Grade (
   GRADE NUMBER NOT NULL, /* 직급코드 */
   GRADENAME VARCHAR2(20) NOT NULL /* 직급명 */
);

CREATE UNIQUE INDEX PK_Grade
   ON Grade (
      GRADE ASC
   );

ALTER TABLE Grade
   ADD
      CONSTRAINT PK_Grade
      PRIMARY KEY (
         GRADE
      );

/* 팀 */
CREATE TABLE Team (
   DEPTCODE NUMBER NOT NULL, /* 부서코드 */
   TEAMCODE NUMBER NOT NULL, /* 팀코드 */
   TEAMNAME VARCHAR2(20) NOT NULL /* 팀명 */
);

CREATE UNIQUE INDEX PK_Team
   ON Team (
      TEAMCODE ASC
   );

ALTER TABLE Team
   ADD
      CONSTRAINT PK_Team
      PRIMARY KEY (
         TEAMCODE
      );

/* 게시판 */
CREATE TABLE C_BRD (
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   NOTICE VARCHAR2(10) NOT NULL, /* 공지사항 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   REF NUMBER, /* 답글 */
   DPTH NUMBER, /* 들여쓰기 */
   STEP NUMBER, /* 답글계층 */
   COUNT NUMBER /* 조회수 */
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
CREATE TABLE Message (
   MSGNUM NUMBER NOT NULL, /* 쪽지번호 */
   EMPNO NUMBER NOT NULL, /* 사원번호 */
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   FILEPATH VARCHAR2(40), /* 첨부파일 */
   SENDEMPNO NUMBER NOT NULL /* 받는사람 */
);

CREATE UNIQUE INDEX PK_Message
   ON Message (
      MSGNUM ASC
   );

ALTER TABLE Message
   ADD
      CONSTRAINT PK_Message
      PRIMARY KEY (
         MSGNUM
      );

/* 자료실 */
CREATE TABLE C_DBRD (
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   DATA VARCHAR2(200), /* 자료 */
   COUNT NUMBER /* 조회수 */
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
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   READNUM NUMBER /* 조회수 */
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
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   DEPTCODE VARCHAR2(20) NOT NULL, /* 부서번호 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   DATA VARCHAR2(200), /* 자료 */
   COUNT NUMBER /* 조회수 */
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
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   NOTICE VARCHAR2(10) NOT NULL, /* 공지사항 */
   DEPTCODE VARCHAR2(20) NOT NULL, /* 부서번호 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   REF NUMBER, /* 답글 */
   DPTH NUMBER, /* 들여쓰기 */
   STEP NUMBER, /* 답글계층 */
   COUNT NUMBER /* 조회수 */
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
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
   NOTICE VARCHAR2(10) NOT NULL, /* 공지사항 */
   TEAMCODE VARCHAR2(20) NOT NULL, /* 팀번호 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   REF NUMBER, /* 답글 */
   DPTH NUMBER, /* 들여쓰기 */
   STEP NUMBER, /* 답글계층 */
   COUNT NUMBER /* 조회수 */
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
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(200) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL /* 작성일자 */
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

/* 자료실 댓글 */
CREATE TABLE RE_C_DBRD (
   RENUM NUMBER NOT NULL, /* 댓글번호 */
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(200) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL /* 작성일자 */
);

CREATE UNIQUE INDEX PK_RE_C_DBRD
   ON RE_C_DBRD (
      RENUM ASC
   );

ALTER TABLE RE_C_DBRD
   ADD
      CONSTRAINT PK_RE_C_DBRD
      PRIMARY KEY (
         RENUM
      );

/* 관리자 부여 */
CREATE TABLE Domain_Set (
   EMPNO NUMBER NOT NULL, /* 사원번호 */
   EMPTEL VARCHAR2(20) NOT NULL, /* 사내전화번호 */
   HIREDATE DATE NOT NULL, /* 입사일 */
   FIREDATE DATE, /* 퇴사일 */
   SEX VARCHAR2(2) NOT NULL, /* 성별 */
   BIRTH DATE NOT NULL, /* 생년월일 */
   ADMIN VARCHAR2(10), /* 관리자 */
   exist VARCHAR2(10) /* 재직여부 */
);

CREATE UNIQUE INDEX PK_Domain_Set
   ON Domain_Set (
      EMPNO ASC
   );

ALTER TABLE Domain_Set
   ADD
      CONSTRAINT PK_Domain_Set
      PRIMARY KEY (
         EMPNO
      );

/* 부서 자료실 댓글 */
CREATE TABLE RE_D_DBRD (
   RENUM NUMBER NOT NULL, /* 댓글번호 */
   NUM NUMBER NOT NULL, /* 글번호 */
   EMPNO NUMBER NOT NULL, /* 작성자번호 */
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(200) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL /* 작성일자 */
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
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(200) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL /* 작성일자 */
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
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(200) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL /* 작성일자 */
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
CREATE TABLE Schedule (
   SCNUM NUMBER NOT NULL, /* 스케쥴 번호 */
   EMPNO NUMBER NOT NULL, /* 사원번호 */
   STARTDATE DATE NOT NULL, /* 시작 시간 */
   ENDDATE DATE NOT NULL, /* 끝나는 시간 */
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(225) /* 내용 */
);

CREATE UNIQUE INDEX PK_Schedule
   ON Schedule (
      SCNUM ASC
   );

ALTER TABLE Schedule
   ADD
      CONSTRAINT PK_Schedule
      PRIMARY KEY (
         SCNUM
      );

/* 결제 */
CREATE TABLE Sign (
   SIGNNUM NUMBER NOT NULL, /* 결제번호 */
   EMPNO NUMBER NOT NULL, /* 결제 올린사람 */
   GETSIGN NUMBER NOT NULL, /* 결제 받는사람 */
   TITLE VARCHAR2(20) NOT NULL, /* 제목 */
   CONTENT VARCHAR2(225) NOT NULL, /* 내용 */
   WRITE_DATE DATE NOT NULL, /* 작성일자 */
   REF NUMBER NOT NULL, /* 기안자 결제번호 */
   STEP NUMBER NOT NULL, /* 결제 계층 */
   STATUS VARCHAR2(10) NOT NULL /* 상태 */
);

CREATE UNIQUE INDEX PK_Sign2
   ON Sign (
      SIGNNUM ASC
   );

ALTER TABLE Sign
   ADD
      CONSTRAINT PK_Sign2
      PRIMARY KEY (
         SIGNNUM
      );

ALTER TABLE Accounts
   ADD
      CONSTRAINT FK_Domain_Set_TO_Accounts
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES Domain_Set (
         EMPNO
      );

ALTER TABLE EMP
   ADD
      CONSTRAINT FK_Team_TO_EMP
      FOREIGN KEY (
         TEAMCODE
      )
      REFERENCES Team (
         TEAMCODE
      );

ALTER TABLE EMP
   ADD
      CONSTRAINT FK_Grade_TO_EMP
      FOREIGN KEY (
         GRADE
      )
      REFERENCES Grade (
         GRADE
      );

ALTER TABLE Team
   ADD
      CONSTRAINT FK_DEPT_TO_Team
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

ALTER TABLE Message
   ADD
      CONSTRAINT FK_EMP_TO_Message2
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

ALTER TABLE RE_C_DBRD
   ADD
      CONSTRAINT FK_C_DBRD_TO_RE_C_DBRD
      FOREIGN KEY (
         NUM
      )
      REFERENCES C_DBRD (
         NUM
      );

ALTER TABLE RE_C_DBRD
   ADD
      CONSTRAINT FK_EMP_TO_RE_C_DBRD
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE Domain_Set
   ADD
      CONSTRAINT FK_EMP_TO_Domain_Set
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

ALTER TABLE Schedule
   ADD
      CONSTRAINT FK_EMP_TO_Schedule
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );

ALTER TABLE Sign
   ADD
      CONSTRAINT FK_EMP_TO_Sign2
      FOREIGN KEY (
         EMPNO
      )
      REFERENCES EMP (
         EMPNO
      );
      
      
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
insert into team (deptcode,teamcode,teamname) values(200,2001,'솔루션팀');
insert into team (deptcode,teamcode,teamname) values(200,2002,'외주팀');
insert into team (deptcode,teamcode,teamname) values(300,3001,'경리팀');
insert into team (deptcode,teamcode,teamname) values(300,3002,'인사팀');
insert into team (deptcode,teamcode,teamname) values(300,3003,'경영팀');
insert into team (deptcode,teamcode,teamname) values(400,4001,'기술경영팀');
insert into team (deptcode,teamcode,teamname) values(400,4002,'A/S팀');
     
commit;

insert into emp (empno,ename,deptcode,teamcode,grade)values(150129,'홍순호',100,1000,1);
   
ALTER TABLE domain_set modify( --남성 여성 6글자 이상이어야 함...
  sex varchar2(6)
      );   
      
insert into domain_set (empno,emptel,hiredate,firedate,sex,birth,exist) values (150129,'02-2286-0321',sysdate,sysdate,'남자',sysdate,'true');

commit;

ALTER TABLE accounts modify( --주소 50자는 크기는 줘야할듯...
  ADDR varchar2(50)
      );   
      

--쪽지... 결제 확인... 어떻게 할것인가 현재 not null 이라 무조건 넣어 줘야함...

insert into accounts (empno,pwd,email,addr,celphone,signcheck,msgcheck) values (150129,1004,'0113784358@naver.com','서울시 성동구 행당동 317-130','02-2293-4358','true','true'); 
commit;



--어드민이 도메인 셋이 있어... 뷰쿼리가 이상해 일단 내가만든건데...
create or replace view memberinfo
as 
  (select e.empno as empno, e.ename as ename, a.celphone as celphone, a.email as email, 
  e.deptcode as deptcode, d.deptname as deptname, e.teamcode as teamcode, t.teamname as teamname, e.grade as grade, g.gradename as gradename, 
  ds.emptel as emptel, a.p_picture as p_picture, a.p_content as p_content, ds.admin as admin
  from emp e
  join domain_set ds
  on e.empno = ds.empno
  join accounts a
  on e.empno = a.empno
  join dept d
  on e.deptcode = d.deptcode
  join grade g
  on e.grade = g.grade
  join team t
  on e.teamcode = t.teamcode);
