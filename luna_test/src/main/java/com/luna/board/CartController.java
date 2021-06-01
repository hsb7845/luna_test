package com.luna.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luna.board.dtos.CartDTO;
import com.luna.board.dtos.SelectedOptionDTO;
import com.luna.board.service.ICartService;

@Controller
public class CartController {
	
	@Autowired
	private ICartService CartService;
	
	@RequestMapping(value = "/cart.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String cart(Locale locale, Model model,HttpServletRequest request) {
		String id =(String) request.getSession().getAttribute("id");
		String msg = " ";
		List<CartDTO> list = new ArrayList<CartDTO>();
		if(id==null) {
			msg = "비정상적인 접근입니다.";
			return "redirect:main.do";
		}else {
			list = CartService.getAllList(id);
		}
		
		model.addAttribute("list",list);
		
		return "cartList";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/insertCart.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model,int selOptNum,String id,int pseq,HttpServletRequest request) {
		JSONParser  parser = new JSONParser();
		List<CartDTO> list = new ArrayList<>();
		CartDTO dto = new CartDTO();
		if(selOptNum>1) {
			try {
				Object obj = parser.parse(request.getParameter("selOpt"));
				System.out.println(obj);
				JSONObject jsonObj = (JSONObject) obj;
				System.out.println(jsonObj);
			for(int i=1;i<=selOptNum;i++) {
					dto.setId(id);
					dto.setPseq(pseq);
					JSONObject jsonObj1  = (JSONObject)jsonObj.get(i+"");
					dto.setPcount(Integer.parseInt((String)jsonObj1.get("amount")));
					dto.setPrice(Integer.parseInt((String)jsonObj1.get("price")));
					dto.setSelOpt((String) jsonObj1.get("optName"));
					//System.out.println("구매폼  : "+jsonObj1.toJSONString());
					//System.out.println(jsonObj.toJSONString());
					//System.out.println("jsonObj.get(1)"+jsonObj.get("1"));
					list.add(dto);
				}
			} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else if(selOptNum==1) {
			try {
				Object obj = parser.parse(request.getParameter("selOpt"));
				JSONObject jsonObj = (JSONObject) obj;
				System.out.println(jsonObj);
				dto.setId(id);
				dto.setPseq(pseq);
				JSONObject jsonObj1  = (JSONObject)jsonObj.get(1+"");
				dto.setPcount(Integer.parseInt((String)jsonObj1.get("amount")));
				dto.setPrice(Integer.parseInt((String)jsonObj1.get("price")));
				dto.setSelOpt((String) jsonObj1.get("optName"));
				//System.out.println("구매폼  : "+jsonObj1.toJSONString());
				//System.out.println(jsonObj.toJSONString());
				//System.out.println("jsonObj.get(1)"+jsonObj.get("1"));
				list.add(dto);
			} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		boolean isS = CartService.insertCart(list);
		if(isS) {
			String msg = "장바구니에 상품이 정상적으로 담겼습니다.";
			return msg;
		}else {
			String msg ="";
			return msg;
		}
	}	
	
	@RequestMapping(value = "/cartUpdateForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateCart(Locale locale, Model model,int seq) {
		CartDTO dto = CartService.getCart(seq);
		System.out.println("seq"+dto.getSeq());
		model.addAttribute("dto", dto);
		return "cartUpdateForm";
	}
	
	@RequestMapping(value = "/updateCart.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model, CartDTO dto) {
		boolean isS = CartService.updateCart(dto);
		if(isS) {
			return "redirect:cart.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/muldelCart.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = CartService.mulDel(chk);
		if(isS) {
			return "redirect:cart.do";
		}else {
			model.addAttribute("msg","글수정실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/cartPopup.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String cartPopup(Locale locale, Model model,String id) {
		model.addAttribute("id",id);
		return "cartPopup";
	}
}
