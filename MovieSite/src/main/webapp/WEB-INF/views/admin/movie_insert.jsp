<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div style="width:100%" align="center">
	<h1>영화 등록</h1>
	<form name="frm" method="post" action="movie_insert" enctype="multipart/form-data" style="width:80%">
		<table id="insert" class="table table-bordered" style="text-align:center">
			<tr>
				<th>제목</th>
				<td align="left"><input type="text" name="title" size="30"></td>
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
				<td align="left"><input type="text" name="director" size="30"></td>
				<th>러닝 타임</th>
				<td align="left"><input type="text" name="runtime" size="11">분</td>
			</tr>
			<tr>
				<th>개봉일</th>
				<td align="left"><input type="text" name="release" size="30" placeholder="ex)1994-06-16"></td>
				<th>구매 가격</th>
				<td align="left"><input type="text" name="price" size="11" onKeyUp='NumFormat(this)'>원</td>
			</tr>
			<tr>
				<th>상세정보</th>
				<td colspan="5" align="left"><textarea name="content" rows="8" cols="80" placeholder="간략한 줄거리 및 수상 내역 입력"></textarea>
				</td>
			</tr>
			<tr>
				<th>영화 이미지</th>
				<td width="343" colspan="5" align="left"><input type="file" name="image1">
				</td>
			</tr>
			<tr>
				<th>유튜브<br> 트레일러</th>
				<td width="343" colspan="5" align="left">https://www.youtube.com/watch?v=<input type="text" name="trailer" placeholder="아이디 값만 입력">
				</td>
			</tr>
		</table>
		<input type="submit" value="등록" onClick="return movie_insert_check()">
		<input type="button" value="취소" onClick="return movie_cancel_check()">
	</form>
</div>	
<%@ include file="../footer.jsp"%>