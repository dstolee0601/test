
<%@page import="java.net.InetAddress"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<style>

table {
	border-collapse: collapse;
	width: 630px;
	margin: 1px auto;
	font-size: 12px;
	color: #ffc601;
}
td {
	background-color: #400a0a;
}


td {
	padding: 1px 10px;
	margin: 2px 2px;
	text-align: left;
}




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
					<h1>회원가입</h1>
					<div class="new_released_box">
	<form action="registAction.jsp" method="post">
		<table border="1">
			<tr>
				<th colspan="4">◈ 개인정보입력 ◈</th>
			</tr>
			<tr>
				<td colspan="4" align="right">(*)은 반드시 입력하여 주세요.</td>
			</tr>
			<tr>
				<td>*아이디</td>
				<td><input type="text" name="id" size="10" maxlength="8">
					<input type="button" value="중복검사" onclick="alert('자바스크립트에서 추후작업');">
					(6~8자 영문자/숫자 가능)</td>
			</tr>
			<tr>
				<td>*비밀번호</td>
				<td><input type="password" name="passwd" size="10"
					maxlength="8" /> (6~8자 이내로 만들어주세요)</td>
			</tr>
			<tr>
				<td>*비밀번호확인</td>
				<td><input type="password" name="repasswd" size="10"
					maxlength="8" /> (위 비밀번호와 같이 입력해주세요)</td>
			</tr>
			<tr>
				<td>*이름(한글)</td>
				<td><input type="text" name="name" size="10" maxlength="5" />
					(예 : 홍길동)</td>
			</tr>
			<tr>
				<td>*이메일</td>
				<td><input type="text" name="email" size="30" /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><select name="mobile1">
						<option selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select> - <input type="text" name="mobile2" size="4" maxlength="4" /> - <input
					type="text" name="mobile3" size="4" maxlength="4" /></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><select name="job">
						<option>학생</option>
						<option>직장인</option>
						<option>기타</option>
				</select></td>
			</tr>
			<div id="input_width">
			<tr>
				<td>알게된 경로</td>
				<td><input type="radio" name="path">TV/신문/잡지</input>
					 <input	type="radio" name="path">인터넷</input>
					 <input type="radio"	name="path">동료</input> 
					<input type="radio" name="path">기타</input></td>
			</tr>
			<tr>
			</div>
				<td>가입인사</td>
				<td><textarea cols="70" rows="4" name="profile"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="회원가입" />
					<input type="reset" value="취소" /></td>
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