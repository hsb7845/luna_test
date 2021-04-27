package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IPBoardDAO;
import com.luna.board.dtos.PBoardDTO;

@Service

public class PBoardService implements IPBoardService{

	@Autowired
	IPBoardDAO PBoardDAO;


	@Override
	public boolean insertBoard(PBoardDTO dto) {
		// TODO Auto-generated method stub
		return PBoardDAO.insertBoard(dto);
	}


	@Override
	public List<PBoardDTO> getAllList() {
		// TODO Auto-generated method stub
		return PBoardDAO.getAllList();
	}
}
