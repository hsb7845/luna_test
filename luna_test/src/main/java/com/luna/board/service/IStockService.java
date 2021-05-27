package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.dtos.StockDTO;

public interface IStockService {

	List<StockDTO> getAllList();
	boolean insertStock(StockDTO dto);
	StockDTO getStock(int pnum);
	boolean deleteStock(int pnum);
	boolean updateStock(StockDTO dto);
	boolean mulDel(String[] chk);
	boolean stockInsert(StockDTO dto);
	int getCnum(PCategoryDTO cdto);
	List<PCategoryDTO> getColor(String ptype);	
	List<String> getPtype();
	List<PCategoryDTO> getSize(String ptype);
	List<StockDTO> getSelectedList(String[] chk_arr);
}
