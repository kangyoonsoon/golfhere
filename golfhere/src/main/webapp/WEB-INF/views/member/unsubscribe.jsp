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

<script>
 function check(){
	 if($.trim($("#del_pwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#del_pwd").val("").focus();
		 return false;
	 }
	 if($.trim($("#del_cont").val())==""){
		 alert("탈퇴사유를 입력하세요!");
		 $("#del_cont").val("").focus();
		 return false;
	 }
 }
</script>
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
			<h2 class="text-center my-5">회원 탈퇴</h2>
			<form name="f"
				  method="post" 
				  action="unsubscribe_process.do" 
				  onsubmit="return check()" 

				  >
				<div class="d-flex justify-content-center">
					<table class="w-50 table">
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">회원아이디</th>
							<td colspan="2" class="col-sm-9">
								${id}
								<input name="id" id="join_id" class="form-control" type="hidden">
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">이 름</th>
							<td colspan="2" class="col-sm-9">
								${name}
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">비밀번호</th>
							<td colspan="2" class="col-sm-9">
								<input name="passwd" id="del_pwd" class="form-control" type="password">
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">탈퇴사유</th>
							<td colspan="2" class="col-sm-9">
								<textarea class="form-control" id="del_cont" name="delcont" rows="6"></textarea>
							</td>	
						</tr>
						<tr class="d-flex">
							 <td class="col-3"></td>
								<td class="col-6">
									<div class="row justify-content-between">
										<div class="col">
											<input type="submit" value="탈퇴" class="btn btn-primary btn w-100" />
										</div>
										<div class="col">										
											<input type="reset" value="취소" class="btn btn-outline-danger btn w-100"
											 onclick="$('#del_pwd').focus" />
										</div>									
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
<%@ include file="../layout/footer.jsp"%>	
</body>
</html>