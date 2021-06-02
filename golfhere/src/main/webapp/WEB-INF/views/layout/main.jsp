<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- bootstrap version 4.6 -->	
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
<style type="text/css">

header {
	margin-top: 0;
}

header.masthead {
    position: relative;
    /* background-color: #def0e2; */
    background: url("./images/golf-2158897_1280.jpg") no-repeat center center;
    background-size: cover;
    margin-top: 0;
    padding-top: 8rem;
    padding-bottom: 8rem;
    height: 100px;
}

header.masthead h1, header.masthead .h1 {
font-size: 2rem;
}
@media (min-width: 768px) {
    header.masthead {
        padding-top: 12rem;
        padding-bottom: 12rem;
    }
    header.masthead h1, header.masthead .h1 {
        font-size: 3rem;
    }
}

.course-grid{
    padding: 0.3rem;
    background-color: #fff;
    border: 2px solid #c5ccd3;
    border-radius: .5rem;
    max-width: 100%;
    height: auto;
}
.img-thumbnail {
    object-fit: cover;  
}

</style>
<title>main</title>
</head>
<body>
<header>
<%@ include file="../layout/nav.jsp"%>
</header>	
    <!-- Masthead-->
    <header class="masthead">
        <div class="container position-relative">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="text-center text-white">
                        <!-- Page heading-->
                        <h1 class="mb-5">Golf Here</h1>
                        <h3 class="mb-5">빠르고 쉬운 골프장 검색 및 예약</h3>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Cousrse Grid-->
    <section class="features-icons bg-light text-center mt-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                        <div class="features-icons-icon d-flex course-grid">
                            <img src="./images/green-2480256_640.jpg" alt="..." class="img-thumbnail">
                        </div>
                        <h3>롯데스카이힐부여</h3>
                        <p class="lead mb-0">[충남] 파격 할인가! 확인해보세요~~</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                        <div class="features-icons-icon d-flex course-grid">
                            <img src="./images/golf-3683339_640.jpg" alt="..." class="img-thumbnail">
                        </div>
                        <h3>웰리힐리</h3>
                        <p class="lead mb-0">[강원]클럽하우스 조식 1회 포함</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="features-icons-item mx-auto mb-0 mb-lg-3">
                        <div class="features-icons-icon d-flex course-grid">
                            <img src="./images/st-andrews-1591274_640.jpg" alt="..." class="img-thumbnail">
                        </div>                        
                        <h3> 블루원상주</h3>
                        <p class="lead mb-0">[경상]마감임박!!! 편안한 코스</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%@ include file="../layout/footer.jsp"%>
</body>
</html>