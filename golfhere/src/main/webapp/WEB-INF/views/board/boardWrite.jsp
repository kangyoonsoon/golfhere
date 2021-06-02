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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board_write.css">
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/board.js"></script>
<script src="<%=request.getContextPath()%>/js/boardWrite.js"></script>
<title>board registration</title>
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
			<h2 class="text-center my-5">골프장 후기 게시판</h2>
			<form name="f"
				  method="post" 
				  action="board_write_process.do" 
				  onsubmit="return check()"
				  enctype="multipart/form-data"
				  >
				<input type="hidden" name="num" value="${num}">  
				<div class="d-flex justify-content-center">
					<table class="w-75 table">
						<tr class="d-flex">
							<th
								class="col-sm-2 text-left align-middle">제목</th>
							<td class="col-sm-10"><input
								class="form-control" type="text" id="board_title" name="board_title"></td>
						</tr>
						<tr class="d-flex">
							<th
								class="col-sm-2 text-left align-middle">골프장</th>
							<td class="col-md-4">
								<input type="text" id="board_coursename" class="form-control" name="board_coursename" readonly >
							</td>
							<td class="col-sm-6">
								<select name="course_num" onChange="course_list()">
									<option value="">=골프장 선택=</option>
									<c:forEach var="course" items="${courseList}" begin="0" end="50">
										<option value="${course.course_num}">${course.course_name}</option>
									</c:forEach>
									<option value="1">직접입력</option>
								</select>
							</td>
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-2 text-left align-middle align-text-middle">내용</th>
							<td class="col-sm-10">
								<textarea class="form-control" id="board_content" name="board_content" rows="10"></textarea>
							</td>	
						</tr>
						<tr class="d-flex">
							<th scope="row"
								class="col-sm-2 text-left align-middle align-text-middle">골프장 평점</th>
							<td class="col-sm-10">
                                <div class="slidecontainer w-50">
                                    <p>바를 움직여 점수를 주세요.</p>
                                    <input type="range" min="0" max="100" value="50" class="slider" id="myRange" name="board_evaluation">
                                    <p>점수: <span id="demo" class="btn btn-outline-danger px-3 mx-2"></span></p>
                                </div>
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
    <script>
        var slider = document.getElementById("myRange");
        var output = document.getElementById("demo");
        output.innerHTML = slider.value;
        
        slider.oninput = function() {
          output.innerHTML = this.value;
        }
        
        $(document).submit(function(){
        	if ($.trim($("#board_title").val()) == "") {
        		alert("글제목을 입력하세요!");
        		$("#board_title").val("").focus();
        		return false;
        	}
        	if ($.trim($("#board_content").val()) == "") {
        		alert("글내용을 입력하세요!");
        		$("#board_content").val("").focus();
        		return false;
        	}
        	if ($.trim($("#board_coursename").val()) == "") {
        		alert("골프장을 선택해 주세요");
        		
        		return false;
        	}
        });
        </script>
</section>
<%@ include file="../layout/footer.jsp"%>						
</body>
</html>