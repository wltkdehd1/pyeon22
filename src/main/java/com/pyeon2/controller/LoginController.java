package com.pyeon2.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pyeon2.service.MemberService;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.UserVO;

@Controller
public class LoginController {

	@Autowired
	public MemberService memberService;

	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login() {

		return "login/login";
	}
	
	@RequestMapping(value="choice", method = RequestMethod.GET)
	public String choice(HttpServletRequest request) {
		
		return "login/choice";
	}
	
	@RequestMapping(value="admin", method = RequestMethod.GET)
	public String admin() {
		
		return "login/admin";
	}
	
	@RequestMapping(value="manager", method = RequestMethod.GET)
	public String manager() {
		
		return "login/manager";
	}
	
	
	@RequestMapping(value = "pos/usermoneystart" , method =  RequestMethod.GET)
	public ModelAndView userstarts(HttpServletRequest request, Model model) throws Exception{
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		ModelAndView mav = new ModelAndView();
		UserVO vo = new UserVO();
		vo.setUserid(id);
		memberService.userstart(vo);
		
		mav.setViewName("login/loginsuc");

		return mav;
	}
	
	
	@RequestMapping(value = "pos/usermoneyfinsh" , method =  RequestMethod.GET)
	public ModelAndView userfinshs(HttpServletRequest request, Model model) throws Exception{
		ModelAndView mav = new ModelAndView();
		UserVO vo = new UserVO();
		MemberVO Mvo = new MemberVO();
		vo.setUserid(request.getParameter("id"));
		memberService.userfinsh(vo);
		Mvo = memberService.checkId(vo);
		Mvo.setId(request.getParameter("id"));
		memberService.userinsertmoney(Mvo);
		
		mav.setViewName("login/logoutSuc");
		
		return mav;
	}
	
	@RequestMapping(value="pos/logout", method = RequestMethod.GET)
	public String logout() {
		
		return "login/logoutSuc";
	}
}
