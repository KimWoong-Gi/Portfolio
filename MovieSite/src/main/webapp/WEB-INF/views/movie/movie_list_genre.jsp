<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div id="list">
	<article>
		<section>
			<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">장르별 영화</li>
		  		<li class="breadcrumb-item active">[${genre}]</li>
			</ol>
			
			<c:choose>
				<c:when test="${movieList.size() == 0}">
					<h3 style="color: red;">검색 결과가 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<div id="movieList">
					<c:forEach items="${movieList}" var="movie">
						<a href="movie_detail?mseq=${movie.mseq}" style="text-align: center">
							<img src="images/movie_images/${movie.image}" width="180" height="270" />
							<br> ${movie.title}
						</a>
					</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</article>

	</div>

	<%@ include file="../footer.jsp" %>
</html>