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
<title>골프장 상세 정보</title>
</head>
<body>
	<section>
		<!-- 전체 레이아웃 1:10:1 -->
		<div class="row layout">
			<div class="col-2"></div>
			<div class="col-8">
				<!-- 게시판 -->
				<h3 class="text-center my-2">골프장 상세정보</h3>

				<div class="d-flex justify-content-center">
					<table class="table">
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">골프장</th>
							<td colspan="2" class="col-sm-9">
								<a href="${coursebean.course_website}">${coursebean.course_name}</a>
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">전화번호</th>
							<td colspan="2" class="col-sm-9">
								${coursebean.course_tel1} - ${coursebean.course_tel2} - ${coursebean.course_tel3}
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">분류</th>
							<td colspan="2" class="col-sm-9">
								<c:if test="${coursebean.course_membership == 0}">퍼블릭</c:if>
								<c:if test="${coursebean.course_membership == 1}">멤버쉽</c:if>
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">홀규모</th>
							<td colspan="2" class="col-sm-9">
								${coursebean.course_size}
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">주중가격</th>
							<td colspan="2" class="col-sm-3">
								${coursebean.course_week_price}
							</td>
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">주말가격</th>
							<td colspan="2" class="col-sm-3">
								${coursebean.course_weekend_price}
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-3 text-left align-middle align-text-middle">예약취소 패널티</th>
							<td colspan="2" class="col-sm-9">
								${coursebean.course_penalty}
							</td>	
						</tr>
						<tr class="d-flex justify-content-center">
							<td>
								<div id="googleMap" style="width:600px;height: 400px"></div>
							</td>
							
						</tr>
						
					</table>
				</div>
				<div class="text-center">				
			    	<input type="button" value="닫기" class="input_button btn btn-primary px-3" onclick="self.close();" />
	   			 <!-- close()메서드로 공지창을 닫는다. self.close()는 자바스크립트이다. -->
				</div>
			<div class="col-2"></div>
		</div>
   </div>	
	</section>
<script src="http://maps.googleapis.com/maps/api/js">
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEM3FEmY5ecJzAkXH9TDRAs1MaXpSWtME"
  type="text/javascript"></script>
  
<script>
var myCenter=new google.maps.LatLng(37.87364492097698, 127.27358282798686);

function initialize(){
var mapProp = {
  center: myCenter,
  zoom:12,
  mapTypeId: google.maps.MapTypeId.ROADMAP
  };

var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker = new google.maps.Marker({
  position: myCenter,
  title:'Click to zoom',
  animation:google.maps.Animation.DROP 
  });

marker.setMap(map);


google.maps.event.addListener(marker,'click',function() {
  map.setZoom(15);
  map.setCenter(marker.getPosition());
  });
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
</body>
</html>