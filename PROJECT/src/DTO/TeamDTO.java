package DTO;

public class TeamDTO {
	private int teamcode;
	private String teamname;
	private int deptcode;
	
	public TeamDTO() {

	}
	
	public TeamDTO(int teamcode, String teamname, int deptcode) {
		
		this.teamcode = teamcode;
		this.teamname = teamname;
		this.deptcode = deptcode;
	}
	
	public int getTeamcode() {
		return teamcode;
	}
	public void setTeamcode(int teamcode) {
		this.teamcode = teamcode;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public int getDeptcode() {
		return deptcode;
	}
	public void setDeptcode(int deptcode) {
		this.deptcode = deptcode;
	}

	
	
}
