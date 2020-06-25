<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="css/login.css">
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="images/main_images/login.png" id="icon" alt="User Icon" />
      <h1>Log-In</h1>
    </div>

    <!-- Login Form -->
    <form name="frm" action="user_login" method="post">
      <input type="text" id="login" class="fadeIn second" name="id" placeholder="username">
      <input type="password" id="password" class="fadeIn third" name="pwd" placeholder="password">
      <input type="submit" class="fadeIn fourth" value="로그인" onclick="return login_check()">
	  <label style="width:100%">${message}</label>
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter" style="height:100px">
      <input type="button" class="fadeIn fourth" value="아이디 비밀번호 찾기" onclick="find_id_form()">
    </div>

  </div>
</div>

<%@ include file="../footer.jsp"%>