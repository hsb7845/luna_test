
package com.luna.board;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.luna.board.dtos.QBoardDTO;
import com.luna.board.dtos.RBoardDTO;
import com.luna.board.dtos.SmartEditorDTO;
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
		Map<String,Object> map = pBoardService.mainPage();

		model.addAttribute("map",map);
		return "main";
	}
	
	@RequestMapping(value = "/index.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String index(Locale locale, Model model) {
		Map<String,Object> map = pBoardService.mainPage();

		model.addAttribute("map",map);

		return "main";
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
		//System.out.println(pagingDTO.getStart());
		//System.out.println(pagingDTO.getEnd());
		for(int i=0;i<list.size();i++) {
			//System.out.println("i="+i);
			//System.out.println(list.get(i).getPseq());
			
		}
		model.addAttribute("paging", pagingDTO);
		model.addAttribute("list",list);
		model.addAttribute("arrayNum", arrayNum);
		model.addAttribute("sorting",sorting);
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
	public Map<String,Object> insert(Locale locale, Model model ,String realObject,int optNum,int[] pnum_arr,String ptitle,String pcontent,int mainNum ,HttpServletRequest request) {
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
		
		Map<String,Object> map = pBoardService.insertBoard(dto,pnum,optionList,mainNum);
		
		return map;
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
		Map<String,Object> map = pBoardService.mainPage();

		model.addAttribute("map",map);
		return "main";

	}
	@ResponseBody
	@RequestMapping(value = "/showAnsR.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> showAnsR(Locale locale, Model model,int rseq) {
		RBoardDTO dto = pBoardService.showAnsR(rseq);
		Map<String,Object> map = new HashMap<>();
		map.put("dto",dto);
		model.addAttribute("map",map);
		return map;

	}
	
	@ResponseBody
	@RequestMapping(value = "/showAnsQ.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> showAnsQ(Locale locale, Model model,int qseq) {
		QBoardDTO dto = pBoardService.showAnsQ(qseq);
		Map<String,Object> map = new HashMap<>();
		map.put("dto",dto);
		model.addAttribute("map",map);
		return map;

	}
	
	@RequestMapping(value = "/updateImg.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateImg(Locale locale, Model model,@RequestParam int pseq,@RequestParam(required=false) List<MultipartFile>uploadFiles,HttpServletRequest request) {
		System.out.println("여기서의"+pseq);
		boolean isS = pBoardService.updateImg(pseq,request,uploadFiles);
		//System.out.println(map.get("rboard"));
		if(isS) {
			return "redirect:pboard.do";
		}else {
			return "error";
		}
		
	}
	
	

	@RequestMapping(value = "/updatePboardForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateboard(Locale locale, Model model,int pseq) {
		Map<String,Object> map = pBoardService.getDetailUpdateForm(pseq);
		//System.out.println(map.get("rboard"));
		model.addAttribute("map", map);
		return "pboardupdateform";
	}
	@ResponseBody
	@RequestMapping(value = "/updatepboard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Locale locale, Model model,String realObject,int optNum,int[] pnum_arr,String ptitle,String pcontent,int mainNum,int pseq) {
		//System.out.println("여기는 오는거지?");
		System.out.println("pcontent: "+pcontent);
		
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
				optDto.setPseq(pseq);
				optionList.add(optDto);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PBoardDTO dto = new PBoardDTO();
		dto.setPseq(pseq);
		dto.setPtitle(ptitle);
		dto.setPcontent(pcontent);
		int[] pnum = pnum_arr;
		pBoardService.updateBoard(dto,pnum,optionList,mainNum,pseq);	
		return "";
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
	//	System.out.println("id는 "+id);
		pseq = pBoardService.serachId(id,pseq);
		
	//	System.out.println(pseq);
		return pseq;
	}
	
	
	
	
	@RequestMapping(value = "/selectstock.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String selectStock(Locale locale, Model model) {
		List<StockDTO> list =  stockService.getAllList();
		List<String> ptype = stockService.getPtype();
		model.addAttribute("list", list);
		model.addAttribute("ptype",ptype);
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
	@RequestMapping(value = "/getListType.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,List<StockDTO>> getListType(Locale locale, Model model,String ptype){
		Map<String,List<StockDTO>> map = new HashMap<String, List<StockDTO>>();
		List<StockDTO> list = pBoardService.getListType(ptype);
		map.put("list", list);
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/uploadimgfileTest.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,Object> uploadimgfileTest(Locale locale, Model model,@RequestParam String pseq,MultipartFile[] uploadFiles,HttpServletRequest request){
		System.out.println("아작스 오니?");
		Map<String,Object> resultMap = new HashMap<String,Object>();
		boolean fileUpload =  pBoardService.uploadFile(uploadFiles,request);
		if(fileUpload) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/file_uploader")
	public String file_uploader(HttpServletRequest request, HttpServletResponse response, SmartEditorDTO editor){ 
		String return1=request.getParameter("callback"); 
		String return2="?callback_func=" + request.getParameter("callback_func"); 
		String return3=""; String name = ""; 
		try { 
			if(editor.getFiledata() != null && editor.getFiledata().getOriginalFilename() != null && !editor.getFiledata().getOriginalFilename().equals("")) { 
				// 기존 상단 코드를 막고 하단코드를 이용
				name = editor.getFiledata().getOriginalFilename().substring(editor.getFiledata().getOriginalFilename().lastIndexOf(File.separator)+1); 
				String filename_ext = name.substring(name.lastIndexOf(".")+1); 
				filename_ext = filename_ext.toLowerCase(); 
				String[] allow_file = {"jpg","png","bmp","gif"}; 
				int cnt = 0; 
				for(int i=0; i<allow_file.length; i++) {
					if(filename_ext.equals(allow_file[i])){ 
						cnt++;
						} 
					} 
				if(cnt == 0) {
					return3 = "&errstr="+name;
				} else { 
							//파일 기본경로
						String dftFilePath = request.getSession().getServletContext().getRealPath("/"); 
						//파일 기본경로 _ 상세경로 
						String filePath = dftFilePath + "resources"+ File.separator + "editor" + File.separator +"upload" + File.separator; 
						File file = new File(filePath);
						if(!file.exists()) { 
							file.mkdirs(); 
						} 
						String realFileNm = "";
						SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss"); 
							String today= formatter.format(new java.util.Date());
							realFileNm = today+UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
							String rlFileNm = filePath + realFileNm; 
							///////////////// 서버에 파일쓰기 ///////////////// 
							editor.getFiledata().transferTo(new File(rlFileNm)); 
							///////////////// 서버에 파일쓰기 ///////////////// 
						return3 += "&bNewLine=true"; 
						return3 += "&sFileName="+ name;
						return3 += "&sFileURL=/resources/editor/upload/"+realFileNm;
						} 
					}else { 
							return3 += "&errstr=error"; 
					} 
			} catch (Exception e) {
					e.printStackTrace();
				} 
				return "redirect:"+return1+return2+return3; 
		}
	@RequestMapping("/file_uploader_html5")
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response){ 
		System.out.println("hi!");
		try {
			//파일정보
			String sFileInfo = ""; 
			//파일명을 받는다 - 일반 원본파일명 
			String filename = request.getHeader("file-name");
			//파일 확장자 
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1); 
			//확장자를소문자로 변경
			filename_ext = filename_ext.toLowerCase(); 
			//이미지 검증 배열변수
			String[] allow_file = {"jpg","png","bmp","gif"}; 
			//돌리면서 확장자가 이미지인지
			int cnt = 0;
			for(int i=0; i<allow_file.length; i++) {
				if(filename_ext.equals(allow_file[i])){
					cnt++;
					} 
				} 
			//이미지가 아님
			if(cnt == 0) { 
				PrintWriter print = response.getWriter(); 
				print.print("NOTALLOW_"+filename);
				print.flush();
				print.close(); 
				} else {
					//이미지이므로 신규 파일로 디렉토리 설정 및 업로드
					//파일 기본경로 
					String dftFilePath = request.getSession().getServletContext().getRealPath("/"); 
					//파일 기본경로 _ 상세경로 
					String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator +"multiupload" + File.separator;
					File file = new File(filePath); 
					if(!file.exists()) {
						file.mkdirs(); 
					} 
					String realFileNm = ""; 
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss"); 
					String today= formatter.format(new java.util.Date()); 
					realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf(".")); 
					String rlFileNm = filePath + realFileNm;
					///////////////// 서버에 파일쓰기 ///////////////// 
					InputStream is = request.getInputStream(); 
					OutputStream os=new FileOutputStream(rlFileNm); 
					int numRead; 
					byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
					while((numRead = is.read(b,0,b.length)) != -1){
						os.write(b,0,numRead);
					} 
					if(is != null) { 
						is.close(); 
					} 
					os.flush(); 
					os.close(); 
					///////////////// 서버에 파일쓰기 /////////////////
					// 정보 출력 
					sFileInfo += "&bNewLine=true"; 
					// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함 
					sFileInfo += "&sFileName="+ filename; 
					sFileInfo += "&sFileURL="+"/resources/editor/multiupload/"+realFileNm; 
					PrintWriter print = response.getWriter(); 
					print.print(sFileInfo);
					print.flush(); 
					print.close(); 
					} 
			} catch (Exception e) { 
				e.printStackTrace();
				} 
		}
	
}

