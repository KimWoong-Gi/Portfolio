<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- link rel="stylesheet" href="css/bootstrap.min.css"> -->
</head>
<body>
<div class="container">
    <form id="commentForm" name="commentForm" method="post" style="width:100%">
    <br><br>
        <div>
            <div>
                <span><h3>댓글</h3></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 90%" rows="3" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="save_comment('${board.bseq}')" class="btn btn-info">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="bseq" name="bseq" value="${board.bseq}" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post" style="width:100%">
        <div id="commentList">
        </div>
    </form>
</div>
<script>

$(function(){
	getCommentList();	
})

function save_comment(bseq){
	if(${loginUser==null}){
		alert("로그인이 필요합니다.");
	}else{
	$.ajax({
		type:'POST',
		url: 'board_comment_insert',
		data: $("#commentForm").serialize(), 
		success: function(data){
			if(data="success") { 
				getCommentList(); 
				$("#content").val("");
			}else {
				
			}
		},
		error: function(request, status, error){
			alert("error:"+error);
		}
	});
	}
}

// 상품평 목록 불러오기
function getCommentList(){
	$.ajax({
		type: 'GET',
		url: 'board_comment_list',
		dataType: "json",
		data:$("#commentForm").serialize(),
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data){
			var html="";
			var cCnt = data.length;
			
			if(data.length > 0) {
				for (i=0; i<data.length; i++){
	                    html += "<div>";
	                    html += "<div id=\"comment_item\"> <strong>작성자: " + data[i].nickname+"</strong>";
	                    html += "<span id=\"write_date\">" + displayTime(data[i].regdate) + "</span>&nbsp;&nbsp;&nbsp;";
	                    html += data[i].content+"<br></div>";
	                    html += "</div>";
	                    html += "<br>";
				}
			}else{
				html += "<div>";
				html += "<div><h6>등록된 댓글이 없습니다.</h6>";
				html += "</div>";
				html += "</div>";
			}
			
			$("#cCnt").html(cCnt); 
			$("#commentList").html(html);
		},
		error: function(request, status, error){
			alert("댓글 목록을 조회하지 못헀습니다.");
		}
	});
}

function displayTime(timeValue) {
	var today = new Date();
	
	
	var gap = today.getTime() - timeValue;
	
	var dateObj = new Date(timeValue);
	var str = "";
	
	
	if (gap < (1000 * 60 * 60 * 24)) {
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		
		return [ (hh>9 ? '' : '0') + hh, ':', (mi>9 ? '' : '0') + mi].join('');
	} else {
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		
		return [ yy, '/', (mm>9 ? '':'0') + mm, '/',
				(dd>9 ? '':'0') + dd].join('');
	}
}

</script>
</body>
</html>
