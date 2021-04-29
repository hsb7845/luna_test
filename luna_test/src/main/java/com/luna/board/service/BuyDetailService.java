package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IBuyDetailDAO;
import com.luna.board.dtos.BuyDetailDTO;

@Service
public class BuyDetailService implements IBuyDetailService{

	@Autowired
	private IBuyDetailDAO buyDetailDAO;
	
	@Override
	public boolean insertBoard(BuyDetailDTO dto) {
		// TODO Auto-generated method stub
		return buyDetailDAO.insertBoard(dto);
	}

	@Override
	public List<BuyDetailDTO> getAllList() {
		// TODO Auto-generated method stub
		return buyDetailDAO.getAllList();
	}

	@Override
	public BuyDetailDTO getBoard(int bdseq) {
		// TODO Auto-generated method stub
		return buyDetailDAO.getBoard(bdseq);
	}

	@Override
	public boolean deleteBoard(int bdseq) {
		// TODO Auto-generated method stub
		return buyDetailDAO.deleteBoard(bdseq);
	}

	@Override
	public boolean updateBoard(BuyDetailDTO dto) {
		// TODO Auto-generated method stub
		return buyDetailDAO.updateBoard(dto);
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		return buyDetailDAO.mulDel(chk);
	}

}
