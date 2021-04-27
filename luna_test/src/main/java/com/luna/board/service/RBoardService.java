package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IRBoardDAO;
import com.luna.board.dtos.PBoardDTO;
import com.luna.board.dtos.RBoardDTO;

@Service
public class RBoardService implements IRBoardService {
	
	@Autowired
	IRBoardDAO RBoardDAO;
	
	@Override
	public boolean insertBoard(RBoardDTO dto) {
		// TODO Auto-generated method stub
		return RBoardDAO.insertBoard(dto);
	}
	
	@Override
	public List<RBoardDTO> getAllList() {
		// TODO Auto-generated method stub
		return RBoardDAO.getAllList();
	}

	
	@Override
	public RBoardDTO getBoard(int rseq) {
		// TODO Auto-generated method stub
		return RBoardDAO.getBoard(rseq);
	}
	
	@Override
	public boolean deleteBoard(int rseq) {
		// TODO Auto-generated method stub
		return RBoardDAO.deleteBoard(rseq);
	}

	@Override
	public boolean updateBoard(RBoardDTO dto) {
		// TODO Auto-generated method stub
		return RBoardDAO.updateBoard(dto);
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		return RBoardDAO.mulDel(chk);
	}
}
