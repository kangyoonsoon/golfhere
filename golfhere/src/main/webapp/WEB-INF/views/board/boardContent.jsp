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
<title>게시판 상세 내용</title>
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
			<h2 class="text-center my-5">게시판 내용 보기</h2>
			<form name="f"
				  method="post" 
				  action="unsubscribe_process.do" 
				  onsubmit="return check()" 

				  >
				<div class="d-flex justify-content-center">
					<table class="w-50 table">
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">제목</th>
							<td colspan="2" class="col-sm-9">
								${board.board_title}
								<input name="id" id="join_id" class="form-control" type="hidden">
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">이미지</th>
							<td colspan="2" class="col-sm-9">
								 <c:if test="${empty board.board_picture}">
							       &nbsp;
							     </c:if>
							     <c:if test="${!empty board.board_picture}">
							       <img src="<%=request.getContextPath() %>/upload/${board.board_picture}" class="w-100"/>
							     </c:if>
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">골프장</th>
							<td colspan="2" class="col-sm-9">
								${course}
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">내용</th>
							<td colspan="2" class="col-sm-9">
								<pre>${board.board_content}</pre>
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">아이디</th>
							<td colspan="2" class="col-sm-9">
								<c:if test="${board.icon != null}">
									 <img alt="icon" src="<%=request.getContextPath() %>/images/${board.icon}" class="mx-3" style="border: 1px solid green; border-radius: 50%">
								</c:if>
									 <span class="text-right">${board.id}</span>
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">조회수</th>
							<td colspan="2" class="col-sm-9">
								${board.board_readcount}
							</td>	
						</tr>
						<tr class="d-flex">
							 <td class="col-3"></td>
								<td class="col-6 text-center">


								<!-- 해당 아이디에 로그인해야지 수정 삭제&가능하도록 !! -->
								 <c:if test="${sessionId != id}">
							       &nbsp;
							     </c:if>
							     
							     <c:if test="${sessionId == id}">							       
									<div class="btn-group" role="group" aria-label="Basic example">
									  <button type="button" class="btn btn-outline-primary"
									  onclick="location='board_content.do?board_num=${board.board_num}&page=${page}&id=${board.id}&icon=${board.icon}&course=${board.board_coursename}&state=edit'"
									  >수정</button>
									  
									  <button type="button" class="btn btn-outline-primary"
									  onclick="location='board_content.do?board_num=${board.board_num}&page=${page}&id=${board.id}&icon=${board.icon}&course=${board.board_coursename}&state=delete'"
									  >삭제</button>
									</div>
							     </c:if>

									<div class="col-12 my-3">										
										<input type="reset" value="해당 게시물에 답변하기" class="btn btn-outline-primary btn w-100"
										 onclick="location='board_content.do?board_num=${board.board_num}&page=${page}&id=${board.id}&icon=${board.icon}&course=${board.board_coursename}&state=reply'" />
									</div>
									<div class="col-12 my-3">										
										<input type="reset" value="목록으로 돌아가기" class="btn btn-primary btn w-100"
										 onclick="location='board_list.do?page=${page}'" />
									</div>									
								</td>
							 <td class="col-3"></td>
						</tr>						
					</table>
				</div>
			</form>
		</div>
		<div class="col"></div>
	</div>

</section>
</body>
</html>	