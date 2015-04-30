--��� ���̺��� �����ϴ� ����.
Begin
    for c in (select table_name from user_tables) loop
    execute immediate ('drop table '||c.table_name||' cascade constraints');
    end loop;
    End;
    .
run

/* ���� */
CREATE TABLE ACCOUNTS (
   EMPNO NUMBER NOT NULL, /* �����ȣ */
   PWD VARCHAR2(20) NOT NULL, /* �н����� */
   EMAIL VARCHAR2(40) NOT NULL, /* �̸����ּ� */
   ADDR VARCHAR2(200) NOT NULL, /* �ּ� */
   CELPHONE VARCHAR2(20) NOT NULL, /* �ڵ��� ��ȣ */
   P_PICTURE VARCHAR2(200), /* �����ʻ��� */
   P_CONTENT VARCHAR2(200) /* �����ʳ��� */
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

/* ��� */
CREATE TABLE EMP (
   EMPNO NUMBER NOT NULL, /* �����ȣ */
   ENAME VARCHAR2(20) NOT NULL, /* �̸� */
   TEAMNAME VARCHAR2(20), /* ���� */
   SIGNCHECK VARCHAR2(10) NOT NULL, /* ���� Ȯ�� */
   MSGCHECK VARCHAR2(10) NOT NULL, /* ���� Ȯ�� */
   ADMIN VARCHAR2(10) NOT NULL, /* ������ */
   DEPTCODE NUMBER, /* �μ��ڵ� */
   TEAMCODE NUMBER, /* ���ڵ� */
   GRADE NUMBER NOT NULL /* �����ڵ� */
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

/* �μ� */
CREATE TABLE DEPT (
   DEPTCODE NUMBER NOT NULL, /* �μ��ڵ� */
   DEPTNAME VARCHAR2(20) NOT NULL /* �μ��� */
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

/* ���� */
CREATE TABLE GRADE (
   GRADE NUMBER NOT NULL, /* �����ڵ� */
   GRADENAME VARCHAR2(20) NOT NULL /* ���޸� */
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

/* �� */
CREATE TABLE TEAM (
   TEAMCODE NUMBER NOT NULL, /* ���ڵ� */
   TEAMNAME VARCHAR2(20) NOT NULL, /* ���� */
   DEPTCODE NUMBER NOT NULL /* �μ��ڵ� */
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

/* �Խ��� */
CREATE TABLE C_BRD (
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   TITLE VARCHAR2(200) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   NOTICE VARCHAR2(10) NOT NULL, /* �������� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   REF NUMBER, /* ��� */
   DPTH NUMBER, /* �鿩���� */
   STEP NUMBER, /* ��۰��� */
   COUNT NUMBER, /* ��ȸ�� */
   ENAME VARCHAR2(20) /* �̸� */
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

/* ���� */
CREATE TABLE MESSAGE (
   MSGNUM NUMBER NOT NULL, /* ������ȣ */
   EMPNO NUMBER NOT NULL, /* �����ȣ */
   TITLE VARCHAR2(200) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   FILEPATH VARCHAR2(40), /* ÷������ */
   SENDEMPNO NUMBER NOT NULL /* �޴»�� */
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

/* �ڷ�� */
CREATE TABLE C_DBRD (
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   TITLE VARCHAR2(200) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   DATA VARCHAR2(200), /* �ڷ� */
   COUNT NUMBER, /* ��ȸ�� */
   ENAME VARCHAR2(20) /* �̸� */
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

/* �������� */
CREATE TABLE C_N_BRD (
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   TITLE VARCHAR2(200) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   COUNT NUMBER, /* ��ȸ�� */
   ENAME VARCHAR2(20) /* �̸� */
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

/* �μ� �ڷ�� */
CREATE TABLE D_DBRD (
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   TITLE VARCHAR2(200) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   DEPTCODE VARCHAR2(20) NOT NULL, /* �μ���ȣ */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   DATA VARCHAR2(200), /* �ڷ� */
   REF NUMBER, /* ��� */
   DPTH NUMBER, /* �鿩���� */
   STEP NUMBER, /* ��۰��� */
   COUNT NUMBER, /* ��ȸ�� */
   ENAME VARCHAR2(20) /* �̸� */
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

/* �μ� �Խ��� */
CREATE TABLE D_BRD (
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   TITLE VARCHAR2(200) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   NOTICE VARCHAR2(10) NOT NULL, /* �������� */
   DEPTCODE VARCHAR2(20) NOT NULL, /* �μ���ȣ */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   REF NUMBER, /* ��� */
   DPTH NUMBER, /* �鿩���� */
   STEP NUMBER, /* ��۰��� */
   COUNT NUMBER, /* ��ȸ�� */
   ENAME VARCHAR2(20) /* �̸� */
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

/* �� �Խ��� */
CREATE TABLE T_BRD (
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   TITLE VARCHAR2(200) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   NOTICE VARCHAR2(10) NOT NULL, /* �������� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   REF NUMBER, /* ��� */
   DPTH NUMBER, /* �鿩���� */
   STEP NUMBER, /* ��۰��� */
   TEAMCODE NUMBER NOT NULL, /* ���ڵ� */
   COUNT NUMBER, /* ��ȸ�� */
   ENAME VARCHAR2(20) /* �̸� */
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

/* �Խ��� ��� */
CREATE TABLE RE_C_BRD (
   RENUM NUMBER NOT NULL, /* ��۹�ȣ */
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   CONTENT VARCHAR2(200) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   ENAME VARCHAR2(20) /* �̸� */
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

/* ������ �ο� */
CREATE TABLE DOMAIN_SET (
   EMPNO NUMBER NOT NULL, /* �����ȣ */
   EMPTEL VARCHAR2(20) NOT NULL, /* �系��ȭ��ȣ */
   HIREDATE DATE NOT NULL, /* �Ի��� */
   FIREDATE DATE, /* ����� */
   SEX VARCHAR2(200) NOT NULL, /* ���� */
   BIRTH DATE NOT NULL, /* ������� */
   exist VARCHAR2(10) NOT NULL /* �������� */
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

/* �μ� �ڷ�� ��� */
CREATE TABLE RE_D_DBRD (
   RENUM NUMBER NOT NULL, /* ��۹�ȣ */
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   CONTENT VARCHAR2(200) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   ENAME VARCHAR2(20) /* �̸� */
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

/* �μ� �Խ��� ��� */
CREATE TABLE RE_D_BRD (
   RENUM NUMBER NOT NULL, /* ��۹�ȣ */
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   CONTENT VARCHAR2(200) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   ENAME VARCHAR2(20) /* �̸� */
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

/* �� �Խ��� ��� */
CREATE TABLE RE_T_BRD (
   RENUM NUMBER NOT NULL, /* ��۹�ȣ */
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   CONTENT VARCHAR2(200) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   ENAME VARCHAR2(20) /* �̸� */
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

/* ������ */
CREATE TABLE SCHEDULE (
   SCNUM NUMBER NOT NULL, /* ������ ��ȣ */
   EMPNO NUMBER NOT NULL, /* �����ȣ */
   STARTDATE DATE NOT NULL, /* ���� �ð� */
   ENDDATE DATE NOT NULL, /* ������ �ð� */
   TITLE VARCHAR2(200) NOT NULL, /* ���� */
   CONTENT VARCHAR2(225) /* ���� */
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

/* ���� */
CREATE TABLE SIGN (
   SIGNNUM NUMBER NOT NULL, /* ������ȣ */
   STARTER NUMBER, /* ����� */
   EMPNO NUMBER NOT NULL, /* ���� �ø���� */
   GETSIGN NUMBER NOT NULL, /* ���� �޴»�� */
   TITLE VARCHAR2(200) NOT NULL, /* ���� */
   CONTENT VARCHAR2(225) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   REF NUMBER NOT NULL, /* ����� ������ȣ */
   STEP NUMBER NOT NULL, /* ���� ���� */
   STATUS VARCHAR2(10) NOT NULL /* ���� */
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
      
-- memberinfo �� ���� ������
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
      
create sequence Comp_board_num --�系�Խ��� num ������
     increment by 1 
     start with 1        
     nocache;
     
create sequence Comp_board_Refer -- �系�Խ��� refer ������
     increment by 1 
     start with 1        
     nocache;
     
create sequence Comp_Databoard_Num -- �系�ڷ�� num ������
     increment by 1 
     start with 1        
     nocache;
     
     
--���� �߰�     
insert into grade (grade,gradename) values(1,'��ǥ�̻�');
insert into grade (grade,gradename) values(2,'����');
insert into grade (grade,gradename) values(3,'����');
insert into grade (grade,gradename) values(4,'���');
     
--�μ��ڵ� �߰�
insert into dept (deptcode,deptname) values(100,'��ǥ�̻�');
insert into dept (deptcode,deptname) values(200,'���ߺ�');
insert into dept (deptcode,deptname) values(300,'�ѹ���');
insert into dept (deptcode,deptname) values(400,'������');

--���ڵ� �߰�
insert into team (deptcode,teamcode,teamname) values(100,1000,'��ǥ�̻�');
insert into team (deptcode,teamcode,teamname) values(200,2000,'���ߺ���');
insert into team (deptcode,teamcode,teamname) values(200,2001,'�ַ����');
insert into team (deptcode,teamcode,teamname) values(200,2002,'������');
insert into team (deptcode,teamcode,teamname) values(300,3000,'�ѹ�����');
insert into team (deptcode,teamcode,teamname) values(300,3001,'�渮��');
insert into team (deptcode,teamcode,teamname) values(300,3002,'�λ���');
insert into team (deptcode,teamcode,teamname) values(300,3003,'�濵��');
insert into team (deptcode,teamcode,teamname) values(400,4000,'��������');
insert into team (deptcode,teamcode,teamname) values(400,4001,'����濵��');
insert into team (deptcode,teamcode,teamname) values(400,4002,'A/S��');
     
commit;

--����... ���� Ȯ��... ��� �Ұ��ΰ� ���� not null �̶� ������ �־� �����...
insert into emp (empno,ename,teamname,signcheck,msgcheck,admin,deptcode,teamcode,grade)values(150129,'ȫ��ȣ','��ǥ�̻�','true','true','true',100,1000,1);
---------------------------------------------------------------------------------------------(  ���  ,  �̸�    ,  ���̸� , ����üũ, �޼���üũ,���� ,�μ��ڵ�,���ڵ�,����)   
commit;
      
insert into domain_set (empno,emptel,hiredate,firedate,sex,birth,exist) values (150129,'02-2286-0321',sysdate,sysdate,'����',sysdate,'true');
-------------------------------------------------------------------------------( ���    ,     �系��ȭ��ȣ    ,  �Ի���    , �����    , ����   , ������� , ��������)
commit;


--ȸ������
--insert into accounts (empno,pwd,email,addr,celphone,p_picture,p_content) values (150129,1004,'0113784358@naver.com','����� ������ ��絿 317-130','010-5378-4358','������ȣ','�����ʳ���'); 
--commit;

