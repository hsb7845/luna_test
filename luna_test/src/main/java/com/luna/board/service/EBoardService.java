package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IEBoardDAO;
import com.luna.board.dtos.EBoardDTO;

@Service
public class EBoardService implements IEBoardService {

	@Autowired
	IEBoardDAO EBoardDAO;
	
	@Override
	public boolean insertBoard(EBoardDTO dto) {
		return EBoardDAO.insertBoard(dto);
	}

	@Override
	public List<EBoardDTO> getAllList() {
		return EBoardDAO.getAllList();
	}

	@Override
	public EBoardDTO getBoard(int eseq) {
		return EBoardDAO.getBoard(eseq);
	}

	@Override
	public boolean deleteBoard(int eseq) {
		return EBoardDAO.deleteBoard(eseq);
	}

	@Override
	public boolean updateBoard(EBoardDTO dto) {
		return EBoardDAO.updateBoard(dto);
	}

	@Override
	public boolean mulDel(String[] chk) {
		return EBoardDAO.mulDel(chk);
	}

}
