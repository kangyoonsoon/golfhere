package mygolf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mygolf.dao.BoardDao;
import mygolf.model.BoardBean;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	
	// 게시판 저장
	public void insertBoard(BoardBean board) throws Exception {
		boardDao.insertBoard(board);
	}
	
	// 게시물 갯수 
	public int getListCount() throws Exception {
		return boardDao.getListCount();
	}
	
	// 게시판 목록
	public List<BoardBean> getBoardList(int page) throws Exception{
		return boardDao.getBoardList(page);
	}
	
	// 조회수 1 증가
	public void increaseReadcount(int board_num) throws Exception {
		boardDao.increaseReadcount(board_num);
	}
	
	// 상세 정보 - 게시판 내용
	public BoardBean getBoardContent(int board_num) throws Exception {
		
		BoardBean board = boardDao.getBoardContent(board_num);
		
		return board;
	}
	
	// 게시물 수정
	public void editContent(BoardBean board) throws Exception {	
		System.out.println("service 수정: "+board.getBoard_coursename());
		boardDao.editContent(board);
	}
	
	// 게시판 댓글 달기 
	public void insertReply(BoardBean board) throws Exception {
		System.out.println("service 게시판 댓글 달기 board.getBoard_lev()" + board.getBoard_ref());
		System.out.println("service 게시판 댓글 달기 board.getBoard_seq()" + board.getBoard_seq());
		System.out.println("service board.getBoard_num(): " + board.getBoard_num()); 
		System.out.println("service board.getBoard_title(): " + board.getBoard_title()); 
		System.out.println("service board.getBoard_content(): " + board.getBoard_content());

		
		boardDao.refEdit(board); // 기존 댓글 board_re_seq값 1증가

		board.setBoard_lev(board.getBoard_lev() + 1); // 부모보다 1증가된 값을 저장함
		board.setBoard_seq(board.getBoard_seq() + 1);

		boardDao.boardReplyInsert(board);
	}
	
	
	// 게시물 삭제
	public void deleteProcess(int board_num) throws Exception {
		boardDao.deleteProcess(board_num);
	}
}
