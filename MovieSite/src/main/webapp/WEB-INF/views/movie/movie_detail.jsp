<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
	      var tag = document.createElement('script');
	      tag.src = "https://www.youtube.com/iframe_api";
	      var firstScriptTag = document.getElementsByTagName('script')[0];
	      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	      var player;
	      function onYouTubeIframeAPIReady() {
	        player = new YT.Player('player', {
	          height: '500',
	          width: '900',
	          videoId: '',
	          playerVars: {rel: 0},
	          events: {
	            'onReady': onPlayerReady,
	            'onStateChange': onPlayerStateChange
	          }
	        });
	      }

	      
	      function onPlayerReady(event) {
	    	var videoid = $("#trailer").val();
	      	event.target.cueVideoById(videoid,0, "default");
	      }

	      function onPlayerStateChange(event) {
	        if (event.data.getPlayerState()==0) {
	          event.target.stopVideo();
	          event.target.clearVideo();
	        }
	      }
		</script>
<div id="detail">
	<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">영화</li>
		  		<li class="breadcrumb-item active"><a href="movie_list_genre?genre=${movie.genre}">[${movie.genre}]장르</a></li>
		  		<li class="breadcrumb-item active">${movie.title}</li>
			</ol>
<div class="media">
  <img src="images/movie_images/${movie.image}" class="mr-3" alt="${movie.title}" width="200" height="250">
  <div class="media-body">
    <h5 class="mt-0">[${movie.title}]</h5>
    	<br><br><br><br><br><br>
    	감독: ${movie.director}<br>장르: ${movie.genre}, ${movie.release} 개봉 
			<br> VOD 가격: ${movie.price}
  </div>
  <div align="right">
  <a href="add_mymovie?mseq=${movie.mseq}" style=float:right> 
	<img src="images/main_images/favorite.png">마이리스트 추가
	</a><br><br><br><br><br><br><br><br>
<form name="frm" style="float:right;" action="buy_vod">
	<input type="hidden" id="trailer" name="trailer" value="${movie.trailer}">
	<input type="hidden" name="mseq" value="${movie.mseq}">
	<input type="submit" class="btn btn-info" value="VOD 구매하기"> 	
</form>

  </div>
</div>
		<article>
			<h3>출연</h3>
			<hr>
			<div id="actorList" style="text-align: left">
				<c:forEach items="${actorList}" var="actor">
					<a href="actor_detail?aseq=${actor.aseq}" style="text-align: center">
					 <img src="images/actor_images/${actor.image}" width="110" height="150" />
						<br> ${actor.name}
					</a>
				</c:forEach>
			</div>
		</article>
		<article>
			<h3>영화 정보</h3>
			<hr>
			<p>
				${movie.content}
			</p>
		</article>
		
		<article>
			<h3>예고편</h3>
			<hr>
			<div id="player"></div>
		</article>
		
		<%@include file="comment.jsp" %>
</div>


<%@ include file="../footer.jsp"%>
</html>