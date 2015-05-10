package kr.or.kosta.user.dao;

import java.util.List;

import kr.or.kosta.user.domain.GuestBook;
import kr.or.kosta.user.domain.User;

/**
 * 사용자 관련 DB 연동을 위한 기본 규약
 * @author 김기정
 *
 */
public interface UserDao {
	public void add(User user) throws Exception;
	public void addBook(GuestBook guest) throws Exception;
	public User get(String id) throws Exception;
	public List<User> search(String name) throws Exception;
	public List<GuestBook> getGestBookList() throws Exception;
	public User isMember(String id, String passwd) throws Exception;
}
