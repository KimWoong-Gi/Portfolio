function actor_insert_check() {
	if (document.frm.name.value == "") {
		alert("이름을 입력하세요!");
		document.frm.name.focus();
		return false;
	} else if (document.frm.age.value == "") {
		alert("나이를 입력하세요!");
		document.frm.age.focus();
		return false;
	} else if (document.frm.born.value == "") {
		alert("출생 정보를 입력하세요!");
		document.frm.born.focus();
		return false;
	} else if (document.frm.body.value == "") {
		alert("신체 정보를 입력하세요!");
		document.frm.body.focus();
		return false;
	} else if (document.frm.content.value == "") {
		alert("상세정보를 입력하세요!");
		document.frm.content.focus();
		return false;
	} else if (document.frm.image.value == "") {
		alert("이미지 파일을 첨부하세요!");
		document.frm.runtime.focus();
		return false;
	}
}

function actor_update_check() {
	if (document.frm.name.value == "") {
		alert("이름을 입력하세요!");
		document.frm.name.focus();
		return false;
	} else if (document.frm.age.value == "") {
		alert("나이를 입력하세요!");
		document.frm.age.focus();
		return false;
	} else if (document.frm.born.value == "") {
		alert("출생 정보를 입력하세요!");
		document.frm.born.focus();
		return false;
	} else if (document.frm.body.value == "") {
		alert("신체 정보를 입력하세요!");
		document.frm.body.focus();
		return false;
	} else if (document.frm.content.value == "") {
		alert("상세정보를 입력하세요!");
		document.frm.content.focus();
		return false;
	} else if (document.frm.image1.value == "") {
		document.frm.image1.value = document.frm.image.value
	}
}

function actor_cancel_check() {
	if (confirm("작성 중인 내용은 저장되지 않습니다.\n취소하시겠습니까?")) {
		history.go(-1);
	} else {
		return false;
	}
}

function actor_delete_check(){
	if(confirm("삭제된 내용은 복구할 수 없습니다. \n삭제하시겠습니까?")){
		document.frm.action="actor_delete";
		document.frm.submit();
	}
}