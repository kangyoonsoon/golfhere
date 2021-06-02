function board_check() {
	if ($.trim($("#board_title").val()) == "") {
		alert("글제목을 입력하세요!");
		$("#board_title").val("").focus();
		return false;
	}
	if ($.trim($("#board_content").val()) == "") {
		alert("글내용을 입력하세요!");
		$("#board_content").val("").focus();
		return false;
	}
}

function boardReplyCheck() {
	console.log("call boardReplyCheck()");
	
	if ($.trim($("#board_relpy_title").val()) == "") {
		alert("글제목을 입력하세요!");
		$("#board_relpy_title").val("").focus();
		return false;
	}
	if ($.trim($("#board_reply_content").val().length) == 0) {
		alert("글내용을 입력하세요!");
		$("#board_reply_content").val("").focus();
		return false;
	}
	if ($.trim($("#board_relpy_pwd").val()) == "") {
		console.log($.trim($("#board_relpy_pwd").val()) == "");
		alert("회원 비밀번호를을 입력하세요!");
		$("#board_reply_pwd").val("").focus();
		return false;
	}
}