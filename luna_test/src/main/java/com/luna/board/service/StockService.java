package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IStockDAO;
import com.luna.board.dtos.RBoardDTO;
import com.luna.board.dtos.StockDTO;

@Service
public class StockService implements IStockService {
	
	@Autowired
	IStockDAO StockDAO;

	@Override
	public List<StockDTO> getAllList() {
		// TODO Auto-generated method stub
		return StockDAO.getAllList();
	}

	@Override
	public boolean insertStock(StockDTO dto) {
		// TODO Auto-generated method stub
		return StockDAO.insertStock(dto);
	}

	@Override
	public StockDTO getStock(int pnum) {
		// TODO Auto-generated method stub
		return StockDAO.getStock(pnum);
	}
	
	@Override
	public boolean deleteStock(int pnum) {
		// TODO Auto-generated method stub
		return StockDAO.deleteStock(pnum);
	}

	@Override
	public boolean updateStock(StockDTO dto) {
		// TODO Auto-generated method stub
		return StockDAO.updateStock(dto);
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		return StockDAO.mulDel(chk);
	}


	
	
	
	

}
