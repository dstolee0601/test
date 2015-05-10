package kr.or.kosta.user.dao;

import java.util.List;

import kr.or.kosta.user.domain.GuestBook;
import kr.or.kosta.user.domain.User;

/**
 * ����� ���� DB ������ ���� �⺻ �Ծ�
 * @author �����
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
