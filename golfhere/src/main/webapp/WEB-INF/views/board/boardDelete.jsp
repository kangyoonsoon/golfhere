<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- bootstrap version 4.6 -->	
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
<script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
<title>게시판 삭제</title>
</head>

<body>
<header>
	<%@ include file="../layout/nav.jsp"%>
</header>	
	<section>
	<!-- 전체 레이아웃 1:10:1 -->
	<div class="row layout">
		<div class="col"></div>
		<div class="col-8">
			<!-- register -->
			<h2 class="text-center my-5">게시물 삭제</h2>
			<form name="f"
				  method="post" 
				  action="board_del_process.do" 
				  onsubmit="return del_check()" 
				  >
			<%-- board_num=${board.board_num}&page=${page}&id=${board.id}&icon=${board.icon}&course=${board.board_coursename}&state=del --%>
				<input type="hidden" name="page" value="${page}">  
				<input type="hidden" name="board_num" value="${board_num}">  
				<input type="hidden" name="board_course" value="${course}">  
				<input type="hidden" name="icon" value="${board.icon}">  
				<input type="hidden" name="id" value="${id}">  

				<%--  <input type="hidden" name="board_ref" value="${board.board_ref}" >
				 <input type="hidden" name="board_lev" value="${board.board_lev}" >
				 <input type="hidden" name="board_seq" value="${board.board_seq}" > --%>

				<div class="d-flex justify-content-center">
					<table class="w-50 table">
						<tr class="row">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">제목</th>
							<td colspan="2" class="col-sm-9">
								${board.board_title}
							</td>	
						</tr>
						<tr class="row">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">회원비밀번호</th>
							<td colspan="2" class="col-sm-9">
								<input name="pwd" id="pwd" class="form-control" type="password">
							</td>	
						</tr>
						<tr class="row">
							<th scope="row"
								class="col-sm-2 text-left align-middle align-text-middle"></th>
							<td class="col-sm-4">
								<input type="submit" value="해당 게시물 삭제하기" class="btn btn-outline-danger btn w-100" />
							</td>
							<td class="col-sm-4">
								<input type="reset" value="취소" class="btn btn-outline-info btn w-100" onclick="$('#pwd').focus();"/>
							</td>
							<td class="col-sm-2"></td>
						</tr>						
					</table>
				</div>
			</form>
		</div>
		<div class="col"></div>
	</div>

	</section>
	<script>
 	 function del_check(){
		  if($.trim($("#pwd").val())==""){
			  alert("삭제 비번을 입력하세요!");
			  $("#pwd").val("").focus();
			  return false;
	 	 }
  	}
	</script>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>	