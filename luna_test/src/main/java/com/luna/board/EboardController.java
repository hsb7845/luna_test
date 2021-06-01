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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.luna.board.dtos.EBoardDTO;
import com.luna.board.dtos.PagingDTO;
import com.luna.board.dtos.RBoardDTO;
import com.luna.board.service.IEBoardService;


	@Controller
	public class EboardController {
		
		@Autowired
		private IEBoardService eBoardService;
	
		
		
		@RequestMapping(value = "/eboard.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String eboard(Locale locale, Model model,HttpServletRequest request,PagingDTO pagingDTO,
				@RequestParam(value="nowPage", required=false)String nowPage,
				@RequestParam(value="cntPerPage",required=false)String cntPerPage) {
			if(nowPage ==null&&cntPerPage==null) {
				nowPage="1";
				cntPerPage = "12";
			}else if(cntPerPage==null) {
				cntPerPage = "12";
			}else if(nowPage==null) {
				nowPage="1";
			}
			int total = eBoardService.countBoard();
			pagingDTO = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),0,0);
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			String admin = (String)session.getAttribute("admin");
			if(admin !=null) {
			if(admin.equals("관리자")) {
				List<EBoardDTO> list = eBoardService.getAllList();
				model.addAttribute("list",list);
				return "eboardAdminList";
				} 
				}
			List<EBoardDTO> list = eBoardService.getPagingList(pagingDTO);
			model.addAttribute("list",list);
			return "eboardlist";
			}

		
		@RequestMapping(value = "/inserteboardform.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String insertboard(Locale locale, Model model) {

			return "eboardinsertform";
		}
		
		
		
		@RequestMapping(value = "/inserteboard.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String insert(Locale locale, Model model, EBoardDTO dto,MultipartHttpServletRequest request) {
			boolean isS = eBoardService.insertBoard(dto,request);

			if(isS) {
				return "redirect:eboard.do";
			} else {
				model.addAttribute("msg", "이벤트 글 추가를 실패하였습니다.");
				return "error";
			}
		}
		
		
		@RequestMapping(value = "/updateeboardForm.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String updateboard(Locale locale, Model model,int eseq) {
			EBoardDTO dto = eBoardService.getBoard(eseq);
			System.out.println("etitle"+dto.getEtitle());
			model.addAttribute("dto", dto);
			return "eboardupdateform";
		}

		@RequestMapping(value = "/updateeboard.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String update(Locale locale, Model model, EBoardDTO dto,MultipartHttpServletRequest request) {
			boolean isS = eBoardService.updateBoard(dto,request);
			
			if(isS) {
				return "redirect:eboard.do";
			} else {
				model.addAttribute("msg","이벤트 글 수정을 실패하였습니다.");
				return "error";
			}

		}
		
		@RequestMapping(value = "/muldelEboard.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String muldel(Locale locale, Model model, String[] chk) {
			boolean isS = eBoardService.mulDel(chk);
			if(isS) {
				return "redirect:eboard.do";
			} else {
				model.addAttribute("msg","이벤트 글 수정을 실패하였습니다.");
				return "error";
			}
		}
	}
