<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div style="width:100%" align="center">
	<h1>영화 수정</h1>
	<form name="frm" method="post" action="actor_update" enctype="multipart/form-data" style="width:80%">
		<input type="hidden" name="aseq" value="${actor.aseq}">
		<table id="insert" class="table table-bordered" style="text-align:center">
			<tr>
				<th>이름</th>
				<td align="left"><input type="text" name="name" size="30" value="${actor.name}"></td>
				<th>나이</th>
				<td align="left"><input type="text" name="age" size="30" value="${actor.age}"></td>				
			</tr>
			<tr>
				<th>출생</th>
				<td align="left"><input type="text" name="born" size="30" value="${actor.born}"></td>
				<th>신체</th>
				<td align="left"><input type="text" name="body" size="30" value="${actor.body}"></td>	
			</tr>
			<tr>
				<th>상세정보</th>
				<td colspan="5" align="left"><textarea name="content" rows="8" cols="80" placeholder="간략한 정보 및 수상 내역 입력">${actor.content }</textarea>
				</td>
			</tr>
			<tr>
				<th>배우 이미지</th>
				<td width="343" colspan="5" align="left">
				<input type="file" name="image1">
				<input type="hidden" name="image" value="${actor.image}">
				</td>
			</tr>
		</table>
		<input type="submit" class="btn btn-info" value="수정" onClick="return actor_update_check()">
		<input type="button" class="btn btn-info" value="삭제" onClick="return actor_delete_check()">
		<input type="button" class="btn btn-info" value="취소" onClick="return actor_cancel_check()">
	</form>
</div>	
<%@ include file="../footer.jsp"%>