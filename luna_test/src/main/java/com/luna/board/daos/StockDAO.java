package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.PCategoryDTO;
import com.luna.board.dtos.StockDTO;

@Repository
public class StockDAO implements IStockDAO {
	private String namespace = "com.luna.stock.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String[] chks;

	@Override
	public boolean insertStock(StockDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"insertStock",dto)>0?true:false;
	}

	@Override
	public List<StockDTO> getAllList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getAllList");
	}

	@Override
	public StockDTO getStock(int pnum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getStock",pnum);
	}
	
	@Override
	public boolean deleteStock(int pnum) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteStock",pnum)>0?true:false;
	}

	@Override
	public boolean updateStock(StockDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateStock",dto)>0? true:false;
	}

	@Override
	public boolean mulDel(String[] chks) {
		// TODO Auto-generated method stub
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}

	@Override
	public boolean stockInsert(StockDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"insertStock",dto)>0?true:false;
	}

	@Override
	public int getCnum(PCategoryDTO cdto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getCnum",cdto);
	}
	
	
}
