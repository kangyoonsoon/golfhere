package mygolf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mygolf.model.BoardBean;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 게시판 저장
	public void insertBoard(BoardBean board) throws Exception {
		System.out.println("inside board dao");
		sqlSession.insert("board_insert", board);
	}
	
	// 게시물 갯수
	public int getListCount() throws Exception {
		
		return (Integer) sqlSession.selectOne("board_count"); 
	}
	
	// 게시물 목록
	public List<BoardBean> getBoardList(int page) throws Exception {
		
		List<BoardBean> list = sqlSession.selectList("board_list", page);
		
		return list;
	}
}
