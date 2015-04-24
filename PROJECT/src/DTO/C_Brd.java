package DTO;

import java.sql.Date;

public class C_Brd {

	private int num;
	private int empno;
	private String title;
	private String content;
	private String notice;
	private Date write_date;
	private int ref;
	private int dpth;
	private int step;
	
	public C_Brd(){}
	
	public C_Brd(int num, int empno, String title, String content,
			String notice, Date write_date, int ref, int dpth, int step) {
		this.num = num;
		this.empno = empno;
		this.title = title;
		this.content = content;
		this.notice = notice;
		this.write_date = write_date;
		this.ref = ref;
		this.dpth = dpth;
		this.step = step;
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
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
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
	
	
}
