<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
					 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 영화 관리 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
						<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="movie_insert_form">영화 추가</a>
							<a class="dropdown-item" href="search_movie?key=''">영화 수정</a>
						</div></li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
					 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 배우 관리 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
						<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="actor_insert_form">배우 추가</a> 
							<a class="dropdown-item" href="search_actor?key=''">배우 수정</a>
						</div></li>
				</ul>
			</div>
		</nav>
</div>
<br>
<br>
<div style="width:100%" align="center">
<table id="userList" class="table table-bordered table-hover" style="text-align:center; width:100%;">
	<c:choose>
		<c:when test="${userList.size()<=0}">
			<h3 style="color: red; text-align: center;">검색 결과가 없습니다.</h3>
		</c:when>

		<c:otherwise>
		<thead class="thead-dark">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">ID</th>
				<th scope="col">닉네임</th>
				<th scope="col">VOD 내역</th>
			</tr>
		</thead>
			<c:forEach items="${userList}" var="user" varStatus="status">
				<tr>
					<td scope="row">${status.count}</td>
					<td><a href="user_detail?id=${user.id}" class="action">${user.id}</a></td>
					<td>${user.nickname}</td>
					<td><input type="button" onclick="user_vod_form('${user.id}')" value="내역 확인"></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>
<%@ include file="../footer.jsp" %>
</html>