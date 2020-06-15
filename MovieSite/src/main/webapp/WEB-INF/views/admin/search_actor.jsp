<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
<div id="search">
	<form name="frm" action="search_actor">
		<input class="search-var" type="text" name="key"> 
		<input type="submit" name="btn_search" value="검색" onclick="return search_check()">
	</form>
</div>
</div>

<div id="list">
	<article>
		<section>
			<h2>배우</h2>	<hr>
			<c:choose>
				<c:when test="${actorList.size() == 0}">
					<h3 style="color: red;">검색 결과가 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<div id="actorList">
					<table>
					<tr>
					<c:forEach items="${actorList}" var="actor">
						<td>
						<a style="text-align: center">
							<img src="images/actor_images/${actor.image}" width="160" height="240" />
							<br> ${actor.name}
							<input type="button" value="수정" onclick="location.href='actor_update_form?aseq=${actor.aseq}'">
							<input type="button" value="영화 등록" onclick="movie_input_form(${actor.aseq})">
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