<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.net.InetAddress"%>

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
	String[] loginInfo = loginId.split(",");
	String id = loginInfo[0];
	String email = loginInfo[1];
	InetAddress inetAddr = InetAddress.getLocalHost();
	String ip = inetAddr.getHostAddress();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<style>
table {
	width: 630px;
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

textarea {
	width: 100%;
	height: 300px;
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
					<h1>게시판</h1>
					<div class="new_released_box">

						<form action="/board/writeAction.jsp" method="post">
							<input type=hidden name=ip value=<%=ip%>></input>

							<table>
								<tr>
									<th colspan="4" align=center>게시글 작 성</th>
								</tr>
								<tr>
									<td colspan="4" class="sub">♣ 비밀번호는 글 수정, 삭제시 필요합니다.</td>
								</tr>

								<tr>
									<td>글제목</td>
									<%
										String psubject = request.getParameter("subject");
										String groupNo = request.getParameter("groupNo");
										String orderNo = request.getParameter("orderNo");
										String stepNo = request.getParameter("stepNo");
										if (groupNo == null) {
									%>
									<td><input type="text" name="subject" size="35" /></td>
									<%
										} else {
									%>
									<!-- 답변글 쓰기인 경우 -->
									<!-- <td><input type="text" name="subject" value="[RE] 부모글 제목" /></td>	 -->
									<td><input type="text" name="subject"
										value="[RE] <%=psubject%>" /> <input type="hidden"
										name="groupNo" value="<%=groupNo%>" /> <input type="hidden"
										name="orderNo" value="<%=orderNo%>" /> <input type="hidden"
										name="stepNo" value="<%=stepNo%>" /></td>
									<%
										}
									%>

									<td>비밀번호</td>
									<td><input type="password" name="passwd" /></td>
								</tr>

								<tr>
									<td>작성자</td>
									<input type="hidden" name="writer" value="<%=id%>"></input>
									<td><input type="text" name="writer" value="<%=id%>"
										disabled></input></td>

									<td>이메일</td>
									<td><input type="text" name="email" size="20"
										value="<%=email%>" disabled></input></td>
								</tr>

								<tr>
									<td>글내용</td>
									<td colspan="3"><textarea name="content"></textarea></td>
								</tr>

								<tr>
									<td colspan="4" style="text-align: right;"><input
										type="image" src="/images/bbs_input.gif" /></td>
								</tr>
							</table>
						</form>


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