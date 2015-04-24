package DTO;

public class EmpDTO {

	private int empno;
	private String ename;
	private String teamname;
	private String signcheck;
	private String msgcheck;
	private String admin;
	private int deptcode;
	private int teamcode;
	private int grade;
	
	public EmpDTO(){}
	
	public EmpDTO(int empno, String ename, String teamname, String signcheck,
			String msgcheck, String admin, int deptcode, int teamcode, int grade) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.teamname = teamname;
		this.signcheck = signcheck;
		this.msgcheck = msgcheck;
		this.admin = admin;
		this.deptcode = deptcode;
		this.teamcode = teamcode;
		this.grade = grade;
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

	public String getTeamname() {
		return teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public String getSigncheck() {
		return signcheck;
	}

	public void setSigncheck(String signcheck) {
		this.signcheck = signcheck;
	}

	public String getMsgcheck() {
		return msgcheck;
	}

	public void setMsgcheck(String msgcheck) {
		this.msgcheck = msgcheck;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public int getDeptcode() {
		return deptcode;
	}

	public void setDeptcode(int deptcode) {
		this.deptcode = deptcode;
	}

	public int getTeamcode() {
		return teamcode;
	}

	public void setTeamcode(int teamcode) {
		this.teamcode = teamcode;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
	
}
