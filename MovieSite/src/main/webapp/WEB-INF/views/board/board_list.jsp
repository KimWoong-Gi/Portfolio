<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<ol class="breadcrumb" style="">
		  <li class="breadcrumb-item active">게시판</li>
		  <li class="breadcrumb-item active">[${title}]</li>
</ol>

<div style="width:100%" align="center">
<table id="boardList" class="table table-bordered table-hover" style="text-align:center; width:100%;">
	<c:choose>
		<c:when test="${boardList.size()<=0}">
			<h3 style="color: red; text-align: center;">작성된 글이 없습니다.</h3>
		</c:when>

		<c:otherwise>
		<thead class="thead-dark">
			<tr>
				<th scope="col">글 번호</th>
				<th class="title" scope="col">제목</th>
				<th scope="col">작성자</th>
				<th class="date" scope="col">작성일</th>
			</tr>
		</thead>
			<c:forEach items="${boardList}" var="board" varStatus="status">
				<tr>
					<th scope="row">${(criteria.pageNum-1)*10+(status.count)}</th>
					<td class="title"><a href="board_detail?bseq=${board.bseq}" class="action">${board.title}</a></td>
					<td>${board.nickname}</td>
					<td class="date"><fmt:formatDate value="${board.regdate}" type="date" /></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<%@ include file="page_area.jsp" %>
	<br>
		<div align="right" style="width:100%">
			<form name="frm" action="board_list" style="width:50%">
				<input type="hidden" name="category" value="${category}">
				<input type="text" class="search" name="key" size="30">&nbsp; <input type="submit" class="btn btn-info" value="검색" onclick="return search_check()">&nbsp;
				<c:choose>
					<c:when test="${empty sessionScope.loginUser}">
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.loginUser.getAdmin() =='y'}">
								<input type="button" class="btn btn-info" value="글쓰기" onclick="location.href='board_write_form'">
							</c:when>
							<c:otherwise>
								<c:choose>
								<c:when test="${category == 'a' || category == 'b'}">
								</c:when>
								<c:otherwise>
									<input type="button" class="btn btn-info" value="글쓰기" onclick="location.href='board_write_form'">
								</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</form>
		</div>
</div>
<%@ include file="../footer.jsp"%>