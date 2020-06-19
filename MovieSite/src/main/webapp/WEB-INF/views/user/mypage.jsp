<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div id="list" style="text-align: left">
	<article>
		<section>
			<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">마이리스트</li>
		  		<li class="breadcrumb-item active">영화</li>
			</ol>
				<hr>
			<c:choose>
				<c:when test="${movieList.size() == 0}">
					<h3 style="color: red;">추가한 마이 리스트가 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<div id="movieList">
					<c:forEach items="${movieList}" var="movie">
						<a href="movie_detail?mseq=${movie.mseq}" style="text-align: center">
							<img src="images/movie_images/${movie.image}" width="160" height="240" />
							<br> ${movie.title}
						</a>
					</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</article>
	
	<article>
		<section>
			<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">마이리스트</li>
		  		<li class="breadcrumb-item active">배우</li>
			</ol>
			<hr>
			<c:choose>
				<c:when test="${actorList.size() == 0}">
					<h3 style="color: red;">추가한 마이 리스트가 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<div id="actorList">
					<c:forEach items="${actorList}" var="actor">
						<a href="actor_detail?aseq=${actor.aseq}" style="text-align: center">
							 <img src="images/actor_images/${actor.image}" width="160" height="240" />
							 <br> ${actor.name}
						</a> 
					</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</article>
	
	<article>
		<section>
			<ol class="breadcrumb" style="">
		  		<li class="breadcrumb-item active">마이리스트</li>
		  		<li class="breadcrumb-item active">VOD 장바구니</li>
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
										<a class='btn btn-info btn-xs' href="update_vod?vseq=${vod.vseq}"><span class="glyphicon glyphicon-edit"></span>결제</a>
										<a href="cancel_vod?vseq=${vod.vseq}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>취소</a>
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
	

<%@ include file="../footer.jsp"%>
</html>