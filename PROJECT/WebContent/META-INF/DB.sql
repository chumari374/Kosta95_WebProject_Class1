/* ���� */
CREATE TABLE Accounts (
   EMPNO NUMBER NOT NULL, /* �����ȣ */
   PWD VARCHAR2(20) NOT NULL, /* �н����� */
   EMAIL VARCHAR2(40) NOT NULL, /* �̸����ּ� */
   ADDR VARCHAR2(20) NOT NULL, /* �ּ� */
   CELPHONE VARCHAR2(20) NOT NULL, /* �ڵ��� ��ȣ */
   P_PICTURE VARCHAR2(200), /* �����ʻ��� */
   P_CONTENT VARCHAR2(200), /* �����ʳ��� */
   SIGNCHECK VARCHAR2(10) NOT NULL, /* ���� Ȯ�� */
   MSGCHECK VARCHAR2(10) NOT NULL /* ���� Ȯ�� */
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

/* ��� */
CREATE TABLE EMP (
   EMPNO NUMBER NOT NULL, /* �����ȣ */
   ENAME VARCHAR2(20) NOT NULL, /* �̸� */
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
CREATE TABLE Grade (
   GRADE NUMBER NOT NULL, /* �����ڵ� */
   GRADENAME VARCHAR2(20) NOT NULL /* ���޸� */
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

/* �� */
CREATE TABLE Team (
   DEPTCODE NUMBER NOT NULL, /* �μ��ڵ� */
   TEAMCODE NUMBER NOT NULL, /* ���ڵ� */
   TEAMNAME VARCHAR2(20) NOT NULL /* ���� */
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

/* �Խ��� */
CREATE TABLE C_BRD (
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   NOTICE VARCHAR2(10) NOT NULL, /* �������� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   REF NUMBER, /* ��� */
   DPTH NUMBER, /* �鿩���� */
   STEP NUMBER, /* ��۰��� */
   COUNT NUMBER /* ��ȸ�� */
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
CREATE TABLE Message (
   MSGNUM NUMBER NOT NULL, /* ������ȣ */
   EMPNO NUMBER NOT NULL, /* �����ȣ */
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   FILEPATH VARCHAR2(40), /* ÷������ */
   SENDEMPNO NUMBER NOT NULL /* �޴»�� */
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

/* �ڷ�� */
CREATE TABLE C_DBRD (
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   DATA VARCHAR2(200), /* �ڷ� */
   COUNT NUMBER /* ��ȸ�� */
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
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   READNUM NUMBER /* ��ȸ�� */
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
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   DEPTCODE VARCHAR2(20) NOT NULL, /* �μ���ȣ */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   DATA VARCHAR2(200), /* �ڷ� */
   COUNT NUMBER /* ��ȸ�� */
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
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   NOTICE VARCHAR2(10) NOT NULL, /* �������� */
   DEPTCODE VARCHAR2(20) NOT NULL, /* �μ���ȣ */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   REF NUMBER, /* ��� */
   DPTH NUMBER, /* �鿩���� */
   STEP NUMBER, /* ��۰��� */
   COUNT NUMBER /* ��ȸ�� */
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
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
   NOTICE VARCHAR2(10) NOT NULL, /* �������� */
   TEAMCODE VARCHAR2(20) NOT NULL, /* ����ȣ */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   REF NUMBER, /* ��� */
   DPTH NUMBER, /* �鿩���� */
   STEP NUMBER, /* ��۰��� */
   COUNT NUMBER /* ��ȸ�� */
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
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(200) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL /* �ۼ����� */
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

/* �ڷ�� ��� */
CREATE TABLE RE_C_DBRD (
   RENUM NUMBER NOT NULL, /* ��۹�ȣ */
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(200) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL /* �ۼ����� */
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

/* ������ �ο� */
CREATE TABLE Domain_Set (
   EMPNO NUMBER NOT NULL, /* �����ȣ */
   EMPTEL VARCHAR2(20) NOT NULL, /* �系��ȭ��ȣ */
   HIREDATE DATE NOT NULL, /* �Ի��� */
   FIREDATE DATE, /* ����� */
   SEX VARCHAR2(2) NOT NULL, /* ���� */
   BIRTH DATE NOT NULL, /* ������� */
   ADMIN VARCHAR2(10), /* ������ */
   exist VARCHAR2(10) /* �������� */
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

/* �μ� �ڷ�� ��� */
CREATE TABLE RE_D_DBRD (
   RENUM NUMBER NOT NULL, /* ��۹�ȣ */
   NUM NUMBER NOT NULL, /* �۹�ȣ */
   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(200) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL /* �ۼ����� */
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
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(200) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL /* �ۼ����� */
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
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(200) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL /* �ۼ����� */
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
CREATE TABLE Schedule (
   SCNUM NUMBER NOT NULL, /* ������ ��ȣ */
   EMPNO NUMBER NOT NULL, /* �����ȣ */
   STARTDATE DATE NOT NULL, /* ���� �ð� */
   ENDDATE DATE NOT NULL, /* ������ �ð� */
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(225) /* ���� */
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

/* ���� */
CREATE TABLE Sign (
   SIGNNUM NUMBER NOT NULL, /* ������ȣ */
   EMPNO NUMBER NOT NULL, /* ���� �ø���� */
   GETSIGN NUMBER NOT NULL, /* ���� �޴»�� */
   TITLE VARCHAR2(20) NOT NULL, /* ���� */
   CONTENT VARCHAR2(225) NOT NULL, /* ���� */
   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
   REF NUMBER NOT NULL, /* ����� ������ȣ */
   STEP NUMBER NOT NULL, /* ���� ���� */
   STATUS VARCHAR2(10) NOT NULL /* ���� */
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
insert into team (deptcode,teamcode,teamname) values(200,2001,'�ַ����');
insert into team (deptcode,teamcode,teamname) values(200,2002,'������');
insert into team (deptcode,teamcode,teamname) values(300,3001,'�渮��');
insert into team (deptcode,teamcode,teamname) values(300,3002,'�λ���');
insert into team (deptcode,teamcode,teamname) values(300,3003,'�濵��');
insert into team (deptcode,teamcode,teamname) values(400,4001,'����濵��');
insert into team (deptcode,teamcode,teamname) values(400,4002,'A/S��');
     
commit;

insert into emp (empno,ename,deptcode,teamcode,grade)values(150129,'ȫ��ȣ',100,1000,1);
   
ALTER TABLE domain_set modify( --���� ���� 6���� �̻��̾�� ��...
  sex varchar2(6)
      );   
      
insert into domain_set (empno,emptel,hiredate,firedate,sex,birth,exist) values (150129,'02-2286-0321',sysdate,sysdate,'����',sysdate,'true');

commit;

ALTER TABLE accounts modify( --�ּ� 50�ڴ� ũ��� ����ҵ�...
  ADDR varchar2(50)
      );   
      

--����... ���� Ȯ��... ��� �Ұ��ΰ� ���� not null �̶� ������ �־� �����...

insert into accounts (empno,pwd,email,addr,celphone,signcheck,msgcheck) values (150129,1004,'0113784358@naver.com','����� ������ ��絿 317-130','02-2293-4358','true','true'); 
commit;



--������ ������ ���� �־�... �������� �̻��� �ϴ� ��������ǵ�...
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
