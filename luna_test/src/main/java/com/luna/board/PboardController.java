package com.luna.board;


import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	private static final Logger logger = LoggerFactory.getLogger(PboardController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private  IPBoardService pBoardService;

	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String index(Locale locale, Model model) {

		return "index";
	}


	@RequestMapping(value = "/insertboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertboard(Locale locale, Model model) {



		return "insertboard";
	}

	@RequestMapping(value = "/insert.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model, PBoardDTO dto) {
		boolean isS = pBoardService.insertBoard(dto);
		if(isS) {
			return "redirect:pboard.do";
		}else {
			model.addAttribute("msg","글추가실패");
			return "error";
		}


	}

	@RequestMapping(value = "/error.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String error(Locale locale, Model model) {

		return "error";
	}

	@RequestMapping(value = "/pboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardList(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		List<PBoardDTO> list = pBoardService.getAllList();
		model.addAttribute("list",list);


		return "pboardlist";
	}




}
