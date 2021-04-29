package com.luna.board.daos;

import java.util.List;

import com.luna.board.dtos.POptionDTO;

public interface IPOptionDAO {

	List<POptionDTO> getAllList();

	boolean insertPoption(POptionDTO dto);

	POptionDTO getPoption(int oseq);

	boolean updatePoption(POptionDTO dto);

	boolean mulDelPoption(String[] chks);


}

