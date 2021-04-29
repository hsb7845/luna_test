package com.luna.board.service;

import java.util.List;

import com.luna.board.dtos.POptionDTO;


public interface IPoptionService {

	List<POptionDTO> getAllList();

	boolean insertPoption(POptionDTO dto);

	POptionDTO getPoption(int qseq);

	boolean updatePoption(POptionDTO dto);


	boolean mulDel(String[] chk);



}
