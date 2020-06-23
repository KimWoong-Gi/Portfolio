<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div style="width:100%" align="center">
	<h1>배우 등록</h1>
	<form name="frm" method="post" action="actor_insert" enctype="multipart/form-data" style="width:80%">
		<table id="insert" class="table table-bordered" style="text-align:center">
			<tr>
				<th>이름</th>
				<td align="left"><input type="text" name="name" size="30"></td>
				<th>나이</th>
				<td align="left"><input type="text" name="age" size="30"></td>				
			</tr>
			<tr>
				<th>출생</th>
				<td align="left"><input type="text" name="born" size="30"></td>
				<th>신체</th>
				<td align="left"><input type="text" name="body" size="30"></td>	
			</tr>
			<tr>
				<th>상세정보</th>
				<td colspan="5" align="left"><textarea name="content" rows="8" cols="80" placeholder="간략한 정보 및 수상 내역 입력"></textarea>
				</td>
			</tr>
			<tr>
				<th>배우 이미지</th>
				<td width="343" colspan="5" align="left"><input type="file" name="image1">
				</td>
			</tr>
		</table>
		<input type="submit" value="등록" onClick="return actor_insert_check()">
		<input type="button" value="취소" onClick="return actor_cancel_check()">
	</form>
</div>	
<%@ include file="../footer.jsp"%>