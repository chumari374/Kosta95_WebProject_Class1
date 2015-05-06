package DTO;

import java.sql.Date;

//CREATE TABLE D_BRD (
//		   EMPNO NUMBER NOT NULL, /* 작성자번호 */
//		   NUM NUMBER NOT NULL, /* 글번호 */
//		   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
//		   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
//		   NOTICE VARCHAR2(10) NOT NULL, /* 공지사항 */
//		   DEPTCODE VARCHAR2(20) NOT NULL, /* 부서번호 */
//		   WRITE_DATE DATE NOT NULL, /* 작성일자 */
//		   REF NUMBER, /* 답글 */
//		   DPTH NUMBER, /* 들여쓰기 */
//		   STEP NUMBER, /* 답글계층 */
//		   COUNT NUMBER, /* 조회수 */
//		   ENAME VARCHAR2(20) /* 이름 */
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
