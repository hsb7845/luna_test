package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.ImgFileDTO;

public interface IImgFileDAO {

	boolean insertBoard(ImgFileDTO dto);

	List<ImgFileDTO> getAllList();

	ImgFileDTO getBoard(int imgnum);

	boolean deleteBoard(int imgnum);

	boolean updateBoard(ImgFileDTO dto);

	boolean mulDel(String[] chks);

}
