<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div>
<nav aria-label="Page navigation example">
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li class="page-item">
				<a href="board_list${pageMaker.makeQuery(pageMaker.startPage-1)}&category=${category}">[이전]</a>
			</li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
				<li class="page-item">
				<a class="page-link" href="board_list${pageMaker.makeQuery(index)}&category=${category}">[${index}]</a>
				</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="page-item">
				<a href="board_list${pageMaker.makeQuery(pageMaker.endPage+1)}&category=${category}">[다음]</a>
			</li>
		</c:if>
		
	</ul>
</nav>
</div>