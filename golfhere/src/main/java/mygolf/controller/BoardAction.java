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
		
		return "board/board_write";
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
		System.out.println("/board_list.do startPage: " + startPage);
		System.out.println("/board_list.do endPage: " + endPage);		
		
		
		// ??
		if (endPage > startPage + 10 -1)
			endPage = startPage + 10 -1;
		
		System.out.println("/board_list.do endPage: " + endPage);		
		
		
		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("listCount", listCount);
		model.addAttribute("boardList", boardList);
		
		
		return "board/board_list";
	}
	
}
