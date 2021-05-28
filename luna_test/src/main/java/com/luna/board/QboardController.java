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

import com.luna.board.dtos.QBoardDTO;
import com.luna.board.dtos.RBoardDTO;
import com.luna.board.service.IQBoardService;

@Controller
public class QboardController {
	
	@Autowired
	private IQBoardService qBoardService;
	
	
	@RequestMapping(value = "/qboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String qboard(Locale locale, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String admin = (String)session.getAttribute("admin");
		if(admin !=null) {
			if(admin.equals("관리자")) {
				List<QBoardDTO> list = qBoardService.getAllList(new QBoardDTO());
				model.addAttribute("list",list);
				return "qboardlist";
				} else {
					List<QBoardDTO> list = qBoardService.getAllList(new QBoardDTO(id));
					model.addAttribute("list",list);
					return "qboardlist";
				}
		}else {
			return "userlogin";
		}
		
	}
	
	@RequestMapping(value = "/insertqboardform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertboard(Locale locale, Model model,String id,int pseq) {
		model.addAttribute("id",id);
		model.addAttribute("pseq",pseq);
		return "qboardinsertform";
	}
	
	
	
	@RequestMapping(value = "/insertqboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, QBoardDTO dto) {
		boolean isS = qBoardService.insertBoard(dto);
		if(isS) {
			return "redirect:qboard.do";
		} else {
			model.addAttribute("msg", "문의 글 추가를 실패하였습니다.");
			return "error";
		}
	}
	
	@RequestMapping(value = "/qreply.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String qreplyForm(Locale locale, Model model,int qseq) {
		QBoardDTO dto = qBoardService.getBoard(qseq);
		System.out.println("qtitle"+dto.getQtitle());
		model.addAttribute("dto", dto);
		return "qreply";
	}
	
	@RequestMapping(value = "/insertqreply.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String reply(Locale locale, Model model, QBoardDTO dto, int par_qseq) {
		dto.setPar_qseq(dto.getQseq());
		System.out.println(dto.getQcontent());
		boolean isS = qBoardService.insertReply(dto);
		if(isS) {
			return "redirect:qboard.do";
		} else {
			model.addAttribute("msg", "댓글 등록을 실패하였습니다.");
			return "error";
		}
	}
	
//	@RequestMapping(value = "/updateqboardForm.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String updateboard(Locale locale, Model model,int qseq) {
//		QBoardDTO dto = qBoardService.getBoard(qseq);
//		System.out.println("qtitle"+dto.getQtitle());
//		model.addAttribute("dto", dto);
//		return "qboardupdateform";
//	}
//
//	@RequestMapping(value = "/updateqboard.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String update(Locale locale, Model model, QBoardDTO dto) {
//		boolean isS = qBoardService.updateBoard(dto);
//		if(isS) {
//			return "redirect:qboard.do";
//		} else {
//			model.addAttribute("msg","문의 글 수정을 실패하였습니다.");
//			return "error";
//		}
//
//	}
	
	@RequestMapping(value = "/muldelQboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = qBoardService.mulDel(chk);
		if(isS) {
			return "redirect:qboard.do";
		} else {
			model.addAttribute("msg","문의 글 수정을 실패하였습니다.");
			return "error";
		}

	}
	
}
