<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="css/join.css">

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="images/main_images/login.png" id="icon" alt="User Icon" />
      <h1>회원 정보 수정</h1><br>
    </div>

    <!-- Update Form -->
    <form name="frm" action="admin_user_update" style="width:80%; text-align:left; margin: 0 0 0 170px;">
	 <label for="id">아이디</label>
	 <input type="text" id="id" name="id" value="${user.id}">
	 <br> 
	 <label for="pwd">비밀번호</label>
	 <input	type="text" id="pwd" name="pwd" value="${user.pwd}"><br>
	 <label for="name">이름</label>
	 <input	type="text" id="name" name="name" value="${user.name}"><br>
	 <label for="nickname">닉네임</label>
	 <input type="text" id="nickname" name="nickname" value="${user.nickname}">
	 <br> 			
	 <label for="email">E-mail</label>
	 <input	type="email"  id="email" name="email" value="${user.email}"><br>			
     <label for="phone">전화번호</label>
	 <input	type="tel" id="phone" name="phone" value="${user.phone}"><br><br>
	 <div style="float:center;">
	 <input type="submit" value="수정">
	 <input type="button" value="삭제" onclick="return delete_check()">
     <input type="reset" value="취소" onclick="location='user_list'"><br><br>
     </div>
    </form>

  </div>
</div>
<%@ include file="../footer.jsp" %>