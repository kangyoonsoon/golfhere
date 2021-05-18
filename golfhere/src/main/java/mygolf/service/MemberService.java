package mygolf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mygolf.dao.MemberDao;
import mygolf.model.MemberBean;


@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
}
