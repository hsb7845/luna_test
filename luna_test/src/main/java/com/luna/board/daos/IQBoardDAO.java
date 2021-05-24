package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.QBoardDTO;
import com.luna.board.dtos.RBoardDTO;

public interface IQBoardDAO {

	boolean insertBoard(QBoardDTO dto);

	List<QBoardDTO> getAllList();

	QBoardDTO getBoard(int qseq);

	boolean deleteBoard(int qseq);

//	boolean updateBoard(QBoardDTO dto);

	boolean mulDel(String[] chks);

	boolean insertReply(QBoardDTO dto);
}
