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
}
