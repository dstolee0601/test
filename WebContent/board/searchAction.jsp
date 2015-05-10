<%@page import="kr.or.kosta.user.dao.JdbcArticleDao"%>
<%@page import="kr.or.kosta.user.dao.ArticleDao"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@ page contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="article" class="kr.or.kosta.user.domain.Article"  scope="request"/>
<jsp:setProperty property="*" name="article"/>

<%String searchType=request.getParameter("searchType");%>
<%String searchValue=request.getParameter("searchValue");%>

<%

DaoFactory daoFactory=DaoFactory.getDaoFactory(FactoryType.JDBC);
ArticleDao dao=(ArticleDao) daoFactory.getDao("kr.or.kosta.user.dao.JdbcArticleDao");
dao.searchArticle(searchType,searchValue);
%>

