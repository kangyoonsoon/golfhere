package mygolf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mygolf.dao.MemberDao;
import mygolf.model.MemberBean;


@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	public int checkMemberId(String id) throws Exception{
		return memberDao.checkMemberId(id);
	}
	
	public void insertMember(MemberBean member) throws Exception{
		memberDao.insertMember(member);
	}
	
	public MemberBean userCheck(String id) throws Exception{
		return (MemberBean) memberDao.userCheck(id);
	}
	
	public void updateMember(MemberBean member) throws Exception {
		memberDao.updateMember(member);
	}
	
	public void deleteMember(MemberBean member) throws Exception {
		memberDao.deleteMember(member);
	}
	
	//test
	public void insertTest(MemberBean member) throws Exception{
		memberDao.insertTest(member);
	}
	
	
}
