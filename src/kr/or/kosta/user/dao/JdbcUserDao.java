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
 * JDB API�� �̿��� �����ͺ��̽� ���Ӽ� ó�� ���� Ŭ����
 * @author �����
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
	 * ����� ���
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
			throw new Exception("���� ��ϵ� ������Դϴ�.");
		}finally{
			if(pstmt != null) pstmt.close();
			if(con != null)   con.close();
		}
	}
	
	
	/**
	 * ���� ���
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
			throw new Exception("���� ����� ��ҵǾ����ϴ�.");
		}finally{
			if(pstmt != null) pstmt.close();
			if(con != null)   con.close();
		}
	}
	
	
	/**
	 * ����� ��ȸ
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
	 * �̸����� ����� �˻�
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
	 * ��ü ���� ����Ʈ
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
	 * ȸ�� ����
	 */
	public User isMember(String id, String passwd) throws Exception{
		User user = null;
		
		
		String sql = " SELECT id,passwd,email" +
	                 " FROM users" +
				     " WHERE id = ? AND passwd = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		System.out.println("ismember ����");
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
			System.out.println("finally����");
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null)   con.close();
		}
		return user;
	}

	

	

}








