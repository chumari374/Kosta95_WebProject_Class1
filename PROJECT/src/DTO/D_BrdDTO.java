package DTO;

import java.sql.Date;

//CREATE TABLE D_BRD (
//		   EMPNO NUMBER NOT NULL, /* �ۼ��ڹ�ȣ */
//		   NUM NUMBER NOT NULL, /* �۹�ȣ */
//		   TITLE VARCHAR2(200) NOT NULL, /* ���� */
//		   CONTENT VARCHAR2(4000) NOT NULL, /* ���� */
//		   NOTICE VARCHAR2(10) NOT NULL, /* �������� */
//		   DEPTCODE VARCHAR2(20) NOT NULL, /* �μ���ȣ */
//		   WRITE_DATE DATE NOT NULL, /* �ۼ����� */
//		   REF NUMBER, /* ��� */
//		   DPTH NUMBER, /* �鿩���� */
//		   STEP NUMBER, /* ��۰��� */
//		   COUNT NUMBER, /* ��ȸ�� */
//		   ENAME VARCHAR2(20) /* �̸� */
//		);

public class D_BrdDTO {
	int empno;
	int num;
	String title;
	String content;
	String notice;
	int deptcode;
	Date write_date;
	
}
