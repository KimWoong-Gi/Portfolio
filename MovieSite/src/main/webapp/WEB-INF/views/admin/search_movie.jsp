<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<div id="search">
	<form name="frm" action="search_movie">
		<input class="search-var" type="text" name="key"> 
		<input type="submit" name="btn_search" value="검색" onclick="return search_check()">
	</form>
</div>
</div>

<div id="list">
	<article>
		<section>
			<h2>영화</h2>	<hr>
			<c:choose>
				<c:when test="${movieList.size() == 0}">
					<h3 style="color: red;">검색 결과가 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<div id="movieList">
					<table>
					<tr>
					<c:forEach items="${movieList}" var="movie">
						<td>
						<a style="text-align: center">
							<img src="images/movie_images/${movie.image}" width="160" height="240" />
							<br> ${movie.title}
							<input type="button" value="수정" onclick="location.href='movie_update_form?mseq=${movie.mseq}'">
							<input type="button" value="배우 등록" onclick="actor_input_form(${movie.mseq})">
						</a>
						</td>
					</c:forEach>
					</tr>
					</table>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</article>
</div>

	<%@ include file="../footer.jsp" %>
</html>