<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- bootstrap version 4.6 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/member2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//우편번호, 주소 Daum API
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {				
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
			document.getElementById('join_zip1').value = data.zonecode;
			document.getElementById('join_addr1').value = data.address;				
		}
	}).open();
}
</script>
<title>registration</title>
</head>
<body>
	<nav class="navbar h-30">
		<div class="container-fluid"></div>
	</nav>
	<div class="header-wrapper">
		<header>
			<div class="h-20 w-100"></div>
			<div class="container-fluid">
				<!-- 전체 레이아웃 1:10:1 -->
				<div class="row layout">
					<div class="col"></div>
					<div class="col-8">
						<%@ include file="../layout/header.jsp"%>
						<br>
						<br>
						<!-- register -->
						<form name="f"
							  method="post" 
							  action="member_join_ok.do" 
							  onsubmit="return check()" 
							  enctype="multipart/form-data">
							<div class="d-flex justify-content-center">
								<table class="w-75 table table-bordered">
									<tr class="d-flex">
										<th scope="row"
											class="col-md-2 text-left align-middle">회원아이디</th>
										<td colspan="2" class="col-md-5">
											<input
											name="id" id="join_id"
											class="form-control" type="text">
											<div id="idcheck"></div></td>
										<td class="col-md-3 align-middle"><input type="button"
											value="아이디 중복체크" class="input_button btn btn-outline-secondary" 
											onclick="id_check()"/></td>
										<td class="col-md-2"></td>
									</tr>
									<tr class="d-flex">
										<th
											class="col-md-2   text-left align-middle">비밀번호</th>
										<td class="col-md-5">
											<input class="form-control" name="pwd" id="join_pwd1" 
											type="password"></td>
										<td colspan="2" class="col-md-5"><span
											class="text-primary text-left align-middle">*알파벳,
												소문자, 숫자 포함 8자 이상</span></td>
									</tr>
									<tr class="d-flex">
										<th
											class="col-md-2   text-left align-middle">비밀번호확인</th>
										<td colspan="2" class="col-md-5"><input
											class="form-control" type="password" name="pwd2" id="join_pwd2"></td>
										<td class="col-md-5"></td>

									</tr>
									<tr class="d-flex">
										<th
											class="col-md-2 text-left align-middle">이름</th>
										<td colspan="2" class="col-md-5"><input
											class="form-control" type="text" id="join_name" name="name"></td>
										<td class="col-md-5"></td>
									</tr>
									<tr class="d-flex">
										<th
											class="col-md-2 text-left align-middle">이메일</th>
										<td class="col-md-4">
											<input type="text" id="join_mailid" class="form-control" name="email" 
											></td>
										<td class="col-md-1">@</td>
										<td class="col-md-3"><input class="form-control" 
											type="text" name="domain" id="join_maildomain" readonly="readonly"></td>
										<td class="col-md-2">
										<select class="form-select form-select-m mb-2"
											    name="mail_list" onchange="domain_list()">
										      <option value="">이메일선택</option>
										      <option value="daum.net">daum.net</option>
										      <option value="nate.com">nate.com</option>
										      <option value="naver.com">naver.com</option>
										      <option value="hotmail.com">hotmail.com</option>
										      <option value="gmail.com">gmail.com</option>
										      <option value="0">직접입력</option>
										</select></td>
									</tr>
									<tr class="d-flex">
										<th
											class="col-md-2   text-left align-middle">핸드폰</th>
										<td class="col-md-2">
										<%@ include file="../include/phone_numbers.jsp" %>
											<div class="w-100">											
     										<select name="phone1" class="form-select form-select-lg">
      										<c:forEach var="p" items="${phone}" begin="0" end="5">
       										<option value=";&nbsp;;&nbsp;${p};&nbsp;;&nbsp;">${p}</option>
     										</c:forEach>
     										</select>
											</div>

										</td>
										<td class="col-md-1 text-center align-middle">-</td>
										<td class="col-md-2">
											<input class="form-control" name="phone2" id="join_phone2"
											type="text"></td>
										<td class="col-md-1 text-center align-middle">-</td>
										<td class="col-md-2">
											<input class="form-control" name="phone3" id="join_phone3"
											type="text"></td>
										<td class="col-md-2"></td>
									</tr>
									<tr class="d-flex">
										<th scope="row"
											class="col-md-2 text-left align-middle">우편번호</th>
										<td colspan="2" class="col-md-4">
											<input name="zipcode" id="join_zip1"
											class="form-control" type="text"></td>
										<td class="col-md-3 align-middle"><input type="button"
											value="우편번호검색" class="input_button btn btn-outline-secondary"
											onclick="openDaumPostcode()"  /></td>
										<td class="col-md-3"></td>
									</tr>
									<tr class="d-flex">
										<th scope="row"
											class="col-md-2 text-left align-middle">주소</th>
										<td colspan="2" class="col-md-9">
											<input name="address" id="join_addr1" 
											class="form-control" type="text"></td>
									</tr>
									<tr class="d-flex">
										<th scope="row"
											class="col-md-2 text-left align-middle">성별</th>
										<td colspan="5" class="col-md-8">
											<div class="form-check form-check-inline text-left">
												<input class="form-check-input" type="radio" name="sex" id="male"
													value="male"> <label class="form-check-label">남자</label>
											</div>
											<div class="form-check form-check-inline text-left">
												<input class="form-check-input" type="radio" name="sex" id="female"
													value="female"> <label class="form-check-label">여자</label>
											</div>
										</td>
									</tr>
									<tr class="d-flex">
										<th scope="row"
											class="col-md-2   text-left align-middle">코스방문</th>
										<td colspan="2" class="col-md-8">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="visit"
													value="permonth" id="permonth"> <label class="form-check-label"
													for="inlineRadio1">한달 한번 이상</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="visit"
													value="perseason" id="perseason"> <label class="form-check-label"
													for="inlineRadio2">3개월에 한번 이상</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="visit"
													value="peryear" id="peryear"> <label class="form-check-label"
													for="inlineRadio2">1년에 한번 이하</label>
											</div>
										</td>
									</tr>
									<tr class="d-flex">
										<th rowspan="2"
											class="col-md-2   text-left align-middle">아이콘</th>
										<td class="col-md-10">
											<div class="form-check form-check-inline border border-primary p-1">
  												<input class="form-check-input col" type="radio" id="inlineCheckbox1" value="option1">
  												<img class="col" src="<%=request.getContextPath() %>/images/man.png" height="30" width="30" />										
											</div>
											<div class="form-check form-check-inline border border-info p-1">
  												<input class="form-check-input col" type="radio" id="inlineCheckbox1" value="option1">
  												<img class="col" src="<%=request.getContextPath() %>/images/woman.png" height="30" width="30" />										
											</div>
											<div class="form-check form-check-inline border border-success p-1">
  												<input class="form-check-input col" type="radio" id="inlineCheckbox1" value="option1">
  												<img class="col" src="<%=request.getContextPath() %>/images/cart.png" height="30" width="30" />										
											</div>
											<div class="form-check form-check-inline border border-warning p-1">
  												<input class="form-check-input col" type="radio" id="inlineCheckbox1" value="option1">
  												<img class="col" src="<%=request.getContextPath() %>/images/green.png" height="30" width="30" />										
											</div>
										</td>
									</tr>

									</div>
								</table>
							</div>
							<div class="container">
								<div class="row">
									<div class="col-5"></div>
									<div class="col-4 gap-3">
										<input type="submit" value="회원가입" class="btn btn-primary btn-lg" />
										<input type="reset" value="가입취소" class="btn btn-outline-danger btn-lg" />
									</div>
									<div class="col-3"></div>
								</div>
							</div>
						</form>


					</div>
					<div class="col"></div>
				</div>
			</div>
		</header>
	</div>


</body>
</html>