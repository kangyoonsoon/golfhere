package mygolf.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mygolf.model.MemberBean;


@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;	
	
	/* 아이디 중복 체크 */
	public int checkMemberId(String id) throws Exception {
		int result = 40; // 사용 가능한 ID
		MemberBean mb = (MemberBean) sqlSession.selectOne("id_check", id);
		if (mb != null)
			result = 1; // 중복 ID
		return result;
	}
	
	/* 회원저장 */
	public void insertMember(MemberBean member) throws Exception {
		
		sqlSession.insert("member_register", member);
	}
	
	
	/* 로그인 체크*/
	public MemberBean userCheck(String id) throws Exception{
		return sqlSession.selectOne("login_check", id);
	}
	
	// insert 테스트
	public void insertTest(MemberBean member) throws Exception {
		sqlSession.insert("insert_test", member);
	}
	
	
}
