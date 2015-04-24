package DTO;

import java.sql.Date;

// ====================게시판 댓글==========================
public class Re_C_Brd {
	private int renum;	//댓글번호
	private int num;	//글번호
	private int empno;	//사원번호
	private String title;	//제목
	private String content;	//내용
	private Date write_date;	//작성일자
	
	public Re_C_Brd(){}	
	
	public Re_C_Brd(int renum, int num, int empno, String title,
			String content, Date write_date) {
		this.renum = renum;
		this.num = num;
		this.empno = empno;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
	}
	public int getRenum() {
		return renum;
	}
	public void setRenum(int renum) {
		this.renum = renum;
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
}
