package kr.or.kosta.user.domain;

/**
 * 회원가입에 관련된 Domain 클래스
 * @author 이동화
 *
 */
public class GuestBook {
	private int guestbook_id;
	private String writer;
	private String contents;
	private String regdate;
	public GuestBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GuestBook(int guestbook_id, String writer, String contents,
			String regdate) {
		super();
		this.guestbook_id = guestbook_id;
		this.writer = writer;
		this.contents = contents;
		this.regdate = regdate;
	}
	public int getGuestbook_id() {
		return guestbook_id;
	}
	public void setGuestbook_id(int guestbook_id) {
		this.guestbook_id = guestbook_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "GuestBook [guestbook_id=" + guestbook_id + ", writer=" + writer
				+ ", contents=" + contents + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
