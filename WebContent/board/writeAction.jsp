<%@page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@page import="kr.or.kosta.user.domain.Article"%>
<%@page import="kr.or.kosta.user.dao.ArticleDao"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@ page contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8");%>

<%System.out.println("writeAction 들어옴"); %>

<jsp:useBean id="article"  class="kr.or.kosta.user.domain.Article"  scope="request"/>
<jsp:setProperty property="*" name="article"/>

<%System.out.println("articleGroupNo ="+request.getParameter("groupNo")); %>
<%System.out.println("content = "+request.getParameter("content")); %>
<%
//글 내용 엔터처리 후 저장
String content = request.getParameter("content").replaceAll("\\n", "<br>");
article.setContent(content);

DaoFactory daoFactory = DaoFactory.getDaoFactory(FactoryType.JDBC);
ArticleDao dao = (ArticleDao) daoFactory.getDao("kr.or.kosta.user.dao.JdbcArticleDao");

if(article.getGroupNo()!=0){
	System.out.println("writeAction=댓글부분 ");
	dao.reArticleAdd(article);
}else{
	System.out.println("writeAction=그냥글 ");
	dao.add(article);	
}
response.sendRedirect("/board/list.jsp?page=1");
%>
	