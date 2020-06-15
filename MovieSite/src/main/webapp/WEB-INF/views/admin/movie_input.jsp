<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/admin.js"></script>
<title>[${actor.name}]출연 영화 등록하기</title>
</head>
<body>
	<form name="frm1" action="movie_input">
		선택된 영화를 배우에 등록합니다. 
		<input type="button" value="등록" onclick="movie_input_check()">&nbsp;
		<input type="button" value="취소" onclick="input_cancel_check()">
		<input type="hidden" name="aseq" value="${actor.aseq}">
		<hr>
		선택:
		<c:choose>
		<c:when test="${movieList.size() == 0}">
		</c:when>
		<c:otherwise>
		<c:forEach items="${movieList}" var="movie">
			${movie.title}
			<input type="checkbox" name="result" checked="checked" value="${movie.mseq}">&nbsp;
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</form>
	<hr>
	<form name="frm2" action="movie_input_form">
		<input type="hidden" name="aseq" value="${actor.aseq}">
		<input type="hidden" name="check" value="${check}">
		<input type="text" name="key">&nbsp;
		<input type="submit" value="검색" onclick="search_check2()">
	</form>
		<hr>
		검색결과
		<hr>
		<c:choose>
		<c:when test="${searchList.size() == 0}">
			검색 결과에 해당하는 영화가 없습니다.
		</c:when>
		<c:otherwise>
		<div class="table-responsive">
			<form name="frm3" action="movie_input_form">
			 <table class="table table-hover">
                    <tbody>
			<c:forEach items="${searchList}" var="movie">
				<tr>
					<td class="image"><img src="images/movie_images/${movie.image}" width="60" height="60" />
					<td class="product"><strong>${movie.title}</strong><br>감독:${movie.director}
							<input type="hidden" name="mseq" value="${movie.mseq}">
							<input type="hidden" name="aseq" value="${actor.aseq}">	</td>			
						<td class="button"><input type="button" class="btn btn-parimary my-2 my-sm-0" value="선택" onclick="add_movie()">
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			</form>	
           </div>
		</c:otherwise>
		</c:choose>

</body>
</html>