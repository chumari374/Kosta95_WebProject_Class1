package DTO;
// ====================����==========================
public class AccountsDTO {
	private int empno;	//�����ȣ
	private String pwd;	//�н�����
	private String email;	//�̸����ּ�
	private String addr;	//�ּ�
	private String celphone;	//�ڵ��� ��ȣ
	private String p_picture;	//�����ʻ���
	private String p_content;	//�����ʳ���
	
	public AccountsDTO(){}
	
	public AccountsDTO(int empno,String pwd,String email,
			String addr, String celphone,
			String p_picture, String p_content){
		this.empno = empno;
		this.pwd = pwd;
		this.email = email;
		this.addr = addr;
		this.celphone = celphone;
		this.p_picture = p_picture;
		this.p_content = p_content;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCelphone() {
		return celphone;
	}

	public void setCelphone(String celphone) {
		this.celphone = celphone;
	}

	public String getP_picture() {
		return p_picture;
	}

	public void setP_picture(String p_picture) {
		this.p_picture = p_picture;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	@Override
	public String toString() {
		return "AccountsDTO [empno=" + empno + ", pwd=" + pwd + ", email="
				+ email + ", addr=" + addr + ", celphone=" + celphone
				+ ", p_picture=" + p_picture + ", p_content=" + p_content + "]";
	}
	
	
}
