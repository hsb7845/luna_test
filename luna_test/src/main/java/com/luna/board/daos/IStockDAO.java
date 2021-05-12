package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.dtos.StockDTO;

public interface IStockDAO {

	List<StockDTO> getAllList();
	boolean insertStock(StockDTO dto);
	StockDTO getStock(int pnum);
	boolean deleteStock(int pnum);
	boolean updateStock(StockDTO dto);
	boolean mulDel(String[] chk);
	boolean stockInsert(StockDTO dto);
	int getCnum(PCategoryDTO cdto);

}
