package mygolf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import mygolf.model.CourseBean;

@Repository
public class CourseDao {
	
@Autowired
private SqlSession sqlSession;

	public List<CourseBean> listCourse() throws Exception {
		List<CourseBean> list = sqlSession.selectList("course_list");
		return list;
	}
	
	
	public CourseBean getSingleCourse(int course_num) throws Exception { return
		(CourseBean) sqlSession.selectOne("get_course", course_num); }
	 
}
