package com.luna.board;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.POptionDTO;
import com.luna.board.service.IPoptionService;

@Controller
public class PoptionController {

	@Autowired
	private IPoptionService POptionService;
	
	@RequestMapping(value = "/poption.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String poption(Locale locale, Model model) {
		List<POptionDTO>list = POptionService.getAllList();
		model.addAttribute("list", list);
		return "poptionlist";
	}
	
	@RequestMapping(value = "/insertpoptionform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertpoption(Locale locale, Model model) {

		return "poptioninsertform";
	}
	
	
	
	@RequestMapping(value = "/insertpoption.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, POptionDTO dto) {
		boolean isS = POptionService.insertPoption(dto);
		if(isS) {
			return "redirect:poption.do";
		} else {
			model.addAttribute("msg", "옵션작성을 실패하였습니다.");
			return "error";
		}
	}
	
	
	@RequestMapping(value = "/updatepoptionForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updatepoption(Locale locale, Model model,int qseq) {
		POptionDTO dto = POptionService.getPoption(qseq);
		model.addAttribute("dto", dto);
		return "poptionupdateform";
	}

	@RequestMapping(value = "/updatepoption.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, POptionDTO dto) {
		boolean isS = POptionService.updatePoption(dto);
		if(isS) {
			return "redirect:poption.do";
		} else {
			model.addAttribute("msg","옵션 수정 실패");
			return "error";
		}

	}
	
	@RequestMapping(value = "/muldelpoption.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chks) {
		boolean isS = POptionService.mulDel(chks);
		if(isS) {
			return "redirect:poption.do";
		} else {
			model.addAttribute("msg","옵션 삭제 실패");
			return "error";
		}

	}
	
}
