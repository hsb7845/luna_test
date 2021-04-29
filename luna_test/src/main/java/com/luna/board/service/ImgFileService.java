package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IImgFileDAO;
import com.luna.board.dtos.ImgFileDTO;

@Service
public class ImgFileService implements IImgFileService {

	@Autowired
	IImgFileDAO ImgFileDAO;
	
	@Override
	public boolean insertBoard(ImgFileDTO dto) {
		return ImgFileDAO.insertBoard(dto);
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
