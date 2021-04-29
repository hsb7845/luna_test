package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.CartDTO;


@Repository
	public class CartDAO implements ICartDAO {
		private String namespace = "com.luna.cart.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String[] chks;
	
	@Override
	public List<CartDTO> getAllList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getAllList");
	}

	@Override
	public boolean insertCart(CartDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"insertCart",dto)>0?true:false;
	}

	@Override
	public CartDTO getCart(int seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getCart",seq);
	}

	@Override
	public boolean updateCart(CartDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateCart", dto)>0?true:false;
	}
	
	@Override
	public boolean deleteCart(int seq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteCart", seq)>0?true:false;
	}

	@Override
	public boolean mulDel(String[] chks) {
		// TODO Auto-generated method stub
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}
}
