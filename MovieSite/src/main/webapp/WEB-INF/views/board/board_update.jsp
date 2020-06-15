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
		  		<li class="breadcrumb-item active">게시글 수정</li>
			</ol>
	<br>
	<br>
	
	<form name="frm" action="board_update" style="width: 100%" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bseq" value="${board.bseq}">
		<input type="hidden" name="category" value="${board.category}">
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
				<th>제목</th>
				<td colspan="5">
				<input type="text" name="title" size="50" maxlength="50" width="100%" value="${board.title}">
				</td>
				
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5"><textarea rows="15" cols="80" name="content">${board.content}</textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td width="343" colspan="5" align="left"><input type="file" name="image1" value="${board.image}">
				</td>
			</tr>
		</table>
		<br>
		<div style="float:right">
		 <input type="submit" class="btn btn-info" value="수정" onclick="return board_write_check()">&nbsp;
		 <input type="button" class="btn btn-info" value="삭제" onclick="return board_delete_check()">&nbsp;
		 <input type="button" class="btn btn-info" value="취소" onclick="return board_cancel_check()">
		</div>	
	</form>
</div>
<%@ include file="../footer.jsp"%>