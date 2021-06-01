function course_list() {
	 var num = f.course_num.selectedIndex;
	/*selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	*/
	if ( num == -1 ) {
	//num==-1은 해당 리스트목록이 없다
	return true;
	 }
	if (f.course_num.options[num].text=="직접입력") // 직접입력
	 {
	/*리스트에서 직접입력을 선택했을때*/
	 f.board_coursename.value="";
	//@뒤의 도메인입력란을 빈공간시켜라.
	 f.board_coursename.readOnly=false;
	//@뒤의 도메인입력란을 쓰기 가능
	f.board_coursename.focus();
	//도메인입력란으로 입력대기상태
	}
	 
	 else {
	//리스트목록을 선택했을때
	 
	f.board_coursename.value=f.course_num.options[num].text;
	/*num변수에는 해당리스트 목록번호가 저장되어있다.해당리스트 번호의 option value값이 도메인입력란에 선택된다.options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
	*/
	f.board_coursename.readOnly=true;
	 }
 }
 
