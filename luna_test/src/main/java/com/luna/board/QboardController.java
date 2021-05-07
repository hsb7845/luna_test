package com.luna.board;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.QBoardDTO;
import com.luna.board.service.IQBoardService;

@Controller
public class QboardController {
	
	@Autowired
	private IQBoardService qBoardService;
	
	
	@RequestMapping(value = "/qboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String qboard(Locale locale, Model model) {
		List<QBoardDTO> list = qBoardService.getAllList();
		model.addAttribute("list",list);
		
		return "qboardlist";
	}
	
	@RequestMapping(value = "/insertqboardform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertboard(Locale locale, Model model) {

		return "qboardinsertform";
	}
	
	
	
	@RequestMapping(value = "/insertqboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, QBoardDTO dto) {
		System.out.println(dto);
		boolean isS = qBoardService.insertBoard(dto);
		if(isS) {
			return "redirect:qboard.do";
		} else {
			model.addAttribute("msg", "문의 글 추가를 실패하였습니다.");
			return "error";
		}
	}
	
	
	@RequestMapping(value = "/updateqboardForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateboard(Locale locale, Model model,int qseq) {
		QBoardDTO dto = qBoardService.getBoard(qseq);
		System.out.println("qtitle"+dto.getQtitle());
		model.addAttribute("dto", dto);
		return "qboardupdateform";
	}

	@RequestMapping(value = "/updateqboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, QBoardDTO dto) {
		boolean isS = qBoardService.updateBoard(dto);
		if(isS) {
			return "redirect:qboard.do";
		} else {
			model.addAttribute("msg","문의 글 수정을 실패하였습니다.");
			return "error";
		}

	}
	
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
