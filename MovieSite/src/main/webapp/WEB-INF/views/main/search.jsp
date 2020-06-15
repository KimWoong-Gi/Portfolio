<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
.before{
height:308px;
overflow: hidden;
 }
 
.after{
height:auto;
}

.show{

}

.hide{
display:none;
}
</style>

<script>
	$(document).ready(function() {
		$("#more").click(function() {
				$("#movielist").toggleClass("before after");
				$("#more").toggleClass("show hide");
				$("#close").toggleClass("hide show");
		});
		
		$("#close").click(function() {
			$("#movielist").toggleClass("before after");
			$("#more").toggleClass("show hide");
			$("#close").toggleClass("hide show");
	});
	});
</script>



<div id="list">
	<article>
			<c:choose>
				<c:when test="${movieList.size() == 0}">
				<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">'${key}'검색 결과</li>
		  		<li class="breadcrumb-item active">영화</li>
				</ol>
				<hr>
				<h3 style="color: red; text-align: center;">검색 결과가 없습니다.</h3>
				</c:when>
				<c:when test="${movieList.size() > 0 && movieList.size() <= 5}">
				<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">'${key}'검색 결과</li>
		  		<li class="breadcrumb-item active">영화</li>
				</ol>
				<hr>
				<div id="movielist">
					<c:forEach items="${movieList}" var="movie">
						<a class="action" href="movie_detail?mseq=${movie.mseq}" style="text-align: center">
							<img src="images/movie_images/${movie.image}" width="190" height="285" alt="[${movie.title}]<br>감독: ${movie.director}<br>장르: ${movie.genre}, ${movie.release} 개봉 "/>
							<br> ${movie.title}
						</a>
					</c:forEach>
				</div>
				</c:when>
				<c:otherwise>
				<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">'${key}'검색 결과</li>
		  		<li class="breadcrumb-item active">영화</li>
				</ol>
				<hr>	
					<div id="movielist" class="before">
					<c:forEach items="${movieList}" var="movie" varStatus="status">
						<a class="action" href="movie_detail?mseq=${movie.mseq}" style="text-align: center">
							<img src="images/movie_images/${movie.image}" width="190" height="285" alt="[${movie.title}]<br>감독: ${movie.director}<br>장르: ${movie.genre}, ${movie.release} 개봉 "/>
							<br> ${movie.title}
						</a>
					</c:forEach>
					</div>
					<input type="button" id="more" class="btn btn-info show" style="float:right" value="더보기">
					<input type="button" id="close" class="btn btn-info hide" style="float:right" value="닫기">
				</c:otherwise>
			</c:choose>
	</article>
	<br>
	<article>
			<c:choose>
				<c:when test="${actorList.size() == 0}">
				</c:when>
				<c:otherwise>
				<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">'${key}'검색 결과</li>
		  		<li class="breadcrumb-item active">배우</li>
				</ol>
				<hr>
					<div id="actorList">
					<c:forEach items="${actorList}" var="actor">
						<a class="action" href="actor_detail?aseq=${actor.aseq}" style="text-align: center">
							 <img src="images/actor_images/${actor.image}" width="150" height="225" />
							 <br> ${actor.name}
						</a> 
					</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
	</article>

	</div>

	<%@ include file="../footer.jsp" %>
</html>