package cn.yueqian.javabean;

public class Users {
	private int id ;
	private String username = null;
	private String password = null;
	//��get��get����
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	//��дtoString����
	public String toString(){
		return "Users [id=" + id +",username=" + username +",password=" + password +"]";
	}
	
}