<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div style="width:100%" align="center">
	<h1>영화 등록</h1>
	<form name="frm" method="post" action="movie_update" enctype="multipart/form-data" style="width:80%">
		<input type="hidden" name="mseq" value="${movie.mseq}">
		<table id="insert" class="table table-bordered" style="text-align:center">
			<tr>
				<th>제목</th>
				<td align="left"><input type="text" name="title" size="30" value="${movie.title}"></td>
				<th>장르</th>
				<td align="left">
				<select name="genre">
						<c:forEach items="${genreList}" var="genre" varStatus="status">
							<option value="${status.count}">${genre}</option>
						</c:forEach>
				</select>
					
			</tr>
			<tr>
				<th>감독</th>
				<td align="left"><input type="text" name="director" size="30" value="${movie.director}"></td>
				<th>러닝 타임</th>
				<td align="left"><input type="text" name="runtime" size="11" value="${movie.runtime}">분</td>
			</tr>
			<tr>
				<th>개봉일</th>
				<td align="left"><input type="text" name="release" size="30" value="${movie.release}"></td>
				<th>구매 가격</th>
				<td align="left"><input type="text" name="price" size="11" onKeyUp='NumFormat(this)' value="${movie.price}">원</td>
			</tr>
			<tr>
				<th>상세정보</th>
				<td colspan="5" align="left"><textarea name="content" rows="8" cols="80">${movie.content}</textarea>
				</td>
			</tr>
			<tr>
				<th>영화 이미지</th>
				<td width="343" colspan="5" align="left">
				<input type="file" name="image1">
				<input type="hidden" name="image"  value="${movie.image}">
				</td>
			</tr>
			<tr>
				<th>유튜브<br> 트레일러</th>
				<td width="343" colspan="5" align="left">https://www.youtube.com/watch?v=<input type="text" name="trailer" value="${movie.trailer}">
				</td>
			</tr>
		</table>
		<input type="submit" class="btn btn-info" value="수정" onClick="return movie_update_check()">
		<input type="button" class="btn btn-info" value="삭제" onClick="return movie_delete_check()">
		<input type="button" class="btn btn-info" value="취소" onClick="return movie_cancel_check()">
	</form>
</div>	
<%@ include file="../footer.jsp"%>