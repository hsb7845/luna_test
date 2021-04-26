package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IPBoardDAO;
import com.luna.board.dtos.PBoardDTO;

@Service
public class PBoardService implements IPBoardService{

	@Autowired
	IPBoardDAO pBoardDAO;


	@Override
	public boolean insertBoard(PBoardDTO dto) {
		// TODO Auto-generated method stub
		return pBoardDAO.insertBoard(dto);
	}


	@Override
	public List<PBoardDTO> getAllList() {
		// TODO Auto-generated method stub
		return pBoardDAO.getAllList();
	}


}
