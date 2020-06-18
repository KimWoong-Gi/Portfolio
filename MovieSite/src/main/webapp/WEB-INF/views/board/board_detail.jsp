<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div style="text-align: left">
		<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">게시판</li>
		  		<li class="breadcrumb-item active">
					<c:if test="${board.category=='a'}">[공지사항]</c:if>
					<c:if test="${board.category=='b'}">[이벤트]</c:if>
					<c:if test="${board.category=='c'}">[영화게시판]</c:if>
					<c:if test="${board.category=='d'}">[건의사항]</c:if>
				</li>
		  		<li class="breadcrumb-item active">게시글 상세 보기</li>
			</ol>
		<input type="hidden" name="bseq" value="${board.bseq}">
		<table id="u_board" class="table table-bordered">
			<thead class="thead-dark">
			<tr>
				<th scope="col">게시판</th>
				<td class="th">
					<c:if test="${board.category=='a'}">공지사항</c:if>
					<c:if test="${board.category=='b'}">이벤트</c:if>
					<c:if test="${board.category=='c'}">영화게시판</c:if>
					<c:if test="${board.category=='d'}">건의사항</c:if>
				</td>
				<th scope="col">작성자</th>
				<td class="th">
				${board.nickname}
				</td>
				<th scope="col">작성일</th>
				<td class="th">
				<fmt:formatDate value="${board.regdate}" type="date" />
				</td>
			</tr>
			</thead>
			<tr>
				<th scope="row">제목</th>
				<td colspan="5" class="left">
				${board.title}
				</td>
				
			</tr>
			<tr height="300">
				<td colspan="6" class="left">
				<c:choose>
				<c:when test="${board.image=='default.jpg'}">
				</c:when>
				<c:otherwise>
				<img src="images/board_images/${board.image}" width="300" height="250"/>
				</c:otherwise>
				</c:choose>
				${board.content}</td>
			</tr>
		</table>
		<br>
		<div style="float:right">
		<c:choose>
		<c:when test="${empty sessionScope.loginUser}">
		</c:when>
		<c:otherwise>
		<c:choose>
		 <c:when test="${sessionScope.loginUser.nickname == board.nickname || sessionScope.loginUser.admin =='y'}">
		 <input type="button" class="btn btn-info" value="수정" onclick="location.href='board_update_form?bseq=${board.bseq}'">&nbsp;
		 </c:when>
		</c:choose>
		</c:otherwise>
		</c:choose>

		 <input type="button" class="btn btn-info" value="목록" onclick="location.href='board_list?category=${board.category}'">
		</div>
		
		<%@include file="comment.jsp" %> 	
</div>
<%@ include file="../footer.jsp"%>