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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css">
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/member2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>login</title>
</head>
<body>

<header>
	<%@ include file="../layout/nav.jsp"%>
</header>	
<section>
    <div class="d-flex justify-content-center">
        <div class="card my-5" style="width: 30rem;">
            <div class="card-body">
                <form  method="post" action="login_process.do" onsubmit="">
                    <h5 class="form-signin-heading text-center">로그인 정보를 입력하세요</h5>
                    <table class="table">
                        <tr class="d-flex">
                            <th scope="row" class="col-md-3 text-center align-middle">회원아이디</th>
                            <td colspan="2" class="col-md-9">
                                <input type="text" class="form-control" name="id" id="login_id">
                            </td>
                        </tr>
                        <tr class="d-flex">
                            <th scope="row" class="col-md-3 text-center align-middle">비밀번호&nbsp;</th>
                            <td colspan="2" class="col-md-9">
                                <input type="password" class="form-control" name="passwd" id="login_passwd">
                            </td>
                        </tr>
                    </table>
                    <div class="text-center">
                        <div class="col align-self-center">
                            <input class="btn btn btn-primary btn-block w-100" type="submit" value="&nbsp;&nbsp;로 그 인&nbsp;&nbsp;" />
                        </div>
                    </div>
                    <div class="row text-center mt-2 mx-auto">
                    	<div class="col-4">
                        <input type="reset" value="취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소" class="d-inline btn btn-outline-danger btn-block"
                        onclick="$('#login_id').focus();" /> &nbsp; &nbsp; 
                    	
                    	</div>
                    	<div class="col-4">
                        <input type="button" value="회원가입" class="d-inline btn btn-outline-info btn-block"
                        onclick="location='register.do'" /> &nbsp; &nbsp; 
                    	
                    	</div>
                    	<div class="col-4">
                        <input type="button" value="비번찾기" class="d-inline btn btn-outline-info btn-block"
                        onclick="location=''" /> &nbsp; &nbsp; 
                    	
                    	</div>
                    </div>
                </form>
            </div>
        </div>
    </div>



</section>


<%@ include file="../layout/footer.jsp"%>
</body>
</html>


