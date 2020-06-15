<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 체크</title>
<link rel="stylesheet" href="css/join.css">
<script type="text/javascript">
function nicknameok(){
  opener.frm.nickname.value="${nickname}"; 
  opener.frm.renickname.value="${nickname}";
  self.close();
}
function null_check(){
	if(document.frm.nickname.value==""){
		alert("검색할 닉네임을 입력하세요!");
		document.frm.nickname.focus();
		document.location.reload();
	}else{
		document.frm.action="nickname_check";
		document.frm.submit();
	}
}
</script>
</head>
<body>
<div id="wrap">
  <h1>닉네임 중복확인</h1>
  <hr>
  <form name=frm style="margin-right:0 " action="nickname_check" >
    	<input type=text id="search" name="nickname" value="${nickname}"> 
    	<input type=button value="검색" onclick="null_check()"><br>     
    <div style="margin-top: 20px">
    <c:choose>
    <c:when test="${empty nickname}">   
    </c:when>
    <c:otherwise>
      <c:if test="${message == 1}">
        <script type="text/javascript">
          opener.document.frm.nickname.value="";
        </script>
        ${nickname}는 이미 사용중인 닉네임입니다.
      </c:if>
      <c:if test="${message==-1}">
        ${nickname}는 사용 가능한 닉네임입니다.
        <input type="button" value="사용" onclick="nicknameok()">
      </c:if>
      </c:otherwise>
      </c:choose>
    </div>
  </form>
</div>  
</body>
</html>