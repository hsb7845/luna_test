
package com.luna.board;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.luna.board.dtos.PBoardDTO;
import com.luna.board.dtos.PagingDTO;
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
	@RequestMapping(value = "/pboardpaging.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String pboardPaging(Locale locale, Model model,PagingDTO pagingDTO,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage",required=false)String cntPerPage) throws IOException {
		
		int total = pBoardService.countBoard();
		if(nowPage ==null &&cntPerPage == null) {
			nowPage="1";
			cntPerPage = "9";
		}else if(nowPage==null) {
			nowPage="1";
		}else if(cntPerPage==null) {
			cntPerPage = "9";
		}
		pagingDTO = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<PBoardDTO> list = pBoardService.getPagingList(pagingDTO);
		
		model.addAttribute("paging", pagingDTO);
		model.addAttribute("list",list);
	
//		if(arrayNum ==0) {
//			
//		}else if(arrayNum ==1) {
//			
//		}else if(arrayNum ==2) {
//			
//		}
//		
//		List<PBoardDTO> list = pBoardService.getAllList();
//		model.addAttribute("list",list);
		
		
		return "pboardPaging";
	}
	
	
	@RequestMapping(value = "/pboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String pboard(Locale locale, Model model) {
		
//		int total = pBoardService.countBoard();
//		if(nowPage ==null &&cntPerPage == null) {
//			nowPage="1";
//			cntPerPage = "5";
//		}else if(nowPage==null) {
//			nowPage="1";
//		}else if(cntPerPage==null) {
//			cntPerPage = "5";
//		}
//		pagingDTO = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		model.addAttribute("paging", "pagingDTO");
//		model.addAttribute("list",pBoardService.getPagingList(pagingDTO));
		
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
			model.addAttribute("msg","상품 글 추가를 실패하였습니다.");
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
			model.addAttribute("msg","상품 글 수정을 실패하였습니다.");
			return "error";
		}

	}
	
	@RequestMapping(value = "/muldelPboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = pBoardService.mulDel(chk);
		if(isS) {
			return "redirect:pboard.do";
		}else {
			model.addAttribute("msg","상품 글 수정을 실패하였습니다.");
			return "error";
		}

	}

}

