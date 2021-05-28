
package com.luna.board;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import com.luna.board.dtos.MemberDTO;
import com.luna.board.dtos.PBoardDTO;
import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.dtos.POptionDTO;
import com.luna.board.dtos.PagingDTO;
import com.luna.board.dtos.StockDTO;
import com.luna.board.service.IPBoardService;
import com.luna.board.service.IStockService;


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
	@Autowired
	private IStockService stockService;

	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String nomain(Locale locale, Model model) {
		return "index";
	}
	
	@RequestMapping(value = "/index.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String index(Locale locale, Model model) {

		return "index";
	}
	@RequestMapping(value = "/pboardpaging.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String pboardPaging(Locale locale, Model model,PagingDTO pagingDTO,@RequestParam(value="sorting",required=false)String sorting,
			@RequestParam(value="arrayNum", required=false)String arrayNum,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage",required=false)String cntPerPage) throws IOException {
		//System.out.println(sorting);
		
		//System.out.println(sorting);
		if(nowPage ==null&&cntPerPage==null&&arrayNum==null&&sorting==null) {
			nowPage="1";
			cntPerPage = "12";
			arrayNum ="1";
			sorting ="1";
		}else if(nowPage ==null&&cntPerPage==null&&arrayNum==null) {
			nowPage="1";
			cntPerPage = "12";
			arrayNum ="1";
		}else if(cntPerPage==null) {
			cntPerPage = "12";
		}else if(arrayNum==null) {
			arrayNum="1";
		}else if(sorting==null) {
			sorting="1";
		}
		int total = pBoardService.countBoard(sorting);
		/* sorting =1 -> 신상 2 ->귀걸이 3-> 목걸이 4-> 반지 5->팔찌 6->귀걸이
		 * 
		 * */
	
		
		pagingDTO = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),Integer.parseInt(arrayNum),Integer.parseInt(sorting));
		List<PBoardDTO> list = pBoardService.getPagingList(pagingDTO);
		System.out.println(pagingDTO.getStart());
		System.out.println(pagingDTO.getEnd());
		for(int i=0;i<list.size();i++) {
			System.out.println("i="+i);
			System.out.println(list.get(i).getPseq());
			
		}
		model.addAttribute("paging", pagingDTO);
		model.addAttribute("list",list);
		model.addAttribute("arrayNum", arrayNum);
		String msg= "";
		if(list==null) {
			msg="해당 페이지에 아직 글이없습니다.";
			model.addAttribute("msg",msg);
			return "error";
		}
		
		return "pboardPaging";
	}
	
	
	@RequestMapping(value = "/pboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String pboard(Locale locale, Model model,String select ) {
		
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
		if(select ==null) {
		select = "all";
		}
		List<PBoardDTO> list = pBoardService.getAllList(select);
		model.addAttribute("list",list);
		
		
		return "pboardlist";
	}
	
	@RequestMapping(value = "/insertpboardform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertboard(Locale locale, Model model) {
		return "pboardinsertform";
	}
	

	
	@ResponseBody
	@RequestMapping(value = "/insertpboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(Locale locale, Model model ,String realObject,int optNum,int[] pnum_arr,String ptitle,String pcontent,int mainNum ,HttpServletRequest request) {
		List<POptionDTO> optionList = new ArrayList<>();
		POptionDTO optDto = new POptionDTO();
		JSONParser  parser = new JSONParser();
		//System.out.println(mainNum);
		try {
			Object obj = parser.parse(realObject);
			JSONObject jsonObj = (JSONObject) obj;
			//System.out.println("jsonObj.toJSONString()"+jsonObj.get("opt1").toString());
			
		//	System.out.println(optjson.get("otitle"));
			for(int i=1;i<=optNum;i++) {
				optDto = new POptionDTO();
				JSONObject optjson = (JSONObject) jsonObj.get("opt"+i);
				//System.out.println(optjson.toJSONString());
				optDto.setOtitle((String) optjson.get("otitle"));
				optDto.setOcontent((String) optjson.get("ocontent"));
				optDto.setOvalue((String) optjson.get("ovalue"));
				optDto.setNecessary((String) optjson.get("necessary"));
				optionList.add(optDto);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PBoardDTO dto = new PBoardDTO();
		dto.setPtitle(ptitle);
		dto.setPcontent(pcontent);
		int[] pnum = pnum_arr;
		
		boolean isS = pBoardService.insertBoard(dto,pnum,optionList,mainNum);
		if(isS) {
			return "redirect:pboard.do";
		}else {
			model.addAttribute("msg","상품 글 추가를 실패하였습니다.");
			return "error";
		}


	}
	
	@RequestMapping(value = "/pboarddetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String pboardDetail(Locale locale, Model model, PBoardDTO dto) {
		Map<String,Object> map = pBoardService.getDetail(dto.getPseq());
		//System.out.println(map.get("rboard"));
		model.addAttribute("map", map);
		return "pboardDetailPage";


	}
	@RequestMapping(value = "/main.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String main(Locale locale, Model model) {
		return "main";

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
	@ResponseBody
	@RequestMapping(value = "/getselectedstock.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> getselectedstock(Locale locale, Model model,String[] chk_arr){
		List<StockDTO> list =  stockService.getSelectedList(chk_arr);
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getAdr.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> getAdr(Locale locale, Model model,String id){
		MemberDTO mdto = pBoardService.getMember(id);
		Map<String,Object> map = new HashMap<>();
		map.put("mdto",mdto);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchId.do", method = {RequestMethod.GET,RequestMethod.POST})
	public  int searchId(Locale locale, Model model,String id,int pseq){
		System.out.println("id는 "+id);
		pseq = pBoardService.serachId(id,pseq);
		
		System.out.println(pseq);
		return pseq;
	}
	
	
	
	
	@RequestMapping(value = "/selectstock.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String selectStock(Locale locale, Model model) {
		List<StockDTO> list =  stockService.getAllList();
		model.addAttribute("list", list);
		return "selectStockList";
	}
	@RequestMapping(value = "/inputTest.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String inputTest(Locale locale, Model model) {
		return "inputTest";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCategory.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> getCategory(Locale locale, Model model,String[] chk_arr){
		List<PCategoryDTO> list =  pBoardService.getCategory(chk_arr);
		Map<String,Object> map = new HashMap<>();
		map.put("category",list);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadimgfile.do", method = {RequestMethod.GET,RequestMethod.POST})
	public boolean uploadimgfile(Locale locale, Model model,HttpServletRequest request){
		boolean isS =  pBoardService.uploadImg(request);
		return isS;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/uploadimgfileTest.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> uploadimgfileTest(Locale locale, Model model,MultipartFile[] uploadFiles,HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		boolean fileUpload =  pBoardService.uploadFile(uploadFiles,request);
		if(fileUpload) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
}

