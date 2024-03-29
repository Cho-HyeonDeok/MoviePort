<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- /*
* Template Name: Minimal
* Template Author: Untree.co
* Author URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="../resources/assets/movieIcon.png">
<!--아이콘 출처 
  <a href="https://www.flaticon.com/kr/free-icons/" title="영화 아이콘">영화 아이콘  제작자: Good Ware - Flaticon</a> -->

<meta name="description" content="" />
<meta name="keywords" content="" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=PT+Mono&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="../resources/assets/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../resources/assets/css/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="../resources/assets/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="../resources/assets/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../resources/assets/css/aos.css">
<link rel="stylesheet" href="../resources/assets/css/style.css">
<link rel="stylesheet" href="../resources/css/member/join.css">

<title>MoviePort</title>


</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="100">

	<div class="lines-wrap">
		<div class="lines-inner">
			<div class="lines"></div>
		</div>
	</div>
	<!-- END lines -->

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav dark mb-5 site-navbar-target">
		<div class="container">
			<div class="site-navigation">
				<a href="/main" class="logo m-0">MoviePort<span
					class="text-primary">.</span></a>

				<div class="site-navigation-login">
					<!-- 로그인 안했을때 -->
					<c:if test="${member == null }">
						<span><a href="/member/login">로그인&nbsp</a>/ <a
							href="/member/join">회원가입</a></span>
					</c:if>

					<!-- 로그인 했을때 -->
					<c:if test="${member != null }">
						<c:choose>
							<c:when test="${member.admin == '1'}">
								<span><a href="/admin/adminMain">${member.nickname}(#${member.id})님&nbsp</a></span>/
							</c:when>
							<c:otherwise>
								<span><a href="/mypage/mypageMain">${member.nickname}(#${member.id})님&nbsp</a></span>/
							</c:otherwise>
						</c:choose>
						<span><a href="/member/logout.do">로그아웃</a></span>
					</c:if>
				</div>

				<div class="site_nav_msg">
					<ul
						class="js-clone-nav d-none d-lg-inline-none site-menu float-right site-nav-wrap">

						<li><a href="#home-section" class="nav-link active">Main</a></li>

						<li><a href="#portfolio-section" id="site_nav_bidulgi"
							class="nav-link">MyPage</a></li>
						<li><a href="/mypage/pwdUpdate" id="site_nav_bidulgi">비밀번호
								변경</a></li>
						<li><a href="/mypage/reviews" id="site_nav_bidulgi">내가 쓴
								글 목록</a></li>
						<li><a href="/mypage/likes" id="site_nav_bidulgi">좋아요 표시한
								목록</a></li>
						<li><a href="/mypage/resign" id="site_nav_bidulgi">회원탈퇴</a></li>
						<!-- <li class="has-children"><a href="#about-section"
							class="nav-link">About</a>
							<ul class="dropdown">
								<li><a href="bidulgi.jsp" class="nav-link">Elements</a></li>
								<li class="has-children"><a href="#">Menu Two</a>
									<ul class="dropdown">
										<li><a href="#" class="nav-link">Sub Menu One</a></li>
										<li><a href="#" class="nav-link">Sub Menu Two</a></li>
										<li><a href="#" class="nav-link">Sub Menu Three</a></li>
									</ul></li>
								<li><a href="#" class="nav-link">Menu Three</a></li>
							</ul></li>
						<li><a href="/member/login">login</a></li>
						<li><a href="/member/join">join</a></li> -->
					</ul>
				</div>
				<a href="#"
					class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-inline-block"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>

			</div>
		</div>
	</nav>

	<div class="untree_co-section pb-0" id="home-section">
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-md-7">
					<h1 class="heading gsap-reveal-hero mb-3">
						<strong>MyPagePort<span class="text-primary">.</span></strong>
					</h1>
					<!-- <h2 class="subheading gsap-reveal-hero mb-4">
						All of My Information in here</strong>.
					</h2> -->
				</div>

				<div id="h_H" class="col-md-10 col-lg-12 text-center">
					<div class="h_L">
						<form id="genreForm" action="/movie/movieCategory" method="get">
							<ul class="h_menu">
								<li><a class="genre_move" href="액션" id="bidulgi">액션</a></li>
								<li><a class="genre_move" href="로맨스" id="bidulgi">로맨스</a></li>
								<li><a class="genre_move" href="코미디" id="bidulgi">코미디</a></li>
								<li><a class="genre_move" href="스릴러" id="bidulgi">스릴러</a></li>
								<li><a class="genre_move" href="공포" id="bidulgi">호러</a></li>
								<li><a class="genre_move" href="SF" id="bidulgi">SF</a></li>
								<li><a class="genre_move" href="애니메이션" id="bidulgi">애니</a></li>
								<li class="bar"></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 헤더 끝 -->
	<div class="row mt-5">
		<div class="col-12 text-center">
			
              **==========
              NOTE: 
              Please don't remove this copyright link unless you buy the license here https://untree.co/license/  

              **==========
           
			<p class="mb-0">
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				. All Rights Reserved. &mdash; Designed with love by <a
					href="https://untree.co">Untree.co</a> Distributed By <a
					href="https://themewagon.com">ThemeWagon</a>
				License information: https://untree.co/license/
			</p>
		</div>
	</div>
	</div>
	<!-- /.container -->
	</div>
	<!-- /.site-footer -->

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>

	<script src="../resources/assets/js/jquery-3.4.1.min.js"></script>
	<script src="../resources/assets/js/popper.min.js"></script>
	<script src="../resources/assets/js/bootstrap.min.js"></script>
	<script src="../resources/assets/js/owl.carousel.min.js"></script>
	<script src="../resources/assets/js/jquery.animateNumber.min.js"></script>
	<script src="../resources/assets/js/jquery.waypoints.min.js"></script>
	<script src="../resources/assets/js/jquery.fancybox.min.js"></script>
	<script src="../resources/assets/js/aos.js"></script>


	<script src="../resources/assets/js/wave-animate.js"></script>
	<script src="../resources/assets/js/circle-progress.js"></script>

	<!-- <script src="../resources/assets/js/imagesloaded.pkgd.js"></script> -->

	<script src="../resources/assets/js/isotope.pkgd.min.js"></script>
	<script src="../resources/assets/js/jquery.easing.1.3.js"></script>
	<script src="../resources/assets/js/TweenMax.min.js"></script>
	<script src="../resources/assets/js/ScrollMagic.min.js"></script>
	<script src="../resources/assets/js/scrollmagic.animation.gsap.min.js"></script>


	<script src="../resources/assets/js/custom.js"></script>

</body>

</html>
