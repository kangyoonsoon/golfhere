package mygolf.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mygolf.model.BoardBean;
import mygolf.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("board_test.do")
	public String test(){
		System.out.println("컨트롤러 들어옴");
		
		return "board/test";
	}
	
	/* 글쓰기 폼 */
	@RequestMapping("/board_write.do")
	public String board_write() {
		return "board/board_write";
	}
	
	/* 게시판 글 저장 */
	@RequestMapping("/board_write_process.do")
	public String board_write_process(BoardBean board) throws Exception{
		
		boardService.insert(board);
		
		return "redirect:board_list.do";
	}
	
	/* 게시판 목록 */
	@RequestMapping("/board_list.do")
	public String board_list(HttpServletRequest request,
							 Model model) throws Exception {
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		
		return "board/board_list";
	}
	
}
