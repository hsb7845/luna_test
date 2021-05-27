package com.luna.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luna.board.dtos.BuyDetailDTO;
import com.luna.board.dtos.BuyListDTO;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.SelectedOptionDTO;
import com.luna.board.service.IBuyListService;



@Controller
public class BuyListController {
	@Autowired
	private IBuyListService buyListService;
	
	@RequestMapping(value = "/buylist.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String getAllBuyList(Locale locale, Model model,HttpServletRequest request) {
		List<BuyListDTO> list = buyListService.getAllList();
		model.addAttribute("list",list);
		return "buylist";
	}
	
	@RequestMapping(value = "/buyListInsertForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListInsertForm(Locale locale, Model model) {
		

		return "buyListInsertForm";
	}
	
	@RequestMapping(value = "/buyform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buytForm(Locale locale, Model model,HttpServletRequest request) {
		int pseq =  Integer.parseInt(request.getParameter("pseq"));
		System.out.println("구매폼  : "+request.getParameter("selOptNum"));
		int selOptNum = Integer.parseInt(request.getParameter("selOptNum"));
		System.out.println("selOptNum"+selOptNum);
		Map<String,Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id==null) {
			String msg = "자동 로그아웃 되었습니다.";
			return "redirect:loginForm.do";
		}
		JSONParser  parser = new JSONParser();
		List<SelectedOptionDTO> list = new ArrayList<>();
		if(selOptNum>1) {
			
			try {
				Object obj = parser.parse(request.getParameter("selOpt"));
				JSONObject jsonObj = (JSONObject) obj;
				System.out.println(jsonObj);
			for(int i=1;i<=selOptNum;i++) {
					SelectedOptionDTO optDTO = new SelectedOptionDTO();
					JSONObject jsonObj1  = (JSONObject)jsonObj.get(i+"");
					System.out.println("구매폼  : "+jsonObj1.toJSONString());
					optDTO.setAmount(Integer.parseInt((String)jsonObj1.get("amount")));
					optDTO.setOptName((String) jsonObj1.get("optName"));
					optDTO.setPrice(Integer.parseInt((String)jsonObj1.get("price")));
					list.add(optDTO);
					//System.out.println(jsonObj.toJSONString());
					//System.out.println("jsonObj.get(1)"+jsonObj.get("1"));
				}
				model.addAttribute("list",list);
			} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}else {
			SelectedOptionDTO optDTO = new SelectedOptionDTO();
			try {
				Object obj = parser.parse(request.getParameter("selOpt"));
				JSONObject jsonObj = (JSONObject) obj;
				JSONObject jsonObj1  = (JSONObject)jsonObj.get("1");
				System.out.println(jsonObj1.toJSONString());
				optDTO.setAmount(Integer.parseInt((String) jsonObj1.get("amount")));
				String optName = (String) jsonObj1.get("optName");
				if(optName.indexOf("/")!=-1) {
					optName = optName.substring(0,optName.length()-1);
				}
			
				optDTO.setOptName(optName);
				optDTO.setPrice(Integer.parseInt((String) jsonObj1.get("price")));
				list.add(optDTO);
				model.addAttribute("list",list);
				//System.out.println(jsonObj.toJSONString());
				//System.out.println("jsonObj.get(1)"+jsonObj.get("1"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		MemberDTO mdto = buyListService.getMember(id);
		map = buyListService.getPboard(pseq);
		model.addAttribute("mdto",mdto);
		model.addAttribute("dto",map.get("dto"));
		return "buyForm";
	}
	@RequestMapping(value = "/buy.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buy(Locale locale, Model model,HttpServletRequest request) {
		int count = Integer.parseInt(request.getParameter("count"));
		BuyListDTO blDTO = new BuyListDTO();
		blDTO.setId(request.getParameter("id"));
		blDTO.setName(request.getParameter("name"));
		blDTO.setPhone(request.getParameter("phone"));
		blDTO.setAddress(request.getParameter("address"));
		blDTO.setTotalPrice(Integer.parseInt(request.getParameter("totalPrice")));
		List<BuyDetailDTO> list = new ArrayList<>();
		BuyDetailDTO bdDTO = new BuyDetailDTO();
		if(count>1) {
			for(int i=1;i<=count;i++) {
				bdDTO.setPcount(Integer.parseInt(request.getParameter("amount"+i)));
				bdDTO.setSelOpt(request.getParameter("selOpt"+i));
				bdDTO.setPseq(Integer.parseInt(request.getParameter("pseq")));
				list.add(bdDTO);
			}
		}else if(count==1) {
			bdDTO.setPcount(Integer.parseInt(request.getParameter("amount"+1)));
			bdDTO.setSelOpt(request.getParameter("selOpt"+1));
			bdDTO.setPseq(Integer.parseInt(request.getParameter("pseq")));
			list.add(bdDTO);
		}
		boolean isS = buyListService.insertBuyList(blDTO,list);
		return "buyResult";
	}
	
	@RequestMapping(value = "/buyListInsert.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListInsert(Locale locale, Model model,BuyListDTO dto) {
		boolean isS = buyListService.insertBoard(dto);
		if(isS) {
			return "redirect:buylist.do";
		}else {
			model.addAttribute("msg","글추가실패");
			return "error";
		}
		
	}
	
	@RequestMapping(value = "/buyListUpdateForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListUpdateForm(Locale locale, Model model,int bseq) {
		BuyListDTO dto = buyListService.getBoard(bseq);
		model.addAttribute("dto",dto);
		return "buyListUpdateForm";
	}
	
	@RequestMapping(value = "/buyListUpdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListUpdate(Locale locale, Model model,BuyListDTO dto) {
		boolean isS = buyListService.updateBoard(dto);
		if(isS) {
			return "redirect:buylist.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
		
	}
	
	@RequestMapping(value = "/buyListDelete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListDelete(Locale locale, Model model,int bseq) {
		boolean isS = buyListService.deleteBoard(bseq);
		if(isS) {
			return "redirect:buylist.do";
		}else {
			model.addAttribute("msg","글삭제실패");
			return "error";
		}
		
	}
	
	
	
	@RequestMapping(value = "/buyListMulDel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyListMulDel(Locale locale, Model model,String[] chk) {
		boolean isS = buyListService.mulDel(chk);
		if(isS) {
			return "redirect:buylist.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
		
	}
	
	
}
