
package com.luna.board;


import java.util.List;
import java.util.Locale;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.PBoardDTO;
import com.luna.board.service.IPBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PboardController {

	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private  IPBoardService pBoardService;

	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String main(Locale locale, Model model) {

		return "index";
	}
	
	@RequestMapping(value = "/index.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String index(Locale locale, Model model) {

		return "index";
	}
	@RequestMapping(value = "/pboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String pboard(Locale locale, Model model) {
		List<PBoardDTO> list = pBoardService.getAllList();
		model.addAttribute("list",list);
		
		
		return "pboardlist";
	}

	@RequestMapping(value = "/insertpboardform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertboard(Locale locale, Model model) {
		return "pboardinsertform";
	}

	@RequestMapping(value = "/insertpboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, PBoardDTO dto) {
		boolean isS = pBoardService.insertBoard(dto);
		if(isS) {
			return "redirect:pboard.do";
		}else {
			model.addAttribute("msg","글추가실패");
			return "error";
		}


	}

	@RequestMapping(value = "/updatePboardForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateboard(Locale locale, Model model,int pseq) {
		PBoardDTO dto = pBoardService.getBoard(pseq);
		System.out.println("ptitle"+dto.getPtitle());
		model.addAttribute("dto", dto);
		return "pboardupdateform";
	}

	@RequestMapping(value = "/updatepboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, PBoardDTO dto) {
		boolean isS = pBoardService.updateBoard(dto);
		if(isS) {
			return "redirect:pboard.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}

	}
	
	@RequestMapping(value = "/muldelPboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = pBoardService.mulDel(chk);
		if(isS) {
			return "redirect:pboard.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}

	}

}

