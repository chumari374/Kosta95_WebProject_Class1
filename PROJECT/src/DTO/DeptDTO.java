package DTO;

// ====================부서==========================
public class DeptDTO {

	private String deptcode;	//부서코드
	private String deptname;	//부서명
	
	public DeptDTO(){}
	
	public DeptDTO(String deptcode, String deptname) {
		this.deptcode = deptcode;
		this.deptname = deptname;
	}
	
	public String getDeptcode() {
		return deptcode;
	}
	public void setDeptcode(String deptcode) {
		this.deptcode = deptcode;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}



	
	
}
