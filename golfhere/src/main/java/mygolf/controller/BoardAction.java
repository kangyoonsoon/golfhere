package mygolf.controller;

import java.io.File;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mygolf.model.BoardBean;
import mygolf.model.CourseBean;
import mygolf.model.MemberBean;
import mygolf.service.BoardService;
import mygolf.service.CourseService;
import mygolf.service.MemberService;


@Controller
public class BoardAction {
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("board_test.do")
	public String test(){
		System.out.println("컨트롤러 들어옴");
		
		return "board/test";
	}
	
	/* 글쓰기 폼 */
	@RequestMapping("/board_write.do")
	public String board_write(HttpSession session,
							  MemberBean member,
							  CourseBean course,
							  BoardBean board,
							  Model model) throws Exception {
		
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
		MemberBean memberbean = memberService.userCheck(id);
		CourseBean coursebean = new CourseBean();
		List<CourseBean> courseList = courseService.listCourse();
		System.out.println("/board_write.do courseList: " + courseList.size());
		int num = member.getNum();
		model.addAttribute("memberbean", memberbean); 
		model.addAttribute("courseList", courseList); 
		model.addAttribute("num", num);
		
		return "board/boardWrite";
	}
	
	/* 게시판 글 저장 */
	@RequestMapping(value="/board_write_process.do", method=RequestMethod.POST)
	public String board_write_process(@RequestParam("course_picture") MultipartFile mf,
									  @RequestParam("num") int num,
									  HttpSession session,
									  HttpServletRequest request,
									  BoardBean board,
									  MemberBean member,
									  Model model) throws Exception{
		
		
		
		// 사진 업로드
		String filename = mf.getOriginalFilename(); // 첨부 파일명
		int size = (int) mf.getSize(); // 첨부파일의 크기: byte

		String path = request.getRealPath("upload");
		System.out.println("board - course_picture" + board.getBoard_picture());
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);

		int result = 0;
		
		String file[] = new String[2];
		
		if(filename != ""){	 // 첨부파일이 전송된 경우	
		
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();
			
			if (size > 1000000){ // 파일 용량 체크
				result = 1;
				model.addAttribute("result", result);
				
				return "board/boardWriteResult";
			} else if (!file[1].equals("jpg")&&
						!file[1].equals("jpeg")&&
						!file[1].equals("png")&&
						!file[1].equals("gif")&&
						!file[1].equals("svg")){ // 확장자
				result = 2;
				model.addAttribute("result", result);
				
				return "board/boardWriteResult";
			}
		}
		if (size > 0) { // 첨부파일이 전송된 경우
			mf.transferTo(new File(path + "/" + filename));
		}
		
		String id = (String) session.getAttribute("id");
		// board에 member num을 주입해야 한다.
		// num parameter로 받은 것 작동X
		MemberBean memberbean = memberService.userCheck(id);
		
		board.setNum(memberbean.getNum());
		board.setBoard_picture(filename);
		
		System.out.println("inside write process num:" + board.getNum());

		
		System.out.println(board.getBoard_num());
		System.out.println(board.getBoard_title());
		System.out.println(board.getBoard_content());
		System.out.println(board.getBoard_readcount());
		System.out.println(board.getBoard_ref());
		System.out.println(board.getBoard_lev());
		System.out.println(board.getBoard_seq());
		System.out.println(board.getBoard_date());
		System.out.println(board.getBoard_evaluation());
		System.out.println(board.getBoard_coursename());
		System.out.println(board.getBoard_picture());
		System.out.println(board.getBoard_del());
		System.out.println(board.getNum());
		System.out.println(board.getCourse_num());


		
		boardService.insertBoard(board);
		
		return "redirect:board_list.do";
	}
	
	/* 게시판 목록 */
	@RequestMapping("/board_list.do")
	public String board_list(HttpSession session,
			  				HttpServletRequest request,
							MemberBean member,
			  				CourseBean course,
			  				BoardBean board,
			  				Model model) throws Exception {
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		
		int page = 1;
		int limit =10;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 총 리스트 수
		int listCount = boardService.getListCount();
		System.out.println("/board_list.do listCount: " + listCount);
		
		// 리스트 
		boardList = boardService.getBoardList(page);
		
		
		// 총 페이지
		int maxPage = (int)((double) listCount / limit + 0.95);  // 만약 3개 listCount 라면, 3/10 + 0.95 = 1
		System.out.println("/board_list.do maxpage: " + maxPage);
		
		// 현재 페이지에 보여줄 시작 페이지수 (1, 11, 21...)
		int startPage = ((int)((double) page / limit + 0.9) - 1) * 10 + 1;
		int endPage = maxPage;
		System.out.println("/boardList.do startPage: " + startPage);
		System.out.println("/boardList.do endPage: " + endPage);		
		
		
		// ??
		if (endPage > startPage + 10 -1)
			endPage = startPage + 10 -1;
		
		System.out.println("/boardList.do endPage: " + endPage);		
		
		
		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("listCount", listCount);
		model.addAttribute("boardList", boardList);

		return "board/boardList";
	}
	
	/* 게시판 내용보기, 삭제폼, 수정폼, 답변글폼 */
	@RequestMapping("/board_content.do")
	public String board_content(@RequestParam("board_num") int board_num, 
								@RequestParam("page") String page, 
								@RequestParam("state") String state,
								@RequestParam("id") String id,
								@RequestParam("icon") String icon,
								@RequestParam("course") String course,
								@ModelAttribute CourseBean coursebean,
								HttpSession session,
								Model model) throws Exception {
	
	String sessionId = (String) session.getAttribute("id");
		
	// 제목 클릭할 때만 조회수 증가
	if (state.equals("cont")) {
		boardService.increaseReadcount(board_num);
	}
	
	BoardBean board = boardService.getBoardContent(board_num);


	List<CourseBean> courseList = courseService.listCourse();
	
	board.setId(id);
	board.setIcon(icon);
	
	model.addAttribute("board_num", board_num);
	model.addAttribute("board", board);
	model.addAttribute("page", page);
	model.addAttribute("id", id);
	model.addAttribute("icon", icon);
	model.addAttribute("course", course);
	model.addAttribute("sessionId", sessionId);
	model.addAttribute("courseList", courseList);
	
	if (state.equals("cont")) {
		return "board/boardContent";
	} else if (state.equals("edit")) {
		return "board/boardEdit";
	} else if (state.equals("delete")) {
		return "board/boardDelete";
	} else if (state.equals("reply")) {
		return "board/boardReply";
	}
	return null;
	}
	
	
	
	
	@RequestMapping(value="/board_edit_process.do", method = RequestMethod.POST)
	public String board_edit_process(@RequestParam("course_picture") MultipartFile mf,
									 @RequestParam("page") String page,
									 @RequestParam("boardNumber") int boardNumber,
									 @RequestParam("pwd") String pwd,
//									 @RequestParam("icon") String icon,
									 @RequestParam("board_title") String board_title,
									 @RequestParam("board_coursename") String board_coursename,
									 @RequestParam("course_num") int course_num,
									 @RequestParam("board_content") String board_content,
									 @RequestParam("board_evaluation") int board_evaluation,

									 HttpSession session,
									 HttpServletRequest request,
									 //BoardBean boardbean,
									 Model model)throws Exception {
		System.out.println("성공??");
		// 사진 업로드
		String filename = mf.getOriginalFilename(); // 첨부 파일명
		int size = (int) mf.getSize(); // 첨부파일의 크기: byte

		String path = request.getRealPath("upload");

		int result = 0;
		
		String file[] = new String[2];
		
		if(filename != ""){	 // 첨부파일이 전송된 경우	
		
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();
			
			if (size > 1000000){ // 파일 용량 체크
				result = 1;
				model.addAttribute("result", result);
				
				return "board/boardWriteResult";
			} else if (!file[1].equals("jpg")&&
						!file[1].equals("jpeg")&&
						!file[1].equals("png")&&
						!file[1].equals("gif")&&
						!file[1].equals("svg")){ // 확장자
				result = 2;
				model.addAttribute("result", result);
				
				return "board/boardWriteResult";
			}
		}
		if (size > 0) { // 첨부파일이 전송된 경우
			mf.transferTo(new File(path + "/" + filename));
			System.out.println("첨부파일 전송~~");
			System.out.println("filename" + filename);
		}
		// 바뀐 파일명
		//boardbean.setBoard_picture(filename);  // -- 이렇게 하면 오류난다 -- ???????
		System.out.println(boardNumber);
		
    	BoardBean boardbean = boardService.getBoardContent(boardNumber);
    	// 바뀐 파일명
    	
    	
    	boardbean.setBoard_picture(filename);
    	boardbean.setBoard_title(board_title);
    	boardbean.setBoard_coursename(board_coursename);
    	boardbean.setCourse_num(course_num);
    	boardbean.setBoard_content(board_content);
    	boardbean.setBoard_evaluation(board_evaluation);
    	boardbean.setBoard_coursename(board_coursename);


    	
    	
    	
    	System.out.println("Board_num "+boardbean.getBoard_num());
    	System.out.println("Board_title"+boardbean.getBoard_title());
    	System.out.println("Board_content"+boardbean.getBoard_content());
    	System.out.println("Course_num"+boardbean.getCourse_num());
    	System.out.println("Board_content"+boardbean.getBoard_content());
    	System.out.println("evaluation"+boardbean.getBoard_evaluation());
    	System.out.println("picture"+boardbean.getBoard_picture());
    	
    	// 세션 id를 통해 DB에서 member 비밀번호 가져오기
		String sessionId = (String) session.getAttribute("id");
		MemberBean memberbean = memberService.userCheck(sessionId);
		String pwdFromDB = memberbean.getPwd();
		//String pwd = request.getParameter("pwd");
		int outcome = 0;
		// 비번이 같지 않다면,
		if(!pwd.equals(pwdFromDB)) {
			outcome = 1;
			model.addAttribute("outcome", outcome);
			// 다시 수정 폼 모드로 돌아간다.
			return "board/updateResult";
		} else {  // 비번 일치
			// update
			boardService.editContent(boardbean);
		}
		return "redirect:board_list.do";
		
		//return "redirect:/boardContent.do?board_num=" + boardbean.getBoard_num()
		//+ "&page=" + page + "&state=cont";
		//&id=${board.id}&icon=${board.icon}&course=${board.board_coursename}
		//return "redirect:/board_content.do?board_num=" +boardbean.getBoard_num()
		//+ "&page="+ page +"&id="+ sessionId + "&icon=" + "???" +"&course=" + boardbean.getBoard_coursename() +"&state=cont";

	}
	
	
	/* 답변 달기 저장 */
	@RequestMapping(value="/board_reply_process.do", method = RequestMethod.POST)
	public String boardReplyProcess(@RequestParam("page") String page,
									@RequestParam("board_num") int board_num,
									@RequestParam("pwd") String pwd,
									//@RequestParam("board_title") String board_title,
									HttpSession session,
									BoardBean boardbean,
									Model model) throws Exception {
		System.out.println("/board_reply_process.do" + "성공");
		
		// 세션 id를 통해 DB에서 member 비밀번호 가져오기
		String sessionId = (String) session.getAttribute("id");

		
		
		System.out.println("/board_reply_process.do sessionId: " + sessionId); 
		MemberBean memberbean = memberService.userCheck(sessionId);
		int num = memberbean.getNum();

		// member num 주입
		boardbean.setNum(num);
		
		// !!!! course_num을 1로 일단 주입 나중에 고친다..
		boardbean.setCourse_num(1);
		
		
		String pwdFromDB = memberbean.getPwd();
		System.out.println("/board_reply_process.do pwdFromDB: " + pwdFromDB); 
		System.out.println("/board_reply_process.do board title: " + boardbean.getBoard_title()); 
		System.out.println("/board_reply_process.do board content: " + boardbean.getBoard_content()); 
		
		System.out.println(boardbean.getBoard_num());
		System.out.println(boardbean.getBoard_title());
		System.out.println(boardbean.getBoard_content());
		System.out.println(boardbean.getBoard_readcount());
		System.out.println(boardbean.getBoard_ref());
		System.out.println(boardbean.getBoard_lev());
		System.out.println(boardbean.getBoard_seq());
		System.out.println(boardbean.getBoard_date());
		System.out.println(boardbean.getBoard_evaluation());
		System.out.println(boardbean.getBoard_coursename());
		System.out.println(boardbean.getBoard_picture());
		System.out.println(boardbean.getBoard_del());
		System.out.println(boardbean.getNum());
		System.out.println(boardbean.getCourse_num());
		
		
		// 비밀번호 인증
		int outcome = 0;
		// 비번이 같지 않다면,
		if(!pwd.equals(pwdFromDB)) {
			outcome = 1;
			model.addAttribute("outcome", outcome);
			// 다시 수정 폼 모드로 돌아간다.
			return "board/updateResult";
		} else {  // 비번 일치
			// 답변달기
			boardService.insertReply(boardbean);
		}
		
		return "redirect:board_list.do";
	}
	
	/* 게시판 삭제 */
	@RequestMapping(value = "/board_del_process.do", method = RequestMethod.POST)
	public String board_del_ok(@RequestParam("board_num") int board_num,
							   @RequestParam("page") int page,
							   @RequestParam("pwd") String user_pwd,
							   @RequestParam("id") String id,
							   HttpServletRequest session,
							   Model model) throws Exception {

		//String sessionId = (String) session.getAttribute("id");
		BoardBean boardDB = boardService.getBoardContent(board_num);
		
		MemberBean memberDB = memberService.userCheck(id); 
		System.out.println("/board_del_process.do: memberDB.pwd" + memberDB.getPwd());

		int result=0;
		
		if (!memberDB.getPwd().equals(user_pwd)) {
			result = 1;
			model.addAttribute("result", result);

			return "board/deleteResult";

		} else {
			System.out.println("delete: board_num " + board_num);
			boardService.deleteProcess(board_num);		
		}
		
		return "redirect:/board_list.do?page=" + page;
	}
	
	
}
