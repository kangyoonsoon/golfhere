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

import mygolf.model.MemberBean;
import mygolf.service.MemberService;

@Controller
public class MemberAction {

	@Autowired
	private MemberService memberService;
	
	/* 회원 가입 저장 테스트 뷰*/
	@RequestMapping("/regi_test.do")
	public String regi_test() throws Exception {
		return "member/regi_test";
	}
	
	/* 회원 가입 저장 테스트*/
	@RequestMapping(value = "regi_test_ok.do", method = RequestMethod.POST)
	public String regi_test_ok(MemberBean member, Model model) throws Exception {
		System.out.println("regi_test_ok.do: " + member.getId());
		memberService.insertTest(member);
		
		return "member/regi_test";
	}
	
	/* Go to Main */
	@RequestMapping("/go_main.do")
	public String test1() {
		System.out.println("contorller 성공");
		return "layout/main";
	}
	
	/* 회원가입 폼 */
	@RequestMapping("/register.do")
	public String register() {
		return "member/register";
	}
	
	/* ID중복검사 ajax함수로 처리부분 */
	@RequestMapping("/member_idcheck.do")
	public String member_idcheck(String id, Model model) throws Exception {
//		System.out.println("member_idcheck.do id" + id);
		int result = memberService.checkMemberId(id);
		model.addAttribute("result", result);
//		System.out.println("member_idcheck.do result" + result);
		return "member/idcheckResult";
	}
	
	/* 회원 가입 저장 */
	@RequestMapping(value = "register_process.do", method = RequestMethod.POST)
	public String member_register_ok(MemberBean member, Model model) throws Exception {
		System.out.println("register_process.do id: " + member.getId());
		memberService.insertMember(member);
		return "redirect:go_main.do";
	}
	
	/* 로그인 폼 뷰 */
	@RequestMapping("/login.do")
	public String member_login() {
		return "member/login";
	}
	
	/* 로그인 인증 */
	@RequestMapping(value="/login_process.do", method = RequestMethod.POST)
	public String login_process(@RequestParam("id") String id, 
            					@RequestParam("passwd") String passwd,
            					HttpSession session, 
            					Model model) throws Exception {
		
		String session_id = (String) session.getAttribute("id");
		System.out.println("/login_process.do session id: " + session_id);
		int result = 0;
		MemberBean member = memberService.userCheck(id);
		
		// 등록되지 않은 회원
		if (member == null) {
			result = 1;
			model.addAttribute("result", result);
			return "member/loginResult";
		} else {  // 등록된 회원일때
			if(member.getPwd().equals(passwd)) {  // 비번이 같을때
				
				session.setAttribute("id", id); // 세션설정
				
				String name = member.getName();
				String icon = member.getIcon();
				
				model.addAttribute("name", name);
				model.addAttribute("icon", icon);
				return "member/welcomeMember";
			}else { // 비번이 다를때
				result = 2;
				model.addAttribute("result", result);
				
				return "member/loginResult";		
				
			}
		}
		
	}
	
	/* 로그아웃 */
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "member/logout";
	}

	/* 회원 정보 수정 폼 */
	@RequestMapping("/member_edit.do")
	public String member_edit(HttpSession session, Model m) throws Exception {
		
		String id = (String) session.getAttribute("id");
		
		MemberBean member = memberService.userCheck(id);
		
		m.addAttribute("member", member);
		
		return "member/member_edit";
	}
	
	
	
}
