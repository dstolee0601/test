<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="kr.or.kosta.user.domain.GuestBook"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.user.domain.User"%>
<%@page import="kr.or.kosta.user.dao.JdbcUserDao"%>
<%@page import="kr.or.kosta.user.dao.UserDao"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory.FactoryType"%>
<%@page import="kr.or.kosta.common.dao.DaoFactory"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
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
	UserDao dao = (UserDao) daoFactory
			.getDao("kr.or.kosta.user.dao.JdbcUserDao");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<style>
</style>


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
			<div id="templatemo_right_column" style="overflow-y: auto;">
				<div id="new_released_section">
					<h1>방명록</h1>
					<div class="new_released_box">

						<%
							if (loginId == null) {
						%>
						<form action="/guestBook/guestbookAction.jsp" method="post">
							<table>
								<tr>
									<td><textarea name="contents" cols="63" rows="5" disabled>로그인하시면 방명록 등록이 가능합니다.</textarea></td>
									<td><input type="submit" value="등 록" disabled
										style="height: 80px; width: 123px;"></td>
								</tr>
							</table>
						</form>
						<%
							} else {
						%>
						<%
							System.out.println(loginId);
								String[] loginInfo = loginId.split(",");
								String id = loginInfo[0];
								String email = loginInfo[1];
						%>
						<form action="/guestBook/guestbookAction.jsp" method="post">
							<table>
								<tr>
									<td><textarea name="contents" cols="63" rows="5"
											onclick="this.value=''">방명록을 등록 하시려면 클릭하세요.</textarea></td>
									<td><input type="hidden" value="<%=id%>"
										style="height: 80px;" name="writer"></td>
									<td><input type="submit" value="등 록"
										style="height: 80px; width: 123px;"></td>

								</tr>
							</table>
						</form>
						<%
							}
						%>

						<table border="1" style="width: 600px;">
							<%
								List<GuestBook> guestBooks = dao.getGestBookList();
								if (guestBooks != null) {
									for (GuestBook guest : guestBooks) {
							%>
							<tr>
								<td width="10%"><a href="mailto:naver.com"><%=guest.getWriter()%></a></td>
								<td width="60%"><pre><%=guest.getContents()%></pre></td>
								<td width="19%"><%=guest.getRegdate()%></td>
							</tr>
							<%
								}
								}
							%>
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