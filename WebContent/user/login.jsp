
<%@page import="kr.or.kosta.user.dao.UserDao"%>
<%@page import="kr.or.kosta.user.dao.JdbcUserDao"%>
<%@page import="kr.or.kosta.user.domain.User"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@ page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
// 로그인 처리
System.out.println("login.jsp 들어옴");
if(request.getMethod().equalsIgnoreCase("post")){
	request.setCharacterEncoding("utf-8");
	// 아이디,패스워드 폼데이터 수신\
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	DaoFactory daoFactory = DaoFactory.getDaoFactory(FactoryType.JDBC);
	UserDao userDao = (UserDao)daoFactory.getDao("kr.or.kosta.user.dao.JdbcUserDao");
	User user = userDao.isMember(id, password);
	if(user != null){
		Cookie loginCookie = new Cookie("loginId",user.getId()+","+user.getEmail());
	loginCookie.setPath("/");
		response.addCookie(loginCookie);
		response.sendRedirect("/index.jsp");
	}else{
 		response.sendRedirect("regist.jsp");
	}

}else{
	// 로그아웃 처리
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
			String name = cookie.getName();
			if(name.equals("loginId")){
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
	}
	response.sendRedirect("/index.jsp");
}
%>
