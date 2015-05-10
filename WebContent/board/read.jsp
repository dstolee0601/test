<%@page import="kr.or.kosta.user.domain.Article"%>
<%@page import="kr.or.kosta.user.dao.JdbcArticleDao"%>
<%@page import="kr.or.kosta.user.dao.ArticleDao"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	//쿠키
	String loginId = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			String name = cookie.getName();
			if (name.equals("loginId")) {
				loginId = cookie.getValue();
				break;
			}
		}
	}

	DaoFactory daoFactory = DaoFactory.getDaoFactory(FactoryType.JDBC);
	ArticleDao dao = (ArticleDao) daoFactory
			.getDao("kr.or.kosta.user.dao.JdbcArticleDao");
	int articleId = Integer.parseInt(request.getParameter("articleId"));
	Article article = dao.getArticleInfo(articleId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<style>
table {
	width: 640px;
	border-collapse: collapse;
}

th {
	color: #ffffff;
	background: #4374D9;
}

td {
	text-align: left;
	border: 1px solid #CCCCCC;
	padding: 3px 5px;
}

td.sub {
	text-align: right;
	color: #CC3D3D;
}

td span {
	padding: 2px 4px;
	margin: 2px 2px;
	background-color: #EAEAEA;
	border: 1px solid silver;
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
					D <span>Story</span>
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
							<tr>
								<th colspan="6">게시글 상세 보기</th>
							</tr>
							<tr>
								<td>글제목</td>
								<td colspan="3"><%=article.getSubject()%></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><%=article.getWriter()%></td>

								<td>작성일</td>
								<td><%=article.getRegdate()%></td>
							</tr>
							<tr>
								<td>아이피</td>
								<td><%=article.getIp()%></td>
								<td>조 회</td>
								<td><%=article.getHitcount()%></td>
							</tr>
							<tr>
								<td colspan="4"><%=article.getContent()%></td>
							</tr>
							<tr>
								<td colspan="4" class="sub"><a
									href="/board/list.jsp?page=1"> <img
										src="/images/bbs_list.gif">
								</a> <a
									href="write.jsp?subject=<%=article.getSubject()%>&groupNo=<%=article.getGroupNo()%>&orderNo=<%=article.getOrderNo()%>&stepNo=<%=article.getStepNo()%>">
										<img src="/images/bbs_rewrite.gif">
								</a> <%
 	if (loginId != null) {
 		String[] loginInfo = loginId.split(",");
 		String id = loginInfo[0];
 		String email = loginInfo[1];
 		if (id.equals(article.getWriter())) {
 %> <!-- 본인글인 경우만 수정 메뉴 보이기 --> <a href="modify.jsp"><img
										src="/images/bbs_modify.gif"></a> <%
 	} else {
 		}
 	} else {
 	}
 %></td>
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