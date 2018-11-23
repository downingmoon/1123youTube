package com.joy.youtube.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
