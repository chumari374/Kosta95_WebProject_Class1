package DTO;

import java.sql.Date;

//====================관리자 부여==========================
public class Domain_SetDTO {
	private int empno;	//사원번호
	private String emptel;	//사내전화번호	
	private Date hiredate;	//입사일
	private Date firedate;	//퇴사일
	private String sex;	//성별
	private Date birth;	//생년월일
	private String exist;	//재직여부
	
	public Domain_SetDTO(){}
	
	public Domain_SetDTO(int empno, String emptel,
			Date hiredate, Date firedate, String sex,
			Date birth, String exitst){
		this.empno = empno;
		this.emptel = emptel;
		this.hiredate = hiredate;
		this.firedate = firedate;
		this.sex = sex;
		this.birth = birth;
		this.exist = exitst;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEmptel() {
		return emptel;
	}

	public void setEmptel(String emptel) {
		this.emptel = emptel;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public Date getFiredate() {
		return firedate;
	}

	public void setFiredate(Date firedate) {
		this.firedate = firedate;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getExist() {
		return exist;
	}

	public void setExist(String exist) {
		this.exist = exist;
	}
	
	
}
