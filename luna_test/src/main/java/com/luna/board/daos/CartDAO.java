package com.luna.board.daos;

import java.util.List;

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


}
