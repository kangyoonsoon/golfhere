<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- bootstrap version 4.6 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board_write.css">
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/board.js"></script>

<title>게시판 답변 달기</title>
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
			<h2 class="text-center my-5">골프장 후기 답변</h2>
			<form name="f"
				  method="post" 
				  action="board_reply_process.do" 
				  onsubmit="return boardReplyCheck()"
				  >
				<%-- <input type="hidden" name="num" value="${num}">   --%>
				<input type="hidden" name="page" value="${page}">  
				<input type="hidden" name="board_num" value="${board_num}">  
				<input type="hidden" name="board_course" value="${course}">  

				 <input type="hidden" name="board_ref" value="${board.board_ref}" >
				 <input type="hidden" name="board_lev" value="${board.board_lev}" >
				 <input type="hidden" name="board_seq" value="${board.board_seq}" >
				
				<!-- <input type="hidden" id="board_coursename" class="form-control" name="board_coursename" value="없음" >  -->
				<div class="d-flex justify-content-center">
					<table class="w-75 table">
						<tr class="d-flex">
							<th class="col-sm-2 text-left align-middle">제목</th>
							<td class="col-sm-10"><input class="form-control" type="text" id="board_relpy_title" name="board_title"></td>
						</tr>
						<tr class="d-flex">
							<th scope="row" class="col-sm-2 text-left align-middle align-text-middle">내용</th>
							<td class="col-sm-10">
								<textarea class="form-control" id="board_reply_content" name="board_content" rows="10"></textarea>
							</td>	
						</tr>
						<tr class="d-flex">
							<th class="col-sm-2 text-left align-middle">아이디</th>
							<td class="col-sm-10">
							<!-- 아이디 -->
							<c:if test="${icon != null}">
									 <img alt="icon" src="<%=request.getContextPath() %>/images/${icon}" class="mx-3" style="border: 1px solid green; border-radius: 50%">
							</c:if>
							${id}
							</td>
						</tr>
						<tr class="d-flex">
							<th class="col-sm-2 text-left align-middle">비밀번호</th>
							<td class="col-sm-4"><input class="form-control" type="password" id="board_relpy_pwd" name="pwd"></td>
							<td class="col-sm-6"></td>
						</tr>
					</table>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-5"></div>
						<div class="col-4 gap-3">
							<input type="submit" value="답변등록" class="btn btn-primary btn-lg" />
							<input type="reset" value="취소" class="btn btn-outline-danger btn-lg" />
						</div>
						<div class="col-3"></div>
					</div>
				</div>
			</form>
		</div>
		<div class="col"></div>
	</div>

</section>						
</body>
</html>