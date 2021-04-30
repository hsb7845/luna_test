package com.luna.board.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.luna.board.daos.IImgFileDAO;
import com.luna.board.dtos.ImgFileDTO;

@Service
public class ImgFileService implements IImgFileService {

	@Autowired
	IImgFileDAO ImgFileDAO;
	
	@Override
	public boolean insertBoard(HttpServletRequest request) {
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		MultipartFile multiFile =multi.getFile("imgname");
		
		String imgname = multiFile.getOriginalFilename();
		int fileSize = (int)multiFile.getSize();
		
		String path2="/upload";
		System.out.println(path2);
		File f = new File(path2+"/"+imgname);
		
		boolean isS =false;
		try {
			multiFile.transferTo(f);
			isS=ImgFileDAO.insertBoard(new ImgFileDTO(0,fileSize,imgname,"",0,0,0));
		}catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isS;
	}
	
	@Override
	public List<ImgFileDTO> getAllList() {
		return ImgFileDAO.getAllList();
	}

	
	@Override
	public ImgFileDTO getBoard(int imgnum) {
		return ImgFileDAO.getBoard(imgnum);
	}
	
	@Override
	public boolean deleteBoard(int imgnum) {
		return ImgFileDAO.deleteBoard(imgnum);
	}

	@Override
	public boolean updateBoard(ImgFileDTO dto) {
		return ImgFileDAO.updateBoard(dto);
	}

	@Override
	public boolean mulDel(String[] chk) {
		return ImgFileDAO.mulDel(chk);
	}
}
