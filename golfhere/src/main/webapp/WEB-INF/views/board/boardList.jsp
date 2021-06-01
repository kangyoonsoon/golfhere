<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mygolf.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- bootstrap version 4.6 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
<title>게시판 목록</title>
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
				<!-- 게시판 -->
				<h2 class="text-center my-5">골프장 이용 후기 게시판</h2>
				<div class="text-right py-3">글 개수 : ${listCount}</div>
				<div class="d-flex justify-content-center">
					<table class=" table">
						<thead>
							<tr>
								<th scope="col" class="col-1 text-left">순서</th>
								<th scope="col" class="col-3 text-center">제목</th>
								<th scope="col" class="col-2 text-center">골프장</th>
								<th scope="col" class="col-1 text-center">만족도</th>
								<th scope="col" class="col-1 text-center">조회수</th>
								<th scope="col" class="col-2 text-center">아이디</th>
								<th scope="col" class="col-2 text-center">등록일자</th>
							</tr>
						</thead>
						<tbody>
							<!-- 화면 출력 번호  변수 정의 -->		
							<c:set var="num" value="${listCount - (page - 1) * 10}"/> 	

							<!-- 반복문 시작 List<BoardBean> boardlist -->
							<c:forEach var="board" items="${boardList}">
							<tr>
								<th scope="row" class="">
									<!-- 번호 출력 부분 -->	
				 					<c:out value="${num}"/>			
									<c:set var="num" value="${num-1}"/>	 
								</th>
								<td class="text-left" style="text-align: justify;">
									<c:if test="${board.board_lev != 0}"> 
										<c:forEach var="k" begin="1" end="${board.board_lev}">
											&nbsp;&nbsp;			
										</c:forEach>
										<img src="./images/AnswerLine.gif">	
									</c:if>					
									<!-- 제목 출력 부분 -->	
									<a href="board_content.do?board_num=${board.board_num}&page=${page}&id=${board.id}&icon=${board.icon}&course=${board.board_coursename}&state=cont">
													${board.board_title}
									</a>
								</td>
								<td class="text-center">${board.board_coursename}</td>
								<td class="text-center">${board.board_evaluation}</td>
								<td class="text-center">${board.board_readcount}</td>
								<td class="text-left">
									<c:if test="${board.icon != null}">
									 <img alt="icon" src="<%=request.getContextPath() %>/images/${board.icon}" class="w-25 h-25 mx-3" style="border: 1px solid green; border-radius: 50%">
									 </c:if>
									 <span class="text-right">${board.id}</span>
								</td>
								<td class="text-center">${board.board_date}</td>
							</tr>
							</c:forEach>
						</tbody>
					<!-- 반복문 끝 -->	
					</table>

				</div>
					<!-- 페이지 처리 -->
					<nav aria-label="Page navigation example" class="my-5">
						<ul class="pagination justify-content-center">
						    <c:if test="${page <=1 }">
								<li class="page-item page-link">이전</li>
							</c:if>
							<c:if test="${page > 1 }">
								<li class="page-item"><a class="page-link" href="board_list.do?page=${page-1}">이전</a></li>
							</c:if>	
							
							<c:forEach var="p" begin="${startPage}" end="${endPage}">
								<c:if test="${p == page }">
									<li class="page-item page-link">${p}</li>
								</c:if>
								<c:if test="${p != page }">
									<a href="board_list.do?page=${p}">${a}</a>
									<li class="page-item"><a class="page-link" href="board_list.do?page=${p}">${p}</a></li>
								</c:if>
							</c:forEach>	
			
							<c:if test="${p >= maxpage }">
								<li class="page-item"><a class="page-link" href="board_list.do?page=${page+1}">다음</a></li>
							</c:if>
							<c:if test="${p < maxpage }">
								<li class="page-item page-link">다음</li> 
							</c:if>	

						</ul>
					</nav>

			</div>
			<div class="col"></div>
		</div>

	</section>
</body>
</html>