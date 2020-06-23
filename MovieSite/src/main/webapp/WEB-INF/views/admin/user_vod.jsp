<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/admin.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<title>VOD 내역</title>
</head>
<body style="width:600; height:500">
	<div id="list" style="text-align: left">
	<article>
		<section>
			<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">회원 관리</li>
		  		<li class="breadcrumb-item active">[${user}]</li>
		  		<li class="breadcrumb-item active">VOD 내역</li>
			</ol>
				<hr>
			<c:choose>
				<c:when test="${vodList.size() == 0}">
					<h3 style="color: red;">장바구니 목록이 없습니다.</h3>
				</c:when>
				<c:otherwise>
					 <div class="row p-5">
                        <div class="col-md-12">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="border-0 text-uppercase small font-weight-bold">번호</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">제목</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">가격</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">추가일자</th>
                                        <th class="border-0 text-uppercase small font-weight-bold text-center">결제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${vodList}" var="vod" varStatus="status">
                                    <% %>
                                    <tr>
                                        <td>${status.count}</td>
										<td><a href="movie_detail?mseq=${vod.mseq}">${vod.title}</a></td>
										<td>${vod.price}</td>
										<td><fmt:formatDate value="${vod.buydate}" type="date" /></td>
										<td class="text-center">
										<c:choose>
										<c:when test="${vod.result=='n'}">
										미결제
										</c:when>
										<c:otherwise>
										<span class="glyphicon glyphicon-ok"></span>결제완료
										</c:otherwise>
										</c:choose>
										</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="d-flex flex-row-reverse bg-dark text-white p-4">
                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">장바구니 가격</div><br>
                            <div class="h2 font-weight-light">${price}원</div>
                        </div>

                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">총 구매 가격</div><br>
                            <div class="h2 font-weight-light">${buy}원</div>
                        </div>
                    </div>
					
				</c:otherwise>
			</c:choose>
		</section>
	</article>
</div>	
</body>
</html>