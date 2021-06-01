package com.luna.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.luna.board.dtos.EBoardDTO;
import com.luna.board.dtos.PagingDTO;
import com.luna.board.dtos.RBoardDTO;

public interface IEBoardService {

	boolean insertBoard(EBoardDTO dto, MultipartHttpServletRequest request);

	List<EBoardDTO> getAllList();
	
	EBoardDTO getBoard(int eseq);
	
	boolean deleteBoard(int eseq);

	boolean updateBoard(EBoardDTO dto, MultipartHttpServletRequest request);

	boolean mulDel(String[] chk);

	List<EBoardDTO> getPagingList(PagingDTO pagingDTO, String board);

	int countBoard();

	EBoardDTO getDetail(int eseq, String board);

}
