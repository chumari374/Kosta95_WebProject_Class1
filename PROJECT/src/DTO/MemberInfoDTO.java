package DTO;

public class MemberInfoDTO {
	private String p_picture;
	private String p_content;
	private int empno;
	private String ename;
	private String celphone;
	private String email;
	private String deptname;
	private String teamname;
	private String gradename;
	private String emptel;
	
	public MemberInfoDTO(){}

	public MemberInfoDTO(String p_picture, String p_content, int empno,
			String ename, String celphone, String email, String deptname,
			String teamname, String gradename, String emptel) {
		this.p_picture = p_picture;
		this.p_content = p_content;
		this.empno = empno;
		this.ename = ename;
		this.celphone = celphone;
		this.email = email;
		this.deptname = deptname;
		this.teamname = teamname;
		this.gradename = gradename;
		this.emptel = emptel;
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

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getCelphone() {
		return celphone;
	}

	public void setCelphone(String celphone) {
		this.celphone = celphone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public String getTeamname() {
		return teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public String getGradename() {
		return gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	public String getEmptel() {
		return emptel;
	}

	public void setEmptel(String emptel) {
		this.emptel = emptel;
	}
	
}
