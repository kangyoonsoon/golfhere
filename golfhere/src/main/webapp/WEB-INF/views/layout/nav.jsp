<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%-- <%= session.getAttribute("id") %> --%>
<% String session_id = (String) session.getAttribute("id"); %>
<style>
#logo {
	width: 60px;
	height: 60px;
	object-fit:cover; 
}

</style>
<div class="header row align-self-center alert-success text-warning text-center font-weight-bold mt-0 mb-0">
	
	<div class="col-lg-3 text-left align-self-center">
		<div class="features-icons-icon">
			<a class="nav-link" href="main.do">
            	<img id="logo" src="<%=request.getContextPath() %>/images/pinterest_board_photo.jpg" alt="logo" class="img-thumbnail">
			</a>
        </div>
	</div>
	<div class="col-lg-9 align-self-center">
		<div class="row justify-content-end mx-3 px-3">		
			<div>
				<a class="nav-link" href="board_list.do">후기게시판</a>
			</div>
			<% if (session_id == null) {%> 			
				<div>
					<a class="nav-link" href="login.do">로그인</a>
				</div>
				<div>
					<a class="nav-link" href="register.do">회원가입</a>
				</div>
			<% } else { %>	
				<div>
					<a class="nav-link" href="logout.do">로그아웃</a>
				</div>
			<% } %>
		</div>
	</div>
	<!--  
	<c:out value="${num}"/>			
	<c:set var="num" value="${num-1}"/>	 
    -->
	<!--
	<div class="col-lg align-self-center p-3"></div>
	<div class="col-lg align-self-center p-3"></div>
	<div class="col-lg align-self-center p-3">
		<a class="nav-link" href="board_list.do">후기게시판</a>
	</div>
	<div class="col-lg align-self-center p-3">
		<a class="nav-link" href="board_write.do">후기게시판 입력</a>
	</div>
	<div class="col-lg align-self-center p-3">
		<a class="nav-link" href="login.do">로그인</a>
	</div>
	<div class="col-lg align-self-center p-3">
		<a class="nav-link" href="register.do">회원가입</a>
	</div>
	-->
</div>
