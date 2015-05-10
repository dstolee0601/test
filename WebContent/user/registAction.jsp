<%@page import="kr.or.kosta.user.dao.UserDao"%>
<%@page import="kr.or.kosta.user.domain.User"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="user" class="kr.or.kosta.user.domain.User" scope="request"/>
<jsp:setProperty property="*" name="user"/>

<%
DaoFactory daoFactory = DaoFactory.getDaoFactory(FactoryType.JDBC);
UserDao dao = (UserDao) daoFactory.getDao("kr.or.kosta.user.dao.JdbcUserDao");
dao.add(user);

%>

<jsp:forward page="result.jsp"/>