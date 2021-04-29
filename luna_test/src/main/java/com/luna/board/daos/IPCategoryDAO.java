package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.PCategoryDTO;

public interface IPCategoryDAO {

	boolean insertBoard(PCategoryDTO dto);

	List<PCategoryDTO> getAllList();

	PCategoryDTO getBoard(int cnum);

	boolean deleteBoard(int cnum);

	boolean updateBoard(PCategoryDTO dto);

	boolean mulDel(String[] chks);

}
