package com.luna.board.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.PBoardDTO;

@Repository
public class PBoardDAO implements IPBoardDAO{

	private String namespace = "com.hk.board.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public boolean insertBoard(PBoardDTO dto) {
		return sqlSession.insert(namespace+"insertboard",dto)>0? true:false;
	}

	@Override
	public List<PBoardDTO> getAllList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getAllList");
	}
}