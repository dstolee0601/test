
<%@ page contentType="text/html; charset=utf-8"%>
<%
//쿠키
String loginId = null;

Cookie[] cookies = request.getCookies();
if(cookies != null){
for(Cookie cookie : cookies){
	String name = cookie.getName();
	if(name.equals("loginId")){
		loginId = cookie.getValue();
		break;
	}
}
}

%>


<div id="templatemo_left_column">
	<!-- 로그인 박스 -->
	<%
  if(loginId == null){
  %>
	<h2>Login</h2>
	<div class="left_col_box">
		<form action="/user/login.jsp" method="post">
			<div class="form_row">
				<label>ID</label><input class="inputfield" name="id"
					type="text" id="id"  size="12px"/>
			</div>
			<div class="form_row">
				<label>Password</label><input class="inputfield" name="password"
					type="password" id="password" size="12px"/>
			</div>

			<input class="button" type="submit" name="login" value="Login" /> 
		<a href="/user/regist.jsp"><input type="button" value="회원가입" class="button"></a>
		</form>
	</div>
	<%}else{
				System.out.println(loginId);
  String[] loginInfo=loginId.split(","); 
  String id=loginInfo[0];
  String email=loginInfo[1];
  System.out.println("id = "+ id + " email = " + email); 
  %>
  <h2>welcome Dstory.</h2>
	<div class="left_col_box">
			<form>
						<div class="form_row">
							<div><%=id%>님 로그인중	</div>
						</div>
						<div class="form_row">Point 100</div>
						<a href='/user/login.jsp'><input class="button" type="button"
							name="login" value="로그아웃" /></a>
					</form>
	</div>
	<% }%>

	<!-- 로그인 박스 끝 -->

	<h2>Blog Entries</h2>
	<div class="left_col_box">
		<div class="blog_box">
			<h3>
				<a href="#">Curabitur quis velit quis tortor</a>
			</h3>
			Suspendisse vitae neque eget ante tristique vestibulum. Pellentesque
			vitae magna.<br /> Posted by <a href="#"><span>Admin</span></a> in <a
				href="#"><span>Videos</span></a><br /> 14 December 2020
		</div>
		<div class="blog_box">
			<h3>
				<a href="#">Duis vitae velit sed dui</a>
			</h3>
			Pellentesque vitae magna. Suspendisse vitae neque eget ante tristique
			vestibulum.<br /> Posted by <a href="#"><span>Admin</span></a> in <a
				href="#"><span>Audios</span></a><br /> 20 December 2020
		</div>
		
		<div class="blog_box">
			<a href="http://validator.w3.org/check?uri=referer"><img
				style="border: 0; width: 88px; height: 31px"
				src="http://www.w3.org/Icons/valid-xhtml10"
				alt="Valid XHTML 1.0 Transitional" width="88" height="31" vspace="8"
				border="0" /></a> <a
				href="http://jigsaw.w3.org/css-validator/check/referer"><img
				style="border: 0; width: 88px; height: 31px"
				src="http://jigsaw.w3.org/css-validator/images/vcss-blue"
				alt="Valid CSS!" vspace="8" border="0" /></a>
		</div>


	</div>
</div>