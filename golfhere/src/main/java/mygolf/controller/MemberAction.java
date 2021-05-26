package mygolf.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mygolf.service.MemberService;

@Controller
public class MemberAction {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping("test.do")
	public String test1() {
		System.out.println("contorller 성공");
		return "layout/main";
	}
	
	@RequestMapping("register.do")
	public String login() {
		return "member/register";
	}
	
	// ID중복검사 ajax함수로 처리부분
	@RequestMapping("member_idcheck.do")
	public String member_idcheck(@RequestParam("mem_id") String id, Model model) throws Exception {

		int result = memberService.checkMemberId(id);
		model.addAttribute("result", result);

		return "member/idcheckResult";
	}
}
