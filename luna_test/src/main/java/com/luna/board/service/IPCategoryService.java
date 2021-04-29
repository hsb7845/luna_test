package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.PCategoryDTO;

public interface IPCategoryService {

	boolean insertBoard(PCategoryDTO dto);

	List<PCategoryDTO> getAllList();

	PCategoryDTO getBoard(int cnum);

	boolean updateBoard(PCategoryDTO dto);

	boolean mulDel(String[] chk);

	boolean deleteBoard(int cnum);

}
