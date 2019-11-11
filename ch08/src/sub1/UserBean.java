package sub1;

// 자바빈 : form의 데이터를 멤버로 갖는 객체
public class UserBean {

	// form의 멤버변수 선언
	private String name;
	private int gender;
	private String[] hobby;
	private String addr;
	
	// 멤버변수의 Getter, Setter 정의 (이건 공식이여..)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	public String[] getHobby() {
		return hobby;
	}
	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	
	
}
