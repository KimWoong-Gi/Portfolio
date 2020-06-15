function board_write_check(){
	if(document.frm.title.value==""){
		alert("제목을 입력하세요!")
		document.frm.title.focus();
		return false;
	}else if(document.frm.content.value==""){
		if(confirm("내용을 입력하지 않았습니다.\n이대로 작성하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
}

function board_update_check(){
	if(document.frm.title.value==""){
		alert("제목을 입력하세요!")
		document.frm.title.focus();
	}else if(document.frm.content.value==""){
		if(confirm("내용을 입력하지 않았습니다.\n이대로 작성하시겠습니까?")){
			document.frm.action="board_update";
			document.frm.submit();
		}
	}else{
		document.frm.action="board_update";
		document.frm.submit();
	}
}

function board_cancel_check(){
	if(confirm("작성 중인 내용은 저장되지 않습니다.\n취소하시겠습니까?")){
		history.go(-1);
	}else{
		return false;
	}
}

function board_delete_check(){
	if(confirm("삭제된 내용은 복구할 수 없습니다. \n삭제하시겠습니까?")){
		document.frm.action="board_delete";
		document.frm.submit();
	}
}