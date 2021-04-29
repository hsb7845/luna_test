package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.ImgFileDTO;

public interface IImgFileService {

	List<ImgFileDTO> getAllList();

	boolean insertBoard(ImgFileDTO dto);

	ImgFileDTO getBoard(int imgnum);

	boolean updateBoard(ImgFileDTO dto);

	boolean mulDel(String[] chk);

	boolean deleteBoard(int imgnum);

}
