package DTO;

import java.util.Date;

// ====================����===========================
public class SignDTO {
	private int signnum; // �����ȣ
	private int starter; // �����
	private int empno; // ����ø��� ���
	private int getsign; // ����޴� ���
	private String title; // ����
	private String content; // ����
	private Date write_date; // �ۼ�����
	private int ref; // ����� �����ȣ
	private int step; // ���� ����
	private String status; // ���� ����
	private String file_sign; // ���� ���ε� ���
	
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
	
// ===================���� �� =================================
}
