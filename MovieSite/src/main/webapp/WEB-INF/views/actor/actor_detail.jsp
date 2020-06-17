<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div id="detail">
	<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">배우</li>
		  		<li class="breadcrumb-item active">[${actor.name}]</li>
			</ol>
	<div class="media">
		<img src="images/actor_images/${actor.image}" class="mr-3" alt="${actor.name}" width="200" height="300">
		<div class="media-body">
			<h5 class="mt-0">[${actor.name}]</h5>
			<br><br><br><br><br><br><br><br>
			출생: ${actor.born} <br> 나이:
			${actor.age } <br> 신체: ${actor.body} <br>
		</div>
		<a href="add_myactor?aseq=${actor.aseq}" style="float: right">
		 <img src="images/main_images/favorite.png">마이리스트 추가
		</a>
	</div>

	<article>
		<h3>배우 정보</h3>
		<hr>
		<p>
		${actor.content}
		</p>
	</article>

	<article>
		<h3>출연 영화(최근 개봉 순 정렬)</h3>
		<hr>
		<div id="movieList" style="text-align: left; overflow:auto; width:100%; height:318px" >
			<c:forEach items="${movieList}" var="movie">
				<a href="movie_detail?mseq=${movie.mseq}"style="text-align: center"> 
				<img src="images/movie_images/${movie.image}" width="180" height="270" />
				 <br> ${movie.title} <br> [${movie.release}]
				</a>
			</c:forEach>
		</div>
	</article>


	<%@include file="comment.jsp"%>
</div>
<%@ include file="../footer.jsp"%>
</html>