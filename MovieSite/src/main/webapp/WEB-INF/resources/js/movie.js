function movie_insert_check() {
	if (document.frm.title.value == "") {
		alert("제목을 입력하세요!");
		document.frm.title.focus();
		return false;
	} else if (document.frm.genre.value == "") {
		alert("장르를 선택하세요!");
		document.frm.genre.focus();
		return false;
	} else if (document.frm.director.value == "") {
		alert("감독명을 입력하세요!");
		document.frm.director.focus();
		return false;
	} else if (document.frm.runtime.value == "") {
		alert("러닝타임을 입력하세요!");
		document.frm.runtime.focus();
		return false;
	} else if (document.frm.release.value == "") {
		alert("개봉일을 입력하세요!");
		document.frm.release.focus();
		return false;
	} else if (document.frm.price.value == "") {
		alert("VOD 구매 가격을 입력하세요!");
		document.frm.price.focus();
		return false;
	} else if (document.frm.content.value == "") {
		alert("상세정보를 입력하세요!");
		document.frm.content.focus();
		return false;
	} else if (document.frm.image1.value == "") {
		alert("이미지 파일을 첨부하세요!");
		document.frm.image1.focus();
		return false;
	} else if (document.frm.trailer.value == "") {
		alert("트레일러 영상 링크를 입력하세요!\n전체 링크가 아닌 유튜브 링크 마지막 코드만 입력해야 합니다."
				+ "\nex)https://www.youtube.com/watch?v=****** => *표시 부분");
		document.frm.trailer.focus();
		return false;
	}
}

function movie_update_check() {
	if (document.frm.title.value == "") {
		alert("제목을 입력하세요!");
		document.frm.title.focus();
		return false;
	} else if (document.frm.genre.value == "") {
		alert("장르를 선택하세요!");
		document.frm.genre.focus();
		return false;
	} else if (document.frm.director.value == "") {
		alert("감독명을 입력하세요!");
		document.frm.director.focus();
		return false;
	} else if (document.frm.runtime.value == "") {
		alert("러닝타임을 입력하세요!");
		document.frm.runtime.focus();
		return false;
	} else if (document.frm.release.value == "") {
		alert("개봉일을 입력하세요!");
		document.frm.release.focus();
		return false;
	} else if (document.frm.price.value == "") {
		alert("VOD 구매 가격을 입력하세요!");
		document.frm.price.focus();
		return false;
	} else if (document.frm.content.value == "") {
		alert("상세정보를 입력하세요!");
		document.frm.content.focus();
		return false;
	} else if (document.frm.image1.value == "") {
		document.frm.image1.value = document.frm.image.value;
	} else if (document.frm.trailer.value == "") {
		alert("트레일러 영상 링크를 입력하세요!\n전체 링크가 아닌 유튜브 링크 마지막 코드만 입력해야 합니다."
				+ "\nex)https://www.youtube.com/watch?v=****** => *표시 부분");
		document.frm.trailer.focus();
		return false;
	}
}

function NumFormat(t) // 원 단위, 찍어주기
{
	s = t.value;
	s = s.replace(/\D/g, '');
	l = s.length - 3;
	while (l > 0) {
		s = s.substr(0, l) + ',' + s.substr(l);
		l -= 3;
	}
	t.value = s;
	return t;
}

function movie_cancel_check() {
	if (confirm("작성 중인 내용은 저장되지 않습니다.\n취소하시겠습니까?")) {
		history.go(-1);
	} else {
		return false;
	}
}
function movie_delete_check(){
	if(confirm("삭제된 내용은 복구할 수 없습니다. \n삭제하시겠습니까?")){
		document.frm.action="movie_delete";
		document.frm.submit();
	}
}
