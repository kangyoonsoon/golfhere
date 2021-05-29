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
<header>
	<%@ include file="../layout/nav.jsp"%>
</header>				
<section>
	<!-- 전체 레이아웃 1:10:1 -->
	<div class="row layout">
		<div class="col"></div>
		<div class="col-8">
			<!-- register -->
			<h2 class="text-center my-5">후기 게시판</h2>
			<form name="f"
				  method="post" 
				  action="write_process.do" 
				  onsubmit="return check()" 
				  >
				<div class="d-flex justify-content-center">
					<table class="w-75 table">
						<tr class="d-flex">
							<th
								class="col-sm-2 text-left align-middle">제목</th>
							<td class="col-sm-10"><input
								class="form-control" type="text" id="join_name" name="name"></td>
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-2 text-left align-middle align-text-middle">내용</th>
							<td class="col-sm-10">
								<textarea class="form-control" id="del_cont" name="delcont" rows="10"></textarea>
							</td>	
						</tr>
						<tr class="d-flex">
					    <th class="col-sm-2 text-left align-middle">사진 업로드</th>
					    	 <td class="col">
					      		<input type="file" name="course_picture" />
					     	</td>
					     	
					    </tr>
					</table>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-5"></div>
						<div class="col-4 gap-3">
							<input type="submit" value="등록" class="btn btn-primary btn-lg" />
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