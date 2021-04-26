package com.luna.board.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.PBoardDTO;

@Repository
public class PBoardDAO implements IPBoardDAO{
<<<<<<< HEAD

	private String namespace = "com.hk.board.";

	@Autowired
	private SqlSessionTemplate sqlSession;

=======
	
	private String namespace = "com.luna.board.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
>>>>>>> branch 'main' of https://github.com/hsb7845/luna_test.git
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
