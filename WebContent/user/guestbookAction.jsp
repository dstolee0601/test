<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@page import="kr.or.kosta.user.dao.UserDao"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@page import="kr.or.kosta.user.domain.GuestBook"%>
<%@ page contentType="text/html; charset=utf-8"%>


<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="book" class="kr.or.kosta.user.domain.GuestBook" scope="request"/>
<jsp:setProperty property="*" name="book"/>

<%
DaoFactory daoFactory = DaoFactory.getDaoFactory(FactoryType.JDBC);
UserDao dao = (UserDao) daoFactory.getDao("kr.or.kosta.user.dao.JdbcUserDao");
dao.addBook(book);

%>

<jsp:forward page="guestBook/guestBook.jsp"/>