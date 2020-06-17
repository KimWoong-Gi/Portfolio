<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${title}</title>

<!-- icon -->
<link rel="shortcut icon" href="images/main_images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/main_images/favicon.ico" type="image/x-icon">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

<!-- self-->
<link rel="stylesheet" href="css/movie.css">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/user.js"></script>
<script type="text/javascript" src="js/board.js"></script>
<script type="text/javascript" src="js/movie.js"></script>
<script type="text/javascript" src="js/actor.js"></script>
<script type="text/javascript" src="js/admin.js"></script>
<script type="text/javascript" src="js/find.js"></script>

</head>
<body>

	<div id="main">
		<header>
			<div id="header1" class="container" style="width: 971px; height: 160px;">
				<div id="logo" class="header" style="width: 30%">
					<a href="index"> <img alt="main" src="images/main_images/logo.png" width="200" height="100">
					</a>
				</div>
				<div class="header" style="margin: 100px 0px"	style="width:50%">
					<div id="search" class="row">
						<form method="post" name="frm_search" action="search">
							<table>
								<tr>
									<td style="width: 400px"><input type="text" class="search"	style="width: 95%" class="form-control" name="key" placeholder="검색할 내용을 입력하세요."></td>
									<td><input type="submit" class="btn btn-info" name="btn_search" value="검색" onclick="return h_search_check()"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="header" style="height: 90px; margin: 20px 0px" style="width:20%">
				 	<c:choose>
						<c:when test="${empty sessionScope.loginUser}">	
							<p>&nbsp;</p>
						</c:when>
						<c:otherwise>
							<p>[${loginUser.id}]-"${loginUser.name}"님</p>
						</c:otherwise>
					</c:choose>
					 	
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav mr-auto">
								<c:choose>
									<c:when test="${empty sessionScope.loginUser}">
										<li class="nav-item"><a class="nav-link" href="user_login_form">로그인 </a></li>
										<li class="nav-item"><a class="nav-link" href="user_join_contract">회원가입</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="nav-link" href="user_logout">로그아웃</a></li>
										<c:choose>
											<c:when test="${sessionScope.loginUser.admin == 'n'}">
												<c:choose>
												<c:when test="${title == '마이페이지' }">
												<li class="nav-item"><a class="nav-link" href="user_update_form">정보 수정</a></li>
												</c:when>
												<c:otherwise>
												<li class="nav-item"><a class="nav-link" href="user_mypage">마이페이지</a></li>
												</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<li class="nav-item"><a class="nav-link" href="admin_main">관리자페이지</a></li>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</nav>
				</div>
			</div>

			<div id="header2" class="container" align="left">
				<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:100%">
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="board_list?category=a">공지사항</a></li>
							<li class="nav-item"><a class="nav-link" href="board_list?category=b">이벤트</a></li>
							<li class="nav-item"><a class="nav-link" href="board_list?category=c">영화게시판</a></li>
							<li class="nav-item"><a class="nav-link" href="board_list?category=d">건의게시판</a></li>
						</ul>
					</div>
				</nav>
				
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">액션/SF/모험 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
								<a class="dropdown-item" href="movie_list_genre?genre=액션">액션</a>
								<a class="dropdown-item" href="movie_list_genre?genre=SF">SF</a>
								<a class="dropdown-item" href="movie_list_genre?genre=모험">모험</a>
							</div></li>
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true"	aria-expanded="false">멜로/드라마 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
								<a class="dropdown-item" href="movie_list_genre?genre=드라마">드라마</a>
								<a class="dropdown-item" href="movie_list_genre?genre=멜로/로맨스">멜로/로맨스</a>
							</div></li>
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true"	aria-expanded="false">공포/스릴러 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
								<a class="dropdown-item" href="movie_list_genre?genre=공포">공포</a>
								<a class="dropdown-item" href="movie_list_genre?genre=스릴러">스릴러</a>
							</div></li>
						<li class="nav-item dropdown">	
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true"	aria-expanded="false">코미디/가족 /애니</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown3">
								<a class="dropdown-item" href="movie_list_genre?genre=코미디">코미디</a>
								<a class="dropdown-item" href="movie_list_genre?genre=가족">가족</a>
								<a class="dropdown-item" href="movie_list_genre?genre=애니">애니</a>
							</div></li>			
					</ul>
				</div>
				</nav>
			</div>
		</header>
		<hr>
		