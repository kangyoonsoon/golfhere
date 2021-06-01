package mygolf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mygolf.dao.CourseDao;
import mygolf.model.CourseBean;

@Service
public class CourseService {
	@Autowired
	private CourseDao courseDao;
	
	public List<CourseBean> listCourse() throws Exception {
		return courseDao.listCourse();
	}
}
