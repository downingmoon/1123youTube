package com.joy.youtube;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joy.youtube.client.ClientService;
import com.joy.youtube.model.YoutubeVO;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	ClientService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<YoutubeVO> list = service.getList();
		model.addAttribute("list",list);
		model.addAttribute("target", "client/list");
		return "template";
	}
	
	@RequestMapping(value = "error/accessDenied")
	public String errorPage(Model m) {
		m.addAttribute("target", "error/accessDenied");
		return "template";
	}
	
}
