package DTO;

import java.util.Date;

// ====================결재===========================
public class SignDTO {
	private int signnum; // 결재번호
	private int starter; // 기안자
	private int empno; // 결재올리는 사람
	private int getsign; // 결재받는 사람
	private String title; // 제목
	private String content; // 내용
	private Date write_date; // 작성일자
	private int ref; // 기안자 결재번호
	private int step; // 결재 계층
	private String status; // 결재 상태
	private String file_sign; // 파일 업로드 경로
	
	public int getSignnum() {
		return signnum;
	}
	public void setSignnum(int signnum) {
		this.signnum = signnum;
	}
	public int getStarter() {
		return starter;
	}
	public void setStarter(int starter) {
		this.starter = starter;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getGetsign() {
		return getsign;
	}
	public void setGetsign(int getsign) {
		this.getsign = getsign;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFile_sign() {
		return file_sign;
	}
	public void setFile_sign(String file_sign) {
		this.file_sign = file_sign;
	}
	
// ===================결재 끝 =================================
}
