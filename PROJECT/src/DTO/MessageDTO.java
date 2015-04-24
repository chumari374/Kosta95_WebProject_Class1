package DTO;

// =================쪽지==============
public class MessageDTO {
	private int msgnum;	//쪽지번호
	private int empno;	//사원번호
	private String title;	//제목
	private String content;	//내용
	private String filepath;	//첨부파일
	private int sendempno;	//받는사람
	
	public MessageDTO(){}

	public MessageDTO(int msgnum, int empno, String title, String content,
			String filepath, int sendempno) {
		this.msgnum = msgnum;
		this.empno = empno;
		this.title = title;
		this.content = content;
		this.filepath = filepath;
		this.sendempno = sendempno;
	}

	public int getMsgnum() {
		return msgnum;
	}

	public void setMsgnum(int msgnum) {
		this.msgnum = msgnum;
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

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getSendempno() {
		return sendempno;
	}

	public void setSendempno(int sendempno) {
		this.sendempno = sendempno;
	}
	
}
