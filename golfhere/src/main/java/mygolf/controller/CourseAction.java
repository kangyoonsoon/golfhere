package mygolf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mygolf.model.BoardBean;
import mygolf.model.CourseBean;
import mygolf.model.MemberBean;
import mygolf.service.BoardService;
import mygolf.service.CourseService;
import mygolf.service.MemberService;


@Controller
public class CourseAction {
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/course_content.do")
	public String course_content(@RequestParam("course_num") int course_num, 
								CourseBean course,
								Model model) throws Exception {
		
		//System.out.println("/course_content.do course_num" + course_num);
		CourseBean coursebean = courseService.getSingleCousrse(course_num);
		
		model.addAttribute("coursebean", coursebean);
		return "course/courseContent";
	}
	
	
	
}
