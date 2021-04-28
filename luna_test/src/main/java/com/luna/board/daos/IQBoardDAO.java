package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.QBoardDTO;

public interface IQBoardDAO {

	boolean insertBoard(QBoardDTO dto);

	List<QBoardDTO> getAllList();

	QBoardDTO getBoard(int qseq);

	boolean deleteBoard(int qseq);

	boolean updateBoard(QBoardDTO dto);

	boolean mulDel(String[] chks);


}
