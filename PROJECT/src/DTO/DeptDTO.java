package DTO;

// ====================�μ�==========================
public class DeptDTO {

	private String deptcode;	//�μ��ڵ�
	private String deptname;	//�μ���
	
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
