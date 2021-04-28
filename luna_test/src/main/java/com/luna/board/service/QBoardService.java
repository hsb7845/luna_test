package com.luna.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.board.daos.IQBoardDAO;
import com.luna.board.dtos.QBoardDTO;

@Service
public class QBoardService implements IQBoardService {
	
	@Autowired
	IQBoardDAO QBoardDAO;
	
	@Override
	public boolean insertBoard(QBoardDTO dto) {
		return QBoardDAO.insertBoard(dto);
	}
	
	@Override
	public List<QBoardDTO> getAllList() {
		return QBoardDAO.getAllList();
	}

	
	@Override
	public QBoardDTO getBoard(int qseq) {
		return QBoardDAO.getBoard(qseq);
	}
	
	@Override
	public boolean deleteBoard(int qseq) {
		return QBoardDAO.deleteBoard(qseq);
	}

	@Override
	public boolean updateBoard(QBoardDTO dto) {
		return QBoardDAO.updateBoard(dto);
	}

	@Override
	public boolean mulDel(String[] chk) {
		return QBoardDAO.mulDel(chk);
	}
}
