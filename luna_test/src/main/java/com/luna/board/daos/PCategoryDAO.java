package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.PCategoryDTO;

@Repository
public class PCategoryDAO implements IPCategoryDAO {

	private String namespace = "com.luna.pcategory.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public boolean insertBoard(PCategoryDTO dto) {
		return sqlSession.insert(namespace+"insertboard",dto)>0? true:false;
	}

	@Override
	public List<PCategoryDTO> getAllList() {
		return sqlSession.selectList(namespace+"getAllList");
	}
	
	@Override
	public PCategoryDTO getBoard(int cnum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getBoard", cnum);
	}

	@Override
	public boolean deleteBoard(int cnum) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteBoard",cnum)>0?true:false;
	}

	@Override
	public boolean updateBoard(PCategoryDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateBoard",dto)>0? true:false;
	}

	@Override
	public boolean mulDel(String[] chks) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}
}
