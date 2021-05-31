$(document).ready(function(){
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
});

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

