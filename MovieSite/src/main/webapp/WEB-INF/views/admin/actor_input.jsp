<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/admin.js"></script>
<title>[${movie.title}]출연 배우 등록하기</title>
</head>
<body>
	<form name="frm1" action="actor_input">
		선택된 배우를 영화에 등록합니다. 
		<input type="button" class="btn btn-info" value="등록" onclick="actor_input_check()">&nbsp;
		<input type="button" class="btn btn-info" value="취소" onclick="input_cancel_check()">
		<input type="hidden" name="mseq" value="${movie.mseq}">
		<hr>
		선택:
		<c:choose>
		<c:when test="${actorList.size() == 0}">
		</c:when>
		<c:otherwise>
		<c:forEach items="${actorList}" var="actor">
			${actor.name}
			<input type="checkbox" name="result" checked="checked" value="${actor.aseq}">&nbsp;
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</form>
	<hr>
	
	<form name="frm2" action="actor_input_form">
		<input type="hidden" name="mseq" value="${movie.mseq}">
		<input type="hidden" name="check" value="${check}">
		<input type="text" name="key">&nbsp;
		<input type="submit" class="btn btn-info" value="검색" onclick="return search_check2()">
	</form>	
		<hr>
		검색결과
		<hr>
		<c:choose>
		<c:when test="${searchList.size() == 0}">
			검색 결과에 해당하는 배우가 없습니다.
		</c:when>
		<c:otherwise>
		<div class="table-responsive">
			<form name="frm3" action="actor_input_form">
                  <table class="table table-hover">
                    <tbody>
                    <c:forEach items="${searchList}" var="actor">
                    <tr>
                      <td class="image"><img src="images/actor_images/${actor.image}" width="60" height="60" alt="${actor.name}"></td>
                      <td class="product"><strong>${actor.name}</strong><br>${actor.born}
                      <input type="hidden" name="mseq" value="${movie.mseq}"><input type="hidden" name="aseq" value="${actor.aseq}"></td>
                      <td class="button"><input type="button" class="btn btn-parimary my-2 my-sm-0" onclick="add_actor()" value="선택"></td>
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