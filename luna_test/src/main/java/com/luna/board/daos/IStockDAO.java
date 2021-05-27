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
	List<PCategoryDTO> getColor(String ptype);
//	             반환타입                       메서드에 전달하는 값의 타입(파라미터)
	List<String> getPtype();
	List<PCategoryDTO> getSize(String ptype);
	List<StockDTO> getSelectedList(String[] chk_arr);
	List<PCategoryDTO> getCnum(int cnum);
}
