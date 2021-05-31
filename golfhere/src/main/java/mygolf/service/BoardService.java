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
}
