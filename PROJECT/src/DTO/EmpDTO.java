package DTO;

//====================사원==========================
public class EmpDTO {

	private int empno;	//사원번호
	private String ename;	//이름
	private String teamname;	//팀명
	private String signcheck;	//결제확인
	private String msgcheck;	//쪽지확인
	private String admin;	//관리자
	private int deptcode;	//부서코드
	private int teamcode;	//팀코드
	private int grade;	//직급코드
	
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
