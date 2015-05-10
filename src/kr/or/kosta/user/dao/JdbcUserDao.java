package kr.or.kosta.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import kr.or.kosta.user.domain.GuestBook;
import kr.or.kosta.user.domain.User;


/**
 * JDB API를 이용한 데이터베이스 영속성 처리 전담 클래스
 * @author 김기정
 *
 */
public class JdbcUserDao implements UserDao{
	
	private DataSource dataSource;
	
	public JdbcUserDao(){}
	
	public JdbcUserDao(DataSource dataSource){
		this.dataSource = dataSource;		
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/**
	 * 사용자 등록
	 */
	public void add(User user) throws Exception{
		String sql = " INSERT INTO users (id, passwd, name, email, mobile1, mobile2, mobile3, job, path, profile)"+
					 " VALUES (?,?,?,?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPasswd());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getMobile1());
			pstmt.setString(6, user.getMobile2());
			pstmt.setString(7, user.getMobile3());
			pstmt.setString(8, user.getJob());
			pstmt.setString(9, user.getPath());
			pstmt.setString(10, user.getProfile());
			
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
	
	
	/**
	 * 방명록 등록
	 */

	public void addBook(GuestBook guest) throws Exception{
		String sql = " INSERT INTO guestbook(guestbook_id, writer, content)"+
					 " VALUES (GUESTBOOK_SEQ.NEXTVAL, ?, ?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			System.out.println("guest.getWriter()="+guest.getWriter());
			System.out.println("guest.getContents()="+guest.getContents());
			pstmt.setString(1, guest.getWriter());
			pstmt.setString(2, guest.getContents());
			
			pstmt.executeUpdate();
			con.commit();
		}catch(SQLException e){
			con.rollback();	
			throw new Exception("방명록 등록이 취소되었습니다.");
		}finally{
			if(pstmt != null) pstmt.close();
			if(con != null)   con.close();
		}
	}
	
	
	/**
	 * 사용자 조회
	 */
	public User get(String id) throws Exception{
		User user = null;
		
		String sql = " SELECT id, name, passwd" +
	                 " FROM users" +
				     " WHERE id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String uid = rs.getString("id");
				String name = rs.getString("name");
				String passwd = rs.getString("passwd");
//				user = new User(uid, name, passwd);
			}
			
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null)   con.close();
		}
		
		return user;
	}
	
	/**
	 * 이름으로 사용자 검색
	 */
	public List<User> search(String name) throws Exception{
		List<User> users = null;
		
		String sql = " SELECT id, name, passwd" +
		             " FROM users" +
				     " WHERE name LIKE ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();
			users = new ArrayList<User>();
			while(rs.next()){
				String uid = rs.getString("id");
				String uname = rs.getString("name");
				String upasswd = rs.getString("passwd");
//				User user = new User(uid, uname, upasswd);
//				users.add(user);
			}
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null)   con.close();
		}
		return users;
	}
	
	
	/**
	 * 전체 방명록 리스트
	 */
	public List<GuestBook> getGestBookList() throws Exception{
		List<GuestBook> bookList = null;
		
		String sql = " SELECT guestbook_id, writer, content, TO_CHAR(regdate, 'YYYY.MM.DD HH24:MI') regdagte"+
				     " FROM guestbook"+
					 " ORDER BY guestbook_id desc";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			bookList = new ArrayList<GuestBook>();
			
			while(rs.next()){
				int guestbook_id = rs.getInt("guestbook_id");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				String regdagte = rs.getString("regdagte");
				
				GuestBook book = new GuestBook(guestbook_id, writer, content,regdagte);
				bookList.add(book);
				
			}
			
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null)   con.close();
		}
		return bookList;
	}
	
	/**
	 * 회원 인증
	 */
	public User isMember(String id, String passwd) throws Exception{
		User user = null;
		
		
		String sql = " SELECT id,passwd,email" +
	                 " FROM users" +
				     " WHERE id = ? AND passwd = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		System.out.println("ismember 들어옴");
		try{
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);	
			
			System.out.println("ismember id: "+id);
			System.out.println("ismember passwd: "+passwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				user = new User();
				
				user.setId(rs.getString("id"));
				user.setPasswd(rs.getString("passwd"));
				user.setEmail(rs.getString("email"));
			}
		}finally{
			System.out.println("finally들어옴");
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null)   con.close();
		}
		return user;
	}

	

	

}








