package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.PBoardDTO;

@Repository
public class PBoardDAO implements IPBoardDAO{	

	private String namespace = "com.luna.pboard.";

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

	@Override
	public PBoardDTO getBoard(int pseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getBoard",pseq);
	}

	@Override
	public boolean deleteBoard(int pseq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteBoard",pseq)>0?true:false;
	}

	@Override
	public boolean updateBoard(PBoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateBoard",dto)>0? true:false;
	}

	@Override
	public boolean mulDel(String[] chks) {
		// TODO Auto-generated method stub
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}
}