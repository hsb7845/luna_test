package com.luna.board;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.RBoardDTO;
import com.luna.board.service.IRBoardService;

@Controller
public class RboardController {

	@Autowired
	private IRBoardService rBoardService;
	
	
	@RequestMapping(value = "/rboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String rboard(Locale locale, Model model) {
		
		List<RBoardDTO> list = rBoardService.getAllList();
		model.addAttribute("list",list);
		return "rboardlist";
		
	}
	
	@RequestMapping(value = "/insertrboardform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertboard(Locale locale, Model model) {

		return "rboardinsertform";
	}
	
	
	
	@RequestMapping(value = "/insertrboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, RBoardDTO dto, String starrank[]) {
		dto.setStarrank(Integer.parseInt(starrank[starrank.length-1]));
		boolean isS = rBoardService.insertBoard(dto);
		if(isS) {
			return "redirect:rboard.do";
		} else {
			model.addAttribute("msg", "리뷰 글 추가를 실패하였습니다.");
			return "error";
		}
	}
	@RequestMapping(value = "/rreply.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String rreplyForm(Locale locale, Model model,int rseq) {
		RBoardDTO dto = rBoardService.getBoard(rseq);
		System.out.println("rtitle"+dto.getRtitle());
		model.addAttribute("dto", dto);
		return "rreply";
	}
	
	@RequestMapping(value = "/insertrreply.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String reply(Locale locale, Model model, RBoardDTO dto, int par_rseq) {
		dto.setPar_rseq(par_rseq);
		boolean isS = rBoardService.insertReply(dto);
		if(isS) {
			return "redirect:rboard.do";
		} else {
			model.addAttribute("msg", "댓글 등록을 실패하였습니다.");
			return "error";
		}
	}
	// 왜 안되는거지...
	
	
//	@RequestMapping(value = "/updaterboardForm.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String updateboard(Locale locale, Model model,int rseq) {
//		RBoardDTO dto = rBoardService.getBoard(rseq);
//		System.out.println("rtitle"+dto.getRtitle());
//		model.addAttribute("dto", dto);
//		return "rboardupdateform";
//	}

//	@RequestMapping(value = "/updaterboard.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String update(Locale locale, Model model, RBoardDTO dto) {
//		boolean isS = rBoardService.updateBoard(dto);
//		if(isS) {
//			return "redirect:rboard.do";
//		} else {
//			model.addAttribute("msg","리뷰 글 수정을 실패하였습니다.");
//			return "error";
//		}
//
//	}
	
	@RequestMapping(value = "/muldelRboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = rBoardService.mulDel(chk);
		if(isS) {
			return "redirect:rboard.do";
		} else {
			model.addAttribute("msg","리뷰 글 수정을 실패하였습니다.");
			return "error";
		}

	}
	
	
}

