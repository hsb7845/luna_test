package com.luna.board;

import java.sql.Timestamp;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;
import com.luna.board.service.IMemberService;

@Controller
public class MemberController {
	
	@Autowired
	private IMemberService MemberService;
	
	private static final Logger logger = LoggerFactory.getLogger(PboardController.class);

	@RequestMapping(value = "/member.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String member(Locale locale, Model model) {
		List<MemberDTO> list = MemberService.getAllList();
		model.addAttribute("list", list);
		return "memberlist";
	}
	
	@RequestMapping(value = "/insertmemberform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertmember(Locale locale, Model model) {
		return "memberinsertform";
	}
	
	@RequestMapping(value = "/insertmember.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, MemberDTO dto,String birthtest) {
		System.out.println("birth : "+dto.getBirth());
		Timestamp ts= Timestamp.valueOf(birthtest+" 00:00:00");
		dto.setBirth(ts);
		boolean isS = MemberService.insertMember(dto);
		if(isS) {
			return "redirect:member.do";
		}else {
			model.addAttribute("msg","가입실패");
			return "error";
		}
	}


}

