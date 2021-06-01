package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.EBoardDTO;
import com.luna.board.dtos.ImgFileDTO;
import com.luna.board.dtos.PagingDTO;

public interface IEBoardDAO {

	boolean insertBoard(EBoardDTO dto);

	List<EBoardDTO> getAllList();

	EBoardDTO getBoard(int eseq);

	boolean deleteBoard(int eseq);

	boolean updateBoard(EBoardDTO dto);

	boolean mulDel(String[] chks);

	boolean insertImg(ImgFileDTO imgFileDTO);

	boolean updateImg(ImgFileDTO imgFileDTO);

	List<EBoardDTO> getPagingList(PagingDTO pagingDTO, String board);

	int countBoard();

	EBoardDTO getDetail(int eseq, String board);

}
