package mygolf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mygolf.dao.BoardDAO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO baordDao;
}
