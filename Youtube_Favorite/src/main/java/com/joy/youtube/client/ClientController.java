package com.joy.youtube.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joy.youtube.model.YoutubeVO;

@Controller
@RequestMapping("client") //슬래쉬 넣을필요 없음
public class ClientController {
	@Autowired
	private ClientService service;
	
	@RequestMapping("list")
	public String list(Model model) {
		
		List<YoutubeVO> list = service.getList();
		model.addAttribute("list",list);
		
		return "client/list";
	}
	
	@RequestMapping("jsonList")
	@ResponseBody
	public List<YoutubeVO> jsonList() {
		List<YoutubeVO> list = null;
		return list;
	}
	
	@RequestMapping("playVideo")
	public String getVideoDetail(int y_no, Model m) {
		YoutubeVO vo = service.getVideoDetail(y_no);
		System.out.println("playVideo url : " + vo.getY_url());
		System.out.println("playVideo title : " + vo.getY_title());
		m.addAttribute("vo",vo);
		return "client/playVideo";
	}

}
