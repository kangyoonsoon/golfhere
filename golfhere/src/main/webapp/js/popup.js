 /*비번찾기 공지창*/
 function popupWindow(path ,course_num){
	console.log(path + "course_content.do?course_num=");
	 var url = "course_content.do?course_num=" + course_num;
	 window.open(url, "골프장 상세 정보","width=1200, height=700");
	 //자바 스크립트에서 window객체의 open("공지창경로와 파일명","공지창이름","공지창속성")
	 //메서드로 새로운 공지창을 만듬.폭이 400,높이가 400인 새로운 공지창을 만듬.단위는 픽셀
 }