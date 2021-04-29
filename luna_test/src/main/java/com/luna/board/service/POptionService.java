package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IPOptionDAO;
import com.luna.board.dtos.POptionDTO;

@Service
public class POptionService implements IPoptionService {

	@Autowired
	IPOptionDAO POptionDAO;
	
	
	@Override
	public List<POptionDTO> getAllList() {
		return POptionDAO.getAllList();
		// TODO Auto-generated method stub
	}

	@Override
	public boolean insertPoption(POptionDTO dto) {
		// TODO Auto-generated method stub
		return POptionDAO.insertPoption(dto);
	}

	@Override
	public POptionDTO getPoption(int oseq) {
		// TODO Auto-generated method stub
		return POptionDAO.getPoption(oseq);
	}

	@Override
	public boolean updatePoption(POptionDTO dto) {
		// TODO Auto-generated method stub
		return POptionDAO.updatePoption(dto);
	}

	@Override
	public boolean mulDel(String[] chks) {
		// TODO Auto-generated method stub
		return POptionDAO.mulDelPoption(chks);
	}

}
