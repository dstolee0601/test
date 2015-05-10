package kr.or.kosta.user.domain;

/**
 * 게시판 관련된 게시글 클래스
 * @author 이동화
 *
 */
public class Article {

	private int articleId;
	private int boardId;
	private String writer;
	private String subject;
	private String content;
	private String regdate;
	private int hitcount;
	private String ip;
	private String passwd;
	private String attachFile;
	private int groupNo;
	private int stepNo;
	private int orderNo;
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Article(int articleId, int boardId, String writer, String subject,
			String content, String regdate, int hitcount, String ip,
			String passwd, String attachFile, int groupNo, int stepNo,
			int orderNo) {
		super();
		this.articleId = articleId;
		this.boardId = boardId;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.regdate = regdate;
		this.hitcount = hitcount;
		this.ip = ip;
		this.passwd = passwd;
		this.attachFile = attachFile;
		this.groupNo = groupNo;
		this.stepNo = stepNo;
		this.orderNo = orderNo;
	}
	
	//전체조회
	public Article(int articleId,  String subject,String writer,
			String regdate,String ip, int hitcount,int groupNo,int stepNo,int orderNo) {
		super();
		this.articleId = articleId;
		this.writer = writer;
		this.subject = subject;
		this.regdate = regdate;
		this.hitcount = hitcount;
		this.ip = ip;
		this.groupNo = groupNo;
		this.stepNo = stepNo;
		this.orderNo = orderNo;
		
	}
	//상세정보
		public Article(String writer, String subject, String content,
			String regdate, int hitcount, String ip,int groupNo,int stepNo,int orderNo) {
		super();
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.regdate = regdate;
		this.hitcount = hitcount;
		this.ip = ip;
		this.groupNo = groupNo;
		this.stepNo = stepNo;
		this.orderNo = orderNo;
		
	}

	//검색
	public Article(int articleId,String subject, String writer, 
			String regdate,  String ip, int hitcount, int groupNo) {
		super();
		this.articleId = articleId;
		this.writer = writer;
		this.subject = subject;
		this.regdate = regdate;
		this.hitcount = hitcount;
		this.ip = ip;
		this.groupNo = groupNo;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(String attachFile) {
		this.attachFile = attachFile;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getStepNo() {
		return stepNo;
	}
	public void setStepNo(int stepNo) {
		this.stepNo = stepNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", boardId=" + boardId
				+ ", writer=" + writer + ", subject=" + subject + ", content="
				+ content + ", regdate=" + regdate + ", hitcount=" + hitcount
				+ ", ip=" + ip + ", passwd=" + passwd + ", attachFile="
				+ attachFile + ", groupNo=" + groupNo + ", stepNo=" + stepNo
				+ ", orderNo=" + orderNo + "]";
	}
}
	
	