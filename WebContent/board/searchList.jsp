<%@page import="kr.or.kosta.common.page.PagingHelper"%>
<%@page import="kr.or.kosta.user.domain.Article"%>
<%@page import="kr.or.kosta.user.dao.JdbcArticleDao"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@page import="kr.or.kosta.user.domain.GuestBook"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.user.dao.ArticleDao"%>


<%@ page contentType="text/html; charset=utf-8"%>

<%
DaoFactory daoFactory=DaoFactory.getDaoFactory(FactoryType.JDBC);
ArticleDao dao=(ArticleDao)daoFactory.getDao("kr.or.kosta.user.dao.JdbcArticleDao");

//총 페이지 수
int totalRowCount=0;
totalRowCount=dao.getPage();
System.out.println("totalRowCount="+totalRowCount);

//페이지 분리
int pageCountPerPage=1+(totalRowCount/10);
System.out.println("pageCount"+pageCountPerPage);

//현재 페이지
int requestPage=0;
requestPage=Integer.parseInt(request.getParameter("page"));
System.out.println("pageNum = "+requestPage);



%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>자유게시판 - 목록<%=totalRowCount %><%=pageCountPerPage %></title>
<link href="/css/templatemo_style.css" rel="stylesheet" type="text/css" />

<style>
table{
    width: 650px;
    color: #ffffff;
	border-collapse: collapse;

}

th {
	color: #ffffff;
	background: #400a0a;
}

td {
	text-align: center;
}

td.sub {
	text-align: right;
	color: #CC3D3D;
}

td:nth-child(2) {
	text-align: left;
}

td span{
	padding: 2px 4px;
	margin: 2px 2px;
	background-color: ;

}

td span.selected, td span.selected:hover{
	background-color: #6799FF;
	color: #ffffff;
	border: 1px solid #008299;
}

td span a{
	text-decoration: none;
	color: #000000;
}

td span:hover{
	background-color: #FF5E00;
}

td span a:hover{
	text-decoration: none;
	color: #ffffff;
}
</style>
</head>
<body>

<div id="templatemo_container">
	<div id="templatemo_header">
    	<div id="templatemo_title">
            <div id="templatemo_sitetitle">D<span>Story .</span></div>
        </div>
  
    </div>

	<%--메인 메뉴 시작--%>
    <jsp:include page="/menu/top.jsp"/>
    <%--메인 메뉴 끝 --%>
    
    <%--사이드 메뉴 시작 --%>
    <jsp:include page="/menu/side.jsp"></jsp:include>
  	<%-- 사이드 메뉴 끝 --%>			
		
		</div>   
       <%------------------------- 중앙 콘텐츠 시작 -----------------------%>

		<table>
	<tr algin=left>
		<th colspan="6" ></th>
	</tr>
	<tr>
		<td colspan="6" class="sub">♠ 전체 게시물 총 255개 | 현재페이지( 1 / 26 )</td>
	</tr>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>아이피</th>
		<th>조회</th>
	</tr>
	
	<!-- 게시판 글 시작 -->
	<%

	
	System.out.println("게시글 시작 requestPage= "+requestPage);
		List<Article> articleList=dao.getArticleAllList(requestPage);
		if(articleList != null){
			for(Article article : articleList){	
	%>
	<tr>
		<td><%=article.getArticleId() %></td>
		<td>
			<a href="read.html?no=??"><%=article.getSubject() %></a>
		</td>
		<td><%=article.getWriter() %></td>
		<td><%=article.getRegdate() %></td>
		<td><%=article.getIp() %></td>
		<td><%=article.getHitcount() %></td>
	</tr>
	<%
			}
		}
	%>
	<!-- 게시판 글 끝 -->
	
	
	<tr align=right>
		<td colspan="6" class="sub">
		
			<a href="/index.jsp"><img src="/images/bbs_home.gif"></a>
			<a href="/board/write.jsp"><img src="/images/bbs_write.gif"></a>
		</td>
	</tr>

	<tr>
		<td colspan="6">
		<%
		PagingHelper pagingHelper = new PagingHelper(10,5,totalRowCount,requestPage);
		pagingHelper.calculate();
		%><%=pagingHelper.toHtml("", "")%>
		</td>
	</tr>

	<tr>
		<td colspan="6">
			<form action="/board/searchAction.jsp" >
				<select name="searchType">
					<option value="subject" selected="selected">글제목</option>
					<option value="content">글내용</option>
					<option value="writer">작성자</option>
				</select>
				<input type=text name="searchValue" size=15 >
				<input type="submit" value="검 색">
			</form>
		</td>
	</tr>
</table>

	   <%----------------------- 중앙 콘텐츠 끝 --------------------------%>
		

</body>
</html>
