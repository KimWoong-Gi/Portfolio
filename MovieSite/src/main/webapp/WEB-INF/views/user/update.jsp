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
      <h1>Update</h1><br>
      (아이디, 이름, 닉네임은 변경이 불가능합니다.)
    </div>

    <!-- Update Form -->
    <form name="frm" style="width:80%; text-align:left; margin: 0 0 0 170px;" action="user_update" method="post">
	 <label for="id">아이디</label>
	 <input type="text" id="id" name="id" value="${user.id}" readonly="readonly">
	 <br> 
	 <label for="pwd">비밀번호</label>
	 <input	type="password" id="pwd" name="pwd"><br>
	 <label for="pwdCheck">비밀번호 확인</label>
	 <input	type="password"  id="pwdCheck" name="pwdCheck"><br>
	 <label for="name">이름</label>
	 <input	type="text" id="name" name="name" value="${user.name}" readonly="readonly"><br>
	 <label for="nickname">닉네임</label>
	 <input type="text" id="nickname" name="nickname" value="${user.nickname}" readonly="readonly">
	 <br> 			
	 <label for="email">E-mail</label>
	 <input	type="email"  id="email" name="email" value="${user.email}"><br>			
     <label for="phone">전화번호</label>
	 <input	type="tel" id="phone" name="phone" value="${user.phone}"><br><br>
	 <div style="float:center; margin: 0 0 0 100px;">
	 <input type="submit" value="수정" onclick="return update_check()">
     <input type="reset" value="취소" onclick="location='user_mypage'"><br><br>
     </div>
    </form>

  </div>
</div>
<%@ include file="../footer.jsp" %>