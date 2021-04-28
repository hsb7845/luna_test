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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<EBoardDTO> getAllList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EBoardDTO getBoard(int eseq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteBoard(int eseq) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateBoard(EBoardDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		return false;
	}

}
