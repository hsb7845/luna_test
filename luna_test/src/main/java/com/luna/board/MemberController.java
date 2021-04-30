package com.luna.board;

import java.sql.Timestamp;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println("birthtest : "+birthtest);
		Timestamp ts= Timestamp.valueOf(birthtest+" 00:00:00");
		dto.setBirth(ts);
		boolean isS = MemberService.insertMember(dto);
		if(isS) {
			return "redirect:member.do";
		}else {
			model.addAttribute("msg","회원가입실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/updatememberForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updatemember(Locale locale, Model model,String id) {
		MemberDTO dto = MemberService.getMember(id);
		System.out.println("date"+dto.getBirth());
		model.addAttribute("dto", dto);
		return "memberupdateform";
	}
	
	@RequestMapping(value = "/updatemember.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, MemberDTO dto, String birthtest) {
		Timestamp ts= Timestamp.valueOf(birthtest+" 00:00:00");
		dto.setBirth(ts);
		boolean isS = MemberService.updateMember(dto);
		if(isS) {
			return "redirect:member.do";
		}else {
			model.addAttribute("msg","회원정보수정실패");
			return "error";
		}

	}
	
	@RequestMapping(value = "/muldelmember.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = MemberService.muldelMember(chk);
		if(isS) {
			return "redirect:member.do";
		}else {
			model.addAttribute("msg","회원정보삭제실패");
			return "error";
		}

	}
	
	@ResponseBody
	@RequestMapping(value="/idChk.do", method = {RequestMethod.GET,RequestMethod.POST})
	public int idChk(MemberDTO dto,ServletRequest request) throws Exception {
		String id = request.getParameter("id");
		dto.setId(id);
		int result = MemberService.idChk(dto);
		return result;
	}
	
	
	
	@RequestMapping(value = "/loginForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String loginForm(Locale locale, Model model) {
		return "userlogin";

	}
	
	@RequestMapping(value = "/login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(Locale locale, Model model,MemberDTO dto,HttpServletRequest request) {
		String msg= "";
		boolean isS = false;
		dto=MemberService.login(dto);
		if(dto.getId()!=null) {
			isS=true;
		}
		HttpSession session = request.getSession();
		
		if(isS) {
			session.setAttribute("id", dto.getId());
			session.setAttribute("admin",dto.getAdmin());
			System.out.println("admin : "+dto.getAdmin());
		}else {
			msg="아이디나 비밀번호가 틀렸습니다.";
		}
		model.addAttribute("msg",msg);
		return "index";
	}



}

