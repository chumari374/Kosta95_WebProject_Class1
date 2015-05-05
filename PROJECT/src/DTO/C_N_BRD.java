package DTO;

import java.sql.Date;

//CREATE TABLE C_N_BRD (
//		   NUM NUMBER NOT NULL, /* 글번호 */
//		   EMPNO NUMBER NOT NULL, /* 작성자번호 */
//		   TITLE VARCHAR2(200) NOT NULL, /* 제목 */
//		   CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
//		   WRITE_DATE DATE NOT NULL, /* 작성일자 */
//		   COUNT NUMBER, /* 조회수 */
//		   ENAME VARCHAR2(20) /* 이름 */
//		);

public class C_N_BRD {

	int num;
	int empno;
	String title;
	String content;
	Date write_date;
	int count;
	String ename;
	
	public C_N_BRD(int num, int empno, String title, String content,
			Date write_date, int count, String ename) {
		super();
		this.num = num;
		this.empno = empno;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.count = count;
		this.ename = ename;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}
	
	
	
}
