package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IPCategoryDAO;
import com.luna.board.dtos.PCategoryDTO;

@Service
public class PCategoryService implements IPCategoryService {

	@Autowired
	IPCategoryDAO PCategoryDAO;
	
	@Override
	public boolean insertBoard(PCategoryDTO dto) {
		return PCategoryDAO.insertBoard(dto);
	}

	@Override
	public List<PCategoryDTO> getAllList() {
		return PCategoryDAO.getAllList();
	}

	@Override
	public PCategoryDTO getBoard(int cnum) {
		return PCategoryDAO.getBoard(cnum);
	}

	@Override
	public boolean deleteBoard(int cnum) {
		return PCategoryDAO.deleteBoard(cnum);
	}

	@Override
	public boolean updateBoard(PCategoryDTO dto) {
		return PCategoryDAO.updateBoard(dto);
	}

	@Override
	public boolean mulDel(String[] chk) {
		return PCategoryDAO.mulDel(chk);
	}


	
}
