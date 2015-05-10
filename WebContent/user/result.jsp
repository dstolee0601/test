<%@page import="kr.or.kosta.user.domain.User"%>
<%@ page contentType="text/html; charset=utf-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<style>
body {
	font-family: '돋움' Century Gothic, Arial, Serif;
}

table {
	border-collapse: collapse;
	width: 500px;
	margin: 30px auto;
}

td {
	background-color: #400a0a;
	border: solid 1px silver;
	padding: 5px 5px;
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
				<div class="more_button">
					<a href="#">Read More</a>
				</div>
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
					<h1>회원 등록 결과</h1>
					<div class="new_released_box">
<jsp:useBean id="user" class="kr.or.kosta.user.domain.User"
		scope="request" />
	<div>

		<table border="1">
			<tr>
				<td colspan="4" align="center">◈ 회원 등록 결과◈</td>
			</tr>

				<tr>
				<td>아이디</td>
				<td><jsp:getProperty property="id" name="user" /></td>
			</tr>	<tr>
				<td>비밀번호</td>
				<td><jsp:getProperty property="passwd" name="user" /></td>
			</tr>
			<tr>
				<td>회원이름</td>
				<td><jsp:getProperty property="name" name="user" /></td>
			</tr>

			<tr>
				<td>E-mail</td>
				<td><jsp:getProperty property="email" name="user" /></td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><jsp:getProperty property="mobile1" name="user" />- <jsp:getProperty
						property="mobile2" name="user" />- <jsp:getProperty
						property="mobile3" name="user" /></td>

			</tr>

			<tr>
				<td>직업</td>
				<td><jsp:getProperty property="job" name="user" /></td>
			</tr>

			<td colspan="2" align="center"><a href="login.jsp">확인</a></td>
			</tr>
		</table>

	</div>
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