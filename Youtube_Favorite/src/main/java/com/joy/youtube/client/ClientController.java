package com.joy.youtube.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joy.youtube.model.GallaryVO;
import com.joy.youtube.model.UserVO;
import com.joy.youtube.model.YoutubeVO;

@Controller
@RequestMapping("client") //슬래쉬 넣을필요 없음
public class ClientController {
	@Autowired
	private ClientService service;
	
	@RequestMapping("jsonList")
	@ResponseBody
	public List<YoutubeVO> jsonList() {
		List<YoutubeVO> list = service.getList();
		return list;
	}
	
	@RequestMapping("getMoreVideoAjax")
	@ResponseBody
	public List<YoutubeVO> getMoreVideoAjax() {
		List<YoutubeVO> list = service.getList();
		//LIMIT 사용, paging 하듯 가져오기
		return list;
	}
	
	@RequestMapping("list")
	public String list(Model model) {
		List<YoutubeVO> list = service.getList();
		model.addAttribute("list",list);
		model.addAttribute("target", "client/list");
		return "template";
	}
	
	@RequestMapping("playVideo")
	public String getVideoDetail(int y_no, Model m) {
		YoutubeVO vo = service.getVideoDetail(y_no);
		System.out.println("playVideo url : " + vo.getY_url());
		System.out.println("playVideo title : " + vo.getY_title());
		m.addAttribute("vo",vo);
		return "client/playVideo";
	}
	
	@RequestMapping("insertURL")
	public String insertURLGet(Model m) {
		m.addAttribute("target","client/insertURL");
		return "template";
	}
	@RequestMapping(value="insertURL", method=RequestMethod.POST)
	public String insertURLPost(YoutubeVO vo) {
		service.insertURL(vo);
		return "redirect:/client/list";
	}
	
	@RequestMapping("insertGallary")
	public String insertGallaryGet(Model m) {
		m.addAttribute("target", "client/insertGallary");
		return "template";
	}
	@RequestMapping(value="insertGallary", method=RequestMethod.POST)
	public String insertGallaryPost(GallaryVO vo) {
		service.insertGallary(vo);
		return "admin/insertGallary";
	}
	
	@RequestMapping("login")
	public String loginForm(Model m) {
		m.addAttribute("target","login/loginForm");
		return "template";
	}
	
	@RequestMapping("join")
	public String joinGet(Model m) {
		m.addAttribute("target", "login/joinForm");
		return "template";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinPost(UserVO vo) {
		System.out.println("joinPost / name : " + vo.getU_name());
		service.join(vo);
		return "redirect:loginForm";
		
	}
	
	@RequestMapping("gallery")
	public String getGalleryList(Model m) {
		m.addAttribute("title", "client/gallery");
		return "template";
	}

}
