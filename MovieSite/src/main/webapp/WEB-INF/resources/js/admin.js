var openDialog = function(uri, name, options, closeCallback) {
    var win = window.open(uri, name, options);
    var interval = window.setInterval(function() {
        try {
            if (win == null || win.closed) {
                window.clearInterval(interval);
                closeCallback(win);
            }
        }
        catch (e) {
        }
    }, 1000);
    return win;
};


function actor_input_form(mseq){
	var url = "actor_input_form?mseq="+mseq;
	var name = "_blank_1";
	var options = "toolbar-no, menubar=no, scrollbars=yes, resizable=no, width=450, height= 500;";
	
	window.openDialog(url, name, options, function(win){
		location.href="actor_input_cancel";
	});
}

function movie_input_form(aseq){
	var url = "movie_input_form?aseq="+aseq;
	var name = "_blank_1";
	var options = "toolbar-no, menubar=no, scrollbars=yes, resizable=no, width=450, height= 500;";
	
	window.openDialog(url, name, options, function(win){
		location.href="movie_input_cancel";
	});
}

function actor_input_check(){
	if(document.frm2.check.value == "n"){
		alert("등록할 배우를 선택하세요!");
		return false;
	} else{
		document.frm1.action="actor_input";
		document.frm1.submit();
	}
}

function movie_input_check(){
	if(document.frm2.check.value == "n"){
		alert("등록할 영화를 선택하세요!");
		return false;
	} else{
		document.frm1.action="movie_input";
		document.frm1.submit();
	}
}

function search_check2() {
	if (document.frm2.key.value == "") {
		alert("검색할 내용을 입력하세요!");
		document.frm2.key.focus();
		return false;
	}
}

function add_actor(){
	document.frm2.check.value="y";
	document.frm3.action="actor_input_form";
	document.frm3.submit();
}

function add_movie(){
	document.frm2.check.value="y";
	document.frm3.action="movie_input_form";
	document.frm3.submit();
}

function input_cancel_check(){
	if (confirm("작성 중인 내용은 저장되지 않습니다.\n취소하시겠습니까?")) {
		self.close();
	} else {
		return false;
	}
}

function user_vod_form(id){
	var url = "user_vod?id="+id;
	
	window.open(url, "_blank_1", "toolbar-no, menubar=no," +
	" scrollbars=no, resizable=no, width=600, height= 450, top=300, left=300");
}