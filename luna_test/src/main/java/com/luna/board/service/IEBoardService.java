package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.EBoardDTO;

public interface IEBoardService {

	boolean insertBoard(EBoardDTO dto);

	List<EBoardDTO> getAllList();
	
	EBoardDTO getBoard(int eseq);
	
	boolean deleteBoard(int eseq);

	boolean updateBoard(EBoardDTO dto);

	boolean mulDel(String[] chk);

}
