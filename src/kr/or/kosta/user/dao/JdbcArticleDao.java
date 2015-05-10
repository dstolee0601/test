package kr.or.kosta.user.dao;

import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kr.or.kosta.user.domain.Article;
import kr.or.kosta.user.domain.GuestBook;

public class JdbcArticleDao implements ArticleDao {

	private DataSource dataSource;
	
	
	public JdbcArticleDao() {}
	
	public JdbcArticleDao(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	//게시글 등록
	
	@Override
	public void add(Article article) throws Exception {
		System.out.println("Article add 들어옴 = "+article);
		
		String sql = " INSERT INTO article(article_id, board_id, writer, subject, content, ip, passwd, group_no, step_no, order_no)"+
					 " VALUES(article_id_seq.NEXTVAL, 1, ?, ?, ?,?, ?, article_id_seq.CURRVAL, ?, ?)";
	Connection con = null;
	PreparedStatement pstmt = null;
	
	try{
		con = dataSource.getConnection();
		con.setAutoCommit(false);
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, article.getWriter());
		System.out.println("article.getWriter() = "+article.getWriter());
		
		pstmt.setString(2, article.getSubject());
		System.out.println("article.getSubject()="+article.getSubject());
		
		pstmt.setString(3, article.getContent());
		System.out.println("article.getContent() = "+article.getContent());
		
		pstmt.setString(4, article.getIp());
		System.out.println("article.getIp() = "+article.getIp());
		
		pstmt.setString(5, article.getPasswd());
		System.out.println("article.getPasswd() = "+article.getPasswd());
		
		pstmt.setInt(6, article.getStepNo());
		System.out.println("article.getPasswd() = "+article.getPasswd());
		
		pstmt.setInt(7, article.getOrderNo());
		System.out.println("article.getPasswd() = "+article.getPasswd());
		
		
		pstmt.executeUpdate();
		con.commit();
	}catch(SQLException e){
		con.rollback();	
		throw new Exception("기존 등록된 사용자입니다.");
	}finally{
		if(pstmt != null) pstmt.close();
		if(con != null)   con.close();
	}
		
	}

	//게시판 정렬
	private void updateOrderNo(Article article) throws Exception {
		System.out.println(article.getGroupNo());
		String sql = " UPDATE article"+
					 " SET order_no = order_no + 1"+
					 " WHERE group_no = ? AND order_no > 0";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article.getGroupNo());
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// con.rollback();
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}
	
	//댓글 등록
	@Override
	public void reArticleAdd(Article article) throws Exception {
	updateOrderNo(article);	
	System.out.println("Article add 들어옴 = "+article);
	
		
	String sql =" INSERT INTO article(article_id, board_id, writer, subject, content, ip, passwd, group_no, step_no, order_no)"+
				" VALUES(article_id_seq.NEXTVAL, 1, ?, ?, ?,?, ?, ?, ?, 1)";
	Connection con = null;
	PreparedStatement pstmt = null;
	
	try{
		con = dataSource.getConnection();
		con.setAutoCommit(false);
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, article.getWriter());
		System.out.println("article.getWriter() = "+article.getWriter());
		
		pstmt.setString(2, article.getSubject());
		System.out.println("article.getSubject()="+article.getSubject());
		
		pstmt.setString(3, article.getContent());
		System.out.println("article.getContent() = "+article.getContent());
		
		pstmt.setString(4, article.getIp());
		System.out.println("article.getIp() = "+article.getIp());
		
		pstmt.setString(5, article.getPasswd());
		System.out.println("article.getPasswd() = "+article.getPasswd());
		
		pstmt.setInt(6, article.getGroupNo());
		System.out.println("groupNo = "+article.getGroupNo());
		
		pstmt.setInt(7, article.getStepNo()+1);
		System.out.println("groupNo = "+article.getStepNo());
		
		pstmt.executeUpdate();
		con.commit();
	}catch(SQLException e){
		con.rollback();	
		throw new Exception("기존 등록된 사용자입니다.");
	}finally{
		if(pstmt != null) pstmt.close();
		if(con != null)   con.close();
	}
	
	}

	//전체 게시글 조회
	
	@Override
	public List<Article> getArticleAllList(int pageNum) throws Exception {
		System.out.println("getArticleAllList 들어옴 !!! =" +pageNum);
		
		List<Article> articleList = null;
		
		String sql = " SELECT request_page, article_id, subject, writer, regdate, ip, hitcount,group_no,step_no, order_no"+
				              " FROM (SELECT CEIL(rownum / 15) request_page, article_id, subject, writer, TO_CHAR(regdate, 'YYYY-MM-DD') regdate, ip, hitcount,group_no,step_no, order_no"+
					          " FROM (SELECT rownum, article_id, subject, writer, regdate, ip, hitcount,group_no,step_no, order_no"+
							  " FROM article"+
							  " WHERE board_id = 1"+
							  " ORDER BY group_no DESC, regdate ASC))"+
							  " WHERE request_page = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageNum);
			rs = pstmt.executeQuery();
			articleList = new ArrayList<Article>();
			
			while(rs.next()){
				System.out.println("aaaaaaaaaaaaaaaaaaaaaaa"+pageNum);
				
				int requestPage=rs.getInt("request_page");
				int articleId = rs.getInt("article_id");
				String subject = rs.getString("subject");
				String writer = rs.getString("writer");
				String regdate = rs.getString("regdate");
				String ip = rs.getString("ip");
				int hitcount = rs.getInt("hitcount");
				int groupNo=rs.getInt("group_no");
				int stepNo=rs.getInt("step_no");
				int orderNo=rs.getInt("order_no");
				
				Article article = new Article(articleId, subject, writer,regdate,ip,hitcount,groupNo,stepNo,orderNo);
				
				System.out.println("article ="+article);
				articleList.add(article);
			}
			
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null)   con.close();
		}
		return articleList;
	}

	//페이지 크기 반환
	@Override
	public int getPage() throws Exception {
		System.out.println("getPage들어옴");
		int count=0;
			String sql=" SELECT COUNT(*) article_count"+
								" FROM article";
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try{
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();		
				while(rs.next()){	
					count=rs.getInt("article_count");	
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}		
		return count;
	}
	
	// 게시글 검색
	public List<Article> searchArticle(String searchType, String searchValue) throws Exception{
		
		
		System.out.println("searchArticle 들어옴");
		System.out.println("searchType = "+searchType);
		System.out.println("searchValue = "+searchValue);
		
		List<Article> articleList = null;
		
	String sql=" SELECT request_page, article_id, subject, writer, regdate, ip, hitcount,group_no"+
				" FROM (SELECT CEIL(rownum / 15) request_page, article_id, subject, writer, TO_CHAR(regdate, 'YYYY-MM-DD') regdate, ip, hitcount,group_no"+
				" FROM (SELECT rownum, article_id, subject, writer, regdate, ip, hitcount,group_no"+
		        " FROM article"+
		        " WHERE board_id = 1 AND "+searchType+"  LIKE ?"+
		        " ORDER BY group_no DESC, order_no ASC))";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "%" + searchValue + "%");
		rs = pstmt.executeQuery();
		
		articleList = new ArrayList<Article>();
		
		
		while(rs.next()){
			int articleId = rs.getInt("article_id");
			System.out.println(articleId);
			String subject = rs.getString("subject");
			System.out.println(subject);
			String writer = rs.getString("writer");
			System.out.println(writer);
			String regdate = rs.getString("regdate");
			System.out.println(regdate);
			String ip = rs.getString("ip");
			System.out.println(ip);
			int hitcount = rs.getInt("hitcount");
			System.out.println(hitcount);
			
			int groupNo=rs.getInt("group_no");
			
			Article article = new Article(articleId, subject, writer,regdate,ip,hitcount,groupNo);
			articleList.add(article);
			System.out.println("searchArticle :"+articleList.toString());
		}
	}finally{
		
		System.out.println("");
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null)   con.close();
	}
	
	return articleList;

	}

	/**
	 * 게시글 조회수 증가
	 */
	private void updateHitCount(int articleId) throws Exception {
		String sql = " UPDATE article"+
					 " SET hitcount = hitcount + 1"+
					 " WHERE board_id = 1 AND article_id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleId);
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// con.rollback();
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}
	
	//게시글 상세 정보
	@Override
	public Article getArticleInfo(int articleId) throws Exception {
		Article article=null;
		System.out.println("getArticleInfo 들어옴 : "+articleId);
		updateHitCount(articleId);
		
				String sql = " SELECT writer, subject, content, regdate, hitcount,ip,group_no, step_no, order_no"+
							 " FROM ARTICLE"+
							 " WHERE article_id LIKE ?";
				
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					con = dataSource.getConnection();
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, articleId);
					rs = pstmt.executeQuery();
				
					while(rs.next()){
						String writer = rs.getString("writer");
						String subject = rs.getString("subject");
						String content=rs.getString("content");
						String regdate = rs.getString("regdate");
						int hitcount = rs.getInt("hitcount");
						String ip = rs.getString("ip");
						int groupNo = rs.getInt("group_no");
						int stepNo = rs.getInt("step_no");
						int orderNo = rs.getInt("order_no");
						
						article = new Article(writer,subject,content, regdate,hitcount,ip,groupNo,stepNo,orderNo);
						System.out.println(article);
					}
					
				}finally{
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null)   con.close();
				}
				System.out.println(article);
				return article;
			}

	

	

}
