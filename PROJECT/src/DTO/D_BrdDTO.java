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
	int ref;
	int dpth;
	int step;
	int count;
	String ename;
	
	public D_BrdDTO() {
	}
	
	public D_BrdDTO(int empno, int num, String title, String content,
			String notice, int deptcode, Date write_date, int ref, int dpth,
			int step, int count, String ename) {
		super();
		this.empno = empno;
		this.num = num;
		this.title = title;
		this.content = content;
		this.notice = notice;
		this.deptcode = deptcode;
		this.write_date = write_date;
		this.ref = ref;
		this.dpth = dpth;
		this.step = step;
		this.count = count;
		this.ename = ename;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public int getDeptcode() {
		return deptcode;
	}

	public void setDeptcode(int deptcode) {
		this.deptcode = deptcode;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getDpth() {
		return dpth;
	}

	public void setDpth(int dpth) {
		this.dpth = dpth;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
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
