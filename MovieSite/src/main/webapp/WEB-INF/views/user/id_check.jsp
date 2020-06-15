<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<link rel="stylesheet" href="css/join.css">
<script type="text/javascript">
function idok(){
  opener.frm.id.value="${id}"; 
  opener.frm.reid.value="${id}";
  self.close();
}
function null_check(){
	if(document.frm.id.value==""){
		alert("검색할 아이디를 입력하세요!");
		document.frm.id.focus();
		document.location.reload();
	}else{
		document.frm.action="id_check";
		document.frm.submit();
	}
}
</script>
</head>
<body>
  <h1>아이디 중복확인</h1>
  <hr>
  <form name=frm style="margin-right:0 " action="id_check" >
    	<input type=text id="search" name="id" value="${id}"> 
    	<input type=button value="검색" onclick="null_check()"><br>     
    <div style="margin-top: 20px">   
      <c:choose>
      <c:when test="${empty id}">
      	
      </c:when>
      <c:otherwise>
      <c:if test="${message == 1}">
        <script type="text/javascript">
          opener.document.frm.id.value="";
        </script>
        '${id}'는 이미 사용중인 아이디입니다.
      </c:if>
      <c:if test="${message==-1}">
        '${id}'는 사용 가능한 아이디입니다.
        <input type="button" value="사용" onclick="idok()">
      </c:if>
      </c:otherwise>
      </c:choose>
    </div>
  </form>
 
</body>
</html>