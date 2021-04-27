package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.StockDTO;

public interface IStockService {

	List<StockDTO> getAllList();
	boolean insertStock(StockDTO dto);
	StockDTO getStock(int pnum);
	boolean deleteStock(int pnum);
	boolean updateStock(StockDTO dto);
	boolean mulDel(String[] chk);

	
}
