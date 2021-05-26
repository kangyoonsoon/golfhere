<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- bootstrap version 4.6 -->	
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
<script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
<title>main</title>
</head>
<body>
<nav class="navbar h-30">
  <div class="container-fluid">
  </div>
</nav>
    <div class="header-wrapper">
        <header>
            <div class="h-20 w-100"></div>
            <div class="container-fluid">
            	<!-- 전체 레이아웃 1:10:1 -->
            	<div class="row layout">
            		<div class="col"></div>
            		<div class="col-8">
						<%@ include file ="../layout/header.jsp" %>
						<br><br>
						
						메인페이지

					</div>
            		<div class="col"></div>
            	</div>
            </div>
        </header>
    </div>


</body>
</html>