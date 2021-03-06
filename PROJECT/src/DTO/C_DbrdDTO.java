package DTO;

import java.sql.Date;

public class C_DbrdDTO {
	private int num;
	private int empno;
	private String title;
	private String content;
	private Date write_date;
	
	private String data;
	private int count;
	private String ename;
	
	public C_DbrdDTO(){}
	
	public C_DbrdDTO(int num, int empno, String title,
			String content, Date write_date, String data,int count,String ename){
		this.num = num;
		this.empno = empno;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.data = data;
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

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
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

	@Override
	public String toString() {
		return "C_DbrdDTO [num=" + num + ", empno=" + empno + ", title="
				+ title + ", content=" + content + ", write_date=" + write_date
				+ ", data=" + data + ", count=" + count + ", ename=" + ename
				+ "]";
	}
	
}
