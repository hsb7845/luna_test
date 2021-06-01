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
	public List<CartDTO> getAllList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getAllList",id);
	}

	@Override
	public boolean insertCart(List<CartDTO> list) {
		// TODO Auto-generated method stub
		boolean isS =false;
		System.out.println("오니?");
		for(int i=0;i<list.size();i++) {
			int chk = 0;
			int pcount = 0;
			CartDTO dto = list.get(i);
			chk = sqlSession.selectOne(namespace+"countCart", dto);
			if(chk>=1) {
				pcount = sqlSession.selectOne(namespace+"getPcount", dto);
				dto.setPcount(pcount+1);
				isS = sqlSession.update(namespace+"updateCart2", dto)>0?true:false;
				
			}else {
				isS = sqlSession.insert(namespace+"insertCart",dto)>0?true:false;
			}
			
		}
		return isS;
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
