package DTO;

import java.sql.Date;

//============스케줄(일정관리)=============
public class ScheduleDTO {
	private int scnum;
	private int empno;
	private Date startdate;
	private Date enddate;
	private String title;
	private String content;
	
	public ScheduleDTO(){}

	public ScheduleDTO(int scnum, int empno, Date startdate, Date enddate,
			String title, String content) {
		this.scnum = scnum;
		this.empno = empno;
		this.startdate = startdate;
		this.enddate = enddate;
		this.title = title;
		this.content = content;
	}

	public int getScnum() {
		return scnum;
	}

	public void setScnum(int scnum) {
		this.scnum = scnum;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
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

	@Override
	public String toString() {
		return "{scnum:" + scnum + ", empno:" + empno
				+ ", startdate:'" + startdate + "', enddate:'" + enddate
				+ "', title:'" + title + "', content:" + content + "}";
	}

}
