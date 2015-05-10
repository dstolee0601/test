package kr.or.kosta.user.domain;

/**
 * 회원가입에 관련된 Domain 클래스
 * @author 이동화
 *
 */
public class User {
	private String id;
	private String passwd;
	private String name;
	private String email;
	private String mobile1;
	private String mobile2;
	private String mobile3;
	private String job;
	private String path;
	private String profile;
	private String regdate;
	private int point;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String id, String passwd, String name, String email,
			String mobile1, String mobile2, String mobile3, String job,
			String path, String profile, String regdate, int point) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.mobile1 = mobile1;
		this.mobile2 = mobile2;
		this.mobile3 = mobile3;
		this.job = job;
		this.path = path;
		this.profile = profile;
		this.regdate = regdate;
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getMobile3() {
		return mobile3;
	}
	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", passwd=" + passwd + ", name=" + name
				+ ", email=" + email + ", mobile1=" + mobile1 + ", mobile2="
				+ mobile2 + ", mobile3=" + mobile3 + ", job=" + job + ", path="
				+ path + ", profile=" + profile + ", regdate=" + regdate
				+ ", point=" + point + "]";
	}
	
	
	
}
