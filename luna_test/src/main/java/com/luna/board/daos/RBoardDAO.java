package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.PBoardDTO;
import com.luna.board.dtos.RBoardDTO;

@Repository
public class RBoardDAO implements IRBoardDAO {
	
	private String namespace = "com.luna.rboard.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String[] chks;
	
	@Override
	public boolean insertBoard(RBoardDTO dto) {
		return sqlSession.insert(namespace+"insertboard",dto)>0? true:false;
	}

	@Override
	public List<RBoardDTO> getAllList() {
		return sqlSession.selectList(namespace+"getAllList");
	}
	
	@Override
	public RBoardDTO getBoard(int rseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getBoard",rseq);
	}

	@Override
	public boolean deleteBoard(int rseq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteBoard",rseq)>0?true:false;
	}

	@Override
	public boolean updateBoard(RBoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateBoard",dto)>0? true:false;
	}

	@Override
	public boolean mulDel(String[] chk) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}
}
