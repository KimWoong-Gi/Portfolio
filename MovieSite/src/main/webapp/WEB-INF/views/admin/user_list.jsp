<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<ol class="breadcrumb" style="">
		  <li class="breadcrumb-item active">관리자 페이지</li>
		  <li class="breadcrumb-item active">유저 리스트</li>
</ol>

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
<%@ include file="../footer.jsp"%>