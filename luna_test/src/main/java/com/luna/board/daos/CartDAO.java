package com.luna.board.daos;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
	public class CartDAO {
		private String namespace = "com.luna.cart.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;


}
