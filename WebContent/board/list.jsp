<%@page import="java.util.ArrayList"%>
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
	request.setCharacterEncoding("utf-8");
	DaoFactory daoFactory = DaoFactory.getDaoFactory(FactoryType.JDBC);
	ArticleDao dao = (ArticleDao) daoFactory
			.getDao("kr.or.kosta.user.dao.JdbcArticleDao");

	//총 게시글 수
	int totalRowCount = 0;
	totalRowCount = dao.getPage();
	System.out.println("totalRowCount=" + totalRowCount);

	//페이지 분리
	int pageCountPerPage = 1 + (totalRowCount / 15);
	System.out.println("pageCount" + pageCountPerPage);

	//현재 페이지
	int requestPage = 1;
	requestPage = Integer.parseInt(request.getParameter("page"));

	System.out.println("searchType"
			+ request.getParameter("searchType"));
	System.out.println("searchValue"
			+ request.getParameter("searchValue"));

	String searchType = request.getParameter("searchType");
	String searchValue = request.getParameter("searchValue");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<style>

img{
	border: 0px;
}

table {
	border-collapse: collapse;
	width: 630px;
	margin: 1px auto;
	font-size: 13px;
	color: #ffc601;
}
td {
	background-color: #400a0a;
}

th {
	color: #ffffff;
	background: black;;
}


td.sub {
	text-align: right;
	color: #CC3D3D;
}

td:nth-child(2) {
	text-align: left;
}

td span {
	padding: 2px 4px;
	margin: 2px 2px;
	background-color:;
}

td span.selected, td span.selected:hover {
	background-color: #6799FF;
	color: #ffffff;
	border: 1px solid #008299;
}

td span a {
	text-decoration: none;
	color: #000000;
}

td span:hover {
	background-color: #FF5E00;
}

td span a:hover {
	text-decoration: none;
	color: #ffffff;
}

#borderzoro{
	border: 1px;
}
</style>




<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Dstory에 오신것을 환영합니다.</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/css/templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="templatemo_container">

		<div id="templatemo_header">
			<div id="templatemo_title">
				<div id="templatemo_sitetitle">
					D <span>Story.</span>
				</div>
			</div>

			<div id="templatemo_login">
				<form method="get" action="#">
					<label>Search:</label><input class="inputfield" name="keyword"
						type="text" id="keyword" /> <input class="button" type="submit"
						name="Search" value="Search" />
				</form>
			</div>
		</div>

		<div id="templatemo_banner">
			<div id="templatemo_banner_text">
				<div id="banner_title">Welcome To Music Store</div>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
					Nunc quis sem nec tellus blandit tincidunt. Duis vitae velit sed
					dui malesuada dignissim. Donec mollis aliquet ligula. Lorem ipsum
					dolor sit amet, consectetuer adipiscing elit. Nunc quis sem nec
					tellus blandit tincidunt.</p>
			
			</div>
		</div>

		<!-- top 메뉴 -->
		<jsp:include page="/menu/top.jsp" />
		<!-- top메뉴 끝-->

		<div id="templatemo_content">

			<!-- side 메뉴 -->
			<jsp:include page="/menu/side.jsp" />
			<!-- side 메뉴끝 -->

			<!-- contents 메뉴 -->
			<div id="templatemo_right_column">
				<div id="new_released_section">
					<h1>게시판</h1>
					<div class="new_released_box">

					<table>

		<tr algin=left>
			<th colspan="6"></th>
		</tr>
		<tr>
			<td colspan="6" class="sub">♠ 전체 게시물 총 <%=totalRowCount%>개 |
				현재페이지( <%=requestPage%> / <%=pageCountPerPage%> )
			</td>
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
			List<Article> articleList = new ArrayList<Article>();

			if (searchType == null) {
				articleList = dao.getArticleAllList(requestPage);
			} else {
				articleList = dao.searchArticle(searchType, searchValue);
			}
			if (articleList != null) {
				for (Article article : articleList) {
		%>
		<tr>
			<td><%=article.getArticleId()%></td>
			<td><a href="/board/read.jsp?articleId=<%=article.getArticleId()%>&page=<%=requestPage%> ">
					<%
						int stepNo = article.getStepNo();
								System.out.println("stepNo = " + stepNo);
								if (stepNo != 0) {
					%> 
					<img src="/images/re2.png" style="width:<%=stepNo*20%>px; border:0"></img>
					<img src="/images/re.gif" style="border:0"></img>
					<%
						}
					%> <%=article.getSubject()%></a></td>
			<td><%=article.getWriter()%></td>
			<td><%=article.getRegdate()%></td>
			
			<% 
			// ip 주소 포맷팅
			String[] ip=article.getIp().split("\\.");
			System.out.println(article.getIp());
		//	System.out.println("ip[0]="+ip[0]);
			//System.out.println("ip[1]="+ip[1]);
			//System.out.println("ip[2]="+ip[2]);
			%>
			
			<td><%=ip[0]+"."+ip[1]+"."+"*"+"."+"***"%></td>
			<td><%=article.getHitcount()%></td>
		</tr>
		<%
			}
			}
		%>
		<!-- 게시판 글 끝 -->

		<tr align=right">
			<td colspan="6" class="sub" ><a href="/index.jsp">
			<img src="/images/bbs_home.gif"></a> <a href="/board/write.jsp"><img
					src="/images/bbs_write.gif"></a></td>
		</tr>


		<tr align="center">
			<td colspan="6">
				<%
					if (totalRowCount != 0) {
						PagingHelper pagingHelper = new PagingHelper(15, 5,
								totalRowCount, requestPage);
						pagingHelper.calculate();
				%><%=pagingHelper.toHtml("", "")%> <%
 	} else {
 		PagingHelper pagingHelper = new PagingHelper(15, 2,
 				totalRowCount, requestPage);
 		pagingHelper.calculate();
 %><%=pagingHelper.toHtml("", "")%> <%
 	}
 %>

			</td>
		</tr>
<tr><td>&nbsp</td></tr>
		<tr>
			<td colspan="6">
				<form action="list.jsp?page=1" method="post">
					<select name="searchType">
						<option value="subject" selected="selected">글제목</option>
						<option value="content">글내용</option>
						<option value="writer">작성자</option>
					</select> <input type=text name="searchValue" size=15> <input
						type="submit" value="검 색">
				</form>
			</td>
		</tr>
	</table>
					</div>
				</div>


			</div>
			<!-- contents 메뉴 끝-->
		</div>
		<div id="templatemo_footer">
			<a href="#">Home</a> | <a href="#">Videos</a> | <a href="#">Audios</a>
			| <a href="#">Albums</a> | <a href="#">Artists</a> | <a href="#">Contact</a><br />
			Copyright © <a href="#"><strong>Your Company Name</strong></a>
		</div>
	</div>

</body>
</html>