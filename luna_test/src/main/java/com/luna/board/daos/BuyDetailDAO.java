package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.BuyDetailDTO;

@Repository
public class BuyDetailDAO implements IBuyDetailDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.luna.buydetail.";
	@Override
	public boolean insertBoard(BuyDetailDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"insertBoard", dto)>0?true:false;
	}

	@Override
	public List<BuyDetailDTO> getAllList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getAllList");
	}

	@Override
	public BuyDetailDTO getBoard(int bdseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getBoard", bdseq);
	}

	@Override
	public boolean deleteBoard(int bdseq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteBoard",bdseq)>0?true:false;
	}

	@Override
	public boolean updateBoard(BuyDetailDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateBoard", dto)>0?true:false;
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		Map<String, String[]> map = new HashMap<>();
		map.put("chks",chk);
		return sqlSession.insert(namespace+"mulDelBoard",map)>0?true:false;
	}

}
