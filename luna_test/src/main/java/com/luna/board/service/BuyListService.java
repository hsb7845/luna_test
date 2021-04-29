package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IBuyListDAO;
import com.luna.board.dtos.BuyListDTO;

@Service
public class BuyListService implements IBuyListService {
	
	
	
	@Autowired
	private IBuyListDAO buyListDAO;
	
	@Override
	public boolean insertBoard(BuyListDTO dto) {
		// TODO Auto-generated method stub
		return buyListDAO.insertBoard(dto);
	}

	@Override
	public List<BuyListDTO> getAllList() {
		// TODO Auto-generated method stub
		return buyListDAO.getAllList();
	}

	@Override
	public BuyListDTO getBoard(int bseq) {
		// TODO Auto-generated method stub
		return buyListDAO.getBoard(bseq);
	}

	@Override
	public boolean deleteBoard(int bseq) {
		// TODO Auto-generated method stub
		return buyListDAO.deleteBoard(bseq);
	}

	@Override
	public boolean updateBoard(BuyListDTO dto) {
		// TODO Auto-generated method stub
		return buyListDAO.updateBoard(dto);
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		return buyListDAO.mulDel(chk);
	}
	
}
