package DTO;
//====================�Խ���==========================
import java.sql.Date;

public class C_BrdDTO {

	private int num;	//�۹�ȣ
	private int empno;	//�ۼ��ڹ�ȣ
	private String title;	//����
	private String content;	//����
	private String notice;	//����
	private Date write_date;//�ۼ�����
	private int ref;	//���
	private int dpth;	//�鿩����
	private int step;	//��۰���
	private int count; //��ȸ��
	private String ename; //�ۼ����̸�
	
	
	public C_BrdDTO(){}

	

	public C_BrdDTO(int num, int empno, String title, String content,
			String notice, Date write_date, int ref, int dpth, int step,
			int count, String ename) {
		this.num = num;
		this.empno = empno;
		this.title = title;
		this.content = content;
		this.notice = notice;
		this.write_date = write_date;
		this.ref = ref;
		this.dpth = dpth;
		this.step = step;
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
