package MemberJoin;

public class MemberJoinDTO {

	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String email;
	private String bus;
	private java.sql.Date memDate;
	
	
		public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBus() {
		return bus;
	}
	public void setBus(String bus) {
		this.bus = bus;
	}
	public java.sql.Date getMemDate() {
		return memDate;
	}
	public void setMemDate(java.sql.Date memDate) {
		this.memDate = memDate;
	}
	
	
	
}
