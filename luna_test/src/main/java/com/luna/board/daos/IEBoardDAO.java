package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.EBoardDTO;

public interface IEBoardDAO {

	boolean insertBoard(EBoardDTO dto);

	List<EBoardDTO> getAllList();

	EBoardDTO getBoard(int eseq);

	boolean deleteBoard(int eseq);

	boolean updateBoard(EBoardDTO dto);

	boolean mulDel(String[] chks);

}
