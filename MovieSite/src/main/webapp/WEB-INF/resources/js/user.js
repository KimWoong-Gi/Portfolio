/**
 * 
 */
function login_check() {
	if (document.frm.id.value == "") {
		alert("아이디를 입력하세요!");
		document.frm.id.focus();
		return false;
	} else if (document.frm.pwd.value == "") {
		alert("비밀번호를 입력하세요!")
		document.frm.pwd.focus();
		return false;
	} else{
		document.frm.action="user_login";
		document.frm.submit();
	}
}

function h_search_check() {
	if (document.frm_search.key.value == "") {
		alert("검색할 내용을 입력하세요!");
		document.frm_search.key.focus();
		return false;
	}
}

function search_check() {
	if (document.frm.key.value == "") {
		alert("검색할 내용을 입력하세요!");
		document.frm.key.focus();
		return false;
	}
}

function contract_check() {
	if (document.frm.okon1[1].checked == true) {
		alert("약관에 동의하셔야 합니다!")
		return false;
	} else{
		document.frm.action="user_join_form";
		document.frm.submit();
	}
}

function join_check() {
	if (document.frm.id.value == "") {
		alert("아이디를 입력하세요!");
		document.frm.id.focus();
		return false;
	} else if (document.frm.reid.value == "") {
		alert("아이디 중복 체크를 확인해주세요!")
		document.frm.id.focus();
		return false;
	} else if (document.frm.pwd.value == "") {
		alert("비밀번호를 입력하세요!");
		document.frm.pwd.focus();
		return false;
	} else if (document.frm.pwdCheck.value == "") {
		alert("비밀번호를 한번 더 입력해 주세요!");
		document.frm.pwdCheck.focus();
		return false;
	} else if (document.frm.pwd.value != document.frm.pwdCheck.value) {
		alert("비밀번호가 동일하지 않습니다!");
		document.frm.pwd.focus();
		return false;
	} else if (document.frm.name.value == "") {
		alert("이름을 입력하세요!");
		document.frm.name.focus();
		return false;
	} else if (document.frm.nickname.value == "") {
		alert("닉네임을 입력하세요!");
		document.frm.nickname.focus();
		return false;
	} else if (document.frm.renickname.value == "") {
		alert("닉네임 중복 체크를 확인해주세요!")
		document.frm.nickname.focus();
		return false;
	} else if (document.frm.email.value == "") {
		alert("이메일을 입력하세요!");
		document.frm.email.focus();
		return false;
	} else if (document.frm.phone.value == "") {
		alert("연락처를 입력하세요!");
		document.frm.phone.focus();
		return false;
	} else{
		document.frm.action="user_join";
		document.frm.submit();
	}
}

function update_check() {
	if (document.frm.pwd.value == "") {
		alert("비밀번호를 입력하세요!");
		document.frm.pwd.focus();
		return false;
	} else if (document.frm.pwdCheck.value == "") {
		alert("비밀번호를 한번 더 입력해 주세요!");
		document.frm.pwdCheck.focus();
		return false;
	} else if (document.frm.pwd.value != document.frm.pwdCheck.value) {
		alert("비밀번호가 동일하지 않습니다!");
		document.frm.pwd.focus();
		return false;
	}  else if (document.frm.email.value == "") {
		alert("이메일을 입력하세요!");
		document.frm.email.focus();
		return false;
	} else if (document.frm.phone.value == "") {
		alert("연락처를 입력하세요!");
		document.frm.phone.focus();
		return false;
	} else{
		alert("수정이 완료되었습니다.")
		document.frm.action="user_update";
		document.frm.submit();
	}
}

function id_check() {
	if (document.frm.id.value == "") {
		alert("아이디를 입력해 주세요!");
		document.frm.id.focus();
		return false;
	}

	// 아이디 중복 체크 창 생성.
	var url = "id_check_form?id=" + document.frm.id.value;

	window.open(url, "_blank_1", "toolbar-no, menubar=no,"
			+ " scrollbars=yes, resizable=no, width=450, height= 350;");
}

function nickname_check() {
	if (document.frm.nickname.value == "") {
		alert("닉네임을 입력해 주세요!");
		document.frm.nickname.focus();
		return false;
	}

	// 아이디 중복 체크 창 생성.
	var url = "nickname_check_form?nickname=" + document.frm.nickname.value;

	window.open(url, "_blank_1", "toolbar-no, menubar=no,"
			+ " scrollbars=yes, resizable=no, width=450, height= 350;");
}