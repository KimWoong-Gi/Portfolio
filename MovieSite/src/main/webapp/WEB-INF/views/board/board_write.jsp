<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div style="text-align: left">
	<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">게시판</li>
		  		<li class="breadcrumb-item active">게시글 등록</li>
			</ol>
	<br>
	<form name="frm" action="board_write" style="width: 100%" method="post" enctype="multipart/form-data">
		<table id="board" class="table table-bordered">
			<thead class="thead-dark">
			<tr>
				<th scope="col">게시판</th>
				<td class="th">
				<select name="category">
						<c:choose>
							<c:when	test="${sessionScope.loginUser.admin == 'y' || sessionScope.loginUser.admin == 'y'}">
								<option value="a">공지사항</option>
								<option value="b">이벤트</option>
								<option value="c">영화게시판</option>
								<option value="d">건의사항</option>
							</c:when>
							<c:otherwise>
								<option value="c">영화게시판</option>
								<option value="d">건의사항</option>
							</c:otherwise>
						</c:choose>
				</select>
				</td>
				<th scope="col">작성자</th>
				<td class="th">
				<input type="hidden" name="nickname" value="${sessionScope.loginUser.nickname}">
				${sessionScope.loginUser.nickname}
				</td>
			</tr>
			</thead>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="title" size="50" maxlength="50" width="100%"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><textarea rows="15" cols="80" name="content"></textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td width="343" colspan="5" align="left"><input type="file" name="image1">
				</td>
			</tr>
		</table>
		<br>
		<div style="float:right">
		 <input type="submit" class="btn btn-info" value="작성" onclick="return board_write_check()">&nbsp;
		 <input type="button" class="btn btn-info" value="취소" onclick="return board_cancel_check()">
		</div>	
	</form>
</div>
<%@ include file="../footer.jsp"%>