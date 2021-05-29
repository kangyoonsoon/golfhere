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
<title>main</title>
<style type="text/css">
.text-large {
  font-size: 150%;
}

</style>
</head>
<body>
<header>
	<%@ include file="../layout/nav.jsp"%>
</header>	
<section>


	<!-- 전체 레이아웃 1:10:1 -->
	<div class="row align-items-center card-box my-5">
		<div class="col"></div>
		<div class="col-8">
		   <div class="d-flex justify-content-center">
		        <div class="card" style="width: 30rem;">
		            <div class="card-body">
		               <h2 class="text-center">반갑습니다.</h2>
		               <div class="text-center">
		               <img alt="icon" src="<%=request.getContextPath() %>/images/${icon}" class="p-1" style="border: 1px solid green; border-radius: 50%">	
		               <span class="text-large mx-2">${name}&nbsp;&nbsp;님</span>
		               </div>
		            </div>
		            <div class="card-footer text-center mx-2">
			            <form method="post" action="logout.do">
			            	<div class="row">
				            	<div class="col-4">
				            	<input type="button" value="정보수정" class="w-100 d-inline btn btn-outline-dark btn-block"
	     						onclick="location='member_edit.do'" />
				            	</div>
				            	<div class="col-4">
							    <input type="button" value="회원탈퇴" class="w-100 d-inline btn btn-outline-dark btn-block"
							     onclick="location='unsubscribe.do'" />
				            	</div>
				            	<div class="col-4">
							    <input type="submit" value="로그아웃" class="w-100 d-inline btn btn-dark btn-block" />
				            	</div>			            		
			            	</div>
			            </form> 
		            </div>
		        </div>
		    </div>

		</div>
		<div class="col"></div>
	</div>
</section>
</body>
</html>