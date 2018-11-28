package com.joy.youtube.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joy.youtube.model.UserVO;
import com.joy.youtube.model.YoutubeVO;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService service;

	@RequestMapping("loginForm")
	public String loginForm() {
		return "admin/loginForm";
	}
	
	@RequestMapping("main")
	public String main() {
		return "admin/main";
	}
	
	@RequestMapping("accessDenied")
	public String accessDenied() {
		return "admin/accessDenied";
	}
	

	@RequestMapping("join")
	public String joinGet() {
		return "admin/joinForm";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinPost(UserVO vo) {
		System.out.println("joinPost / name : " + vo.getU_name());
		service.join(vo);
		return "redirect:loginForm";
		
	}
	
	@RequestMapping("insertURL")
	public String insertURLGet() {
		return "admin/insertURL";
	}
	@RequestMapping(value="insertURL", method=RequestMethod.POST)
	public String insertURLPost(YoutubeVO vo) {
		//TODO : insert 수행
		System.out.println("insertURLpost / URL : " + vo.getY_url());
		System.out.println("insertURLpost / TITLE : " + vo.getY_title());
		service.insertURL(vo);
		return "redirect:/client/list";
	}
	
	@RequestMapping("deleteVideo")
	public String deleteVideoGet(int y_no) {
		service.deleteVideo(y_no);
		System.out.println("DELETE VIDEO COMPLETE");
		return "redirect:/client/list";
	}
}
