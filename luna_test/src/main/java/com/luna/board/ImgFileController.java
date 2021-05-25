package com.luna.board;

import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.luna.board.dtos.ImgFileDTO;
import com.luna.board.service.IImgFileService;

@Controller
public class ImgFileController {

	@Autowired
	private IImgFileService imgFileService;
	
	
	@RequestMapping(value = "/imgfile.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String imgfile(Locale locale, Model model) {
		List<ImgFileDTO> list = imgFileService.getAllList();
		model.addAttribute("list",list);
		
		return "imgfilelist";
	}
	
	@RequestMapping(value = "/insertimgfileform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertboard(Locale locale, Model model) {

		return "imgfileinsertform";
	}
	
	
	
//	@RequestMapping(value = "/uploadimgfile.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String insert(MultipartHttpServletRequest request,Locale locale, Model model) {
//		boolean isS = imgFileService.insertBoard(request);
//		if(isS) {
//			return "redirect:imgfile.do";
//		} else {
//			model.addAttribute("msg", "이미지 파일 추가를 실패하였습니다.");
//			return "error";
//		}
//	}
	
	
//	@RequestMapping(value = "/updateimgfileForm.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String updateboard(Locale locale, Model model,int imgnum) {
//		ImgFileDTO dto = imgFileService.getBoard(imgnum);
//		System.out.println("filesize"+dto.getFilesize());
//		model.addAttribute("dto", dto);
//		return "imgfileupdateform";
//	}
//
//	@RequestMapping(value = "/updateimgfile.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String update(Locale locale, Model model, ImgFileDTO dto) {
//		boolean isS = imgFileService.updateBoard(dto);
//		if(isS) {
//			return "redirect:imgfile.do";
//		} else {
//			model.addAttribute("msg","이미지 파일 수정을 실패하였습니다.");
//			return "error";
//		}

//	}
	
	@RequestMapping(value = "/muldelImgfile.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String muldel(Locale locale, Model model, String[] chk) {
		boolean isS = imgFileService.mulDel(chk);
		if(isS) {
			return "redirect:imgfile.do";
		} else {
			model.addAttribute("msg","이미지 파일 수정을 실패하였습니다.");
			return "error";
		}

	}
	
	
	@RequestMapping(value = "/download.do", method = {RequestMethod.GET,RequestMethod.POST})
	public void download(Locale locale, Model model,int imgnum,HttpServletResponse response,HttpServletRequest request) throws Exception{
		ImgFileDTO dto = imgFileService.getBoard(imgnum);
		String imgname = dto.getImgname();
		String path = request.getSession()
				.getServletContext().getRealPath("upload");
		byte[] fileByte = FileUtils.readFileToByteArray(new File(path+"/"+imgname));
		response.reset();
		response.setContentType("application/octet-steam");
		String encoding = new String(imgname.getBytes("utf-8"),"8859_1");
		response.setHeader("Content-Disposition", "attachment; filename="+encoding);
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
