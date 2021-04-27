package com.luna.board;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.MemberDTO;
import com.luna.board.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(PboardController.class);

	@RequestMapping(value = "/memder.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String member(Locale locale, Model model) {
		List<MemberDTO> list = MemberService.getAlllist();
		model.addAttribute("list", list);
		
		return "memberlist";
	}


}
