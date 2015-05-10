<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<htm>
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
				<div id="banner_title">Welcome To Dstory Music Home.</div>
				<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
					Nunc quis sem nec tellus blandit tincidunt. Duis vitae velit sed
					dui malesuada dignissim.</p>
		
			</div>
		</div>
		<!-- top 메뉴 -->
		<jsp:include page="/menu/top.jsp" />
		<!-- top메뉴 끝-->

		<div id="templatemo_content">

			<!-- side 메뉴 -->
			<jsp:include page="/menu/side.jsp" />
			<!-- side 메뉴끝 -->

			<div id="templatemo_right_column">
				
				<div id="new_released_section">
					<h1>Welcome to Dstory.</h1>
					
					<div class="new_released_box">
						<img src="images/albumno1.PNG" alt="image" width="80px" />
						<h3>House Ruiez</h3>
						<h4>Zone</h4>
						<div class="rantsection">
							<img class="star" src="images/yellowstar.gif" alt="star" /> <img
								class="star" src="images/yellowstar.gif" alt="star" /> <img
								class="star" src="images/yellowstar.gif" alt="star" /> <img
								class="star" src="images/yellowstar.gif" alt="star" /> <img
								class="star" src="images/whitestar.gif" alt="star" />
						</div>
						<div class="more_button">
							<a href="#">More</a>
						</div>
					</div>
					
					<div class="new_released_box">
						<img src="images/albumno2.PNG" alt="image" width="80px"/>
						<h3>Plastic Pop</h3>
						<h4>Aten Jones</h4>
						<div class="rantsection">
							<img class="star" src="images/yellowstar.gif" alt="star" /> <img
								class="star" src="images/yellowstar.gif" alt="star" /> <img
								class="star" src="images/yellowstar.gif" alt="star" /> <img
								class="star" src="images/whitestar.gif" alt="star" /> <img
								class="star" src="images/whitestar.gif" alt="star" />
						</div>
						<div class="more_button">
							<a href="#">More</a>
						</div>	
					</div>
					
					<div class="new_released_box">
						<img src="images/albumno3.PNG" alt="image" width="80px" />
						<h3>vertical naver</h3>
						<h4>sam jason</h4>
						<div class="rantsection">
							<img class="star" src="images/yellowstar.gif" alt="star" /> <img
								class="star" src="images/yellowstar.gif" alt="star" /> <img
								class="star" src="images/yellowstar.gif" alt="star" /> <img
								class="star" src="images/whitestar.gif" alt="star" /> <img
								class="star" src="images/whitestar.gif" alt="star" />
						</div>
						<div class="more_button">
							<a href="#">More</a>
						</div>
					</div>

				</div>

				<div class="templatemo_right_panel_fullwidth">
					<div id="news_section">
						<h1>News</h1>
						<div class="news_box">
							<img src="images/a2.jpg" alt="image" height="130"/>
							<h3>Magazine</h3>
							<h4>13 OCT 2020</h4>
							<p>
								Fusce vulputate tellus ac felis. Praesent mauris. Quisque
								gravida faucibus ligula. Aliquam magna. Phasellus id felis. <a
									href="#">more...</a>
							</p>
						</div>
					</div>
					<!-- end of news -->

					<div id="topdownload_section">
						<h1>Top Downloads</h1>
						<div class="topdownload_box">
							<div class="title_singer">
								I`m Not The Only One <span>Sam Smith</span>
							</div>
							<span class="download_button"><a class="download_button"
								href="#">Download</a></span>
						</div>
						<div class="topdownload_box">
							<div class="title_singer">
								Something About Us<span>Justin Hurwitz</span>
							</div>
							<span class="download_button"><a class="download_button"
								href="#">Download</a></span>
						</div>
						<div class="topdownload_box">
							<div class="title_singer">
								Overtrue <span>Daft funk</span>
							</div>
							<span class="download_button"><a class="download_button"
								href="#">Download</a></span>
						</div>
						
					</div>
					<!-- end of top download -->
				</div>

			</div>
		</div>
		<div id="templatemo_footer">
			<a href="#">Home</a> | <a href="#">Videos</a> | <a href="#">Audios</a>
			| <a href="#">Albums</a> | <a href="#">Artists</a> | <a href="#">Contact</a><br />
			Copyright © <a href="#"><strong>Your Company Name</strong></a>
		</div>
	</div>
</body>
</html>