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
      <h1>Log-In</h1>
    </div>

    <!-- Login Form -->
    <form name="frm" style="width:80%; text-align:left; margin: 0 0 0 170px;">
	 <label for="id">아이디</label>
	 <input type="text" class="fadeIn second" id="id" name="id">
	 <input type="button" value="중복체크" onclick="return id_check()"><br> 
	 <input type="hidden" name="reid" value="">
	 <label for="pwd">비밀번호</label>
	 <input	type="password" id="pwd" name="pwd"><br>
	 <label for="pwdCheck">비밀번호 확인</label>
	 <input	type="password"  id="pwdCheck" name="pwdCheck"><br>
	 <label for="name">이름</label>
	 <input	type="text"  id="name" name="name"><br>
	 <label for="nickname">닉네임</label>
	 <input type="text"  id="nickname" name="nickname">
	 <input type="button" value="중복체크" onclick="return nickname_check()"><br> 
	 <input type="hidden" name="renickname" value="">			
	 <label for="email">E-mail</label>
	 <input	type="email"  id="email" name="email"><br>			
     <label for="phone">전화번호</label>
	 <input	type="tel"  id="phone" name="phone"><br><br>
	 <div style="float:center; margin: 0 0 0 100px;">
	 <input type="button" value="회원가입" onclick="return join_check()">
     <input type="reset" value="취소" onclick="location='user_login_form'"><br><br>
     </div>
    </form>

  </div>
</div>
<%@ include file="../footer.jsp" %>