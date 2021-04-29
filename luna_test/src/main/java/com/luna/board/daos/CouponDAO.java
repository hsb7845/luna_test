package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.CouponDTO;

@Repository
public class CouponDAO implements ICouponDAO {
	private String namespace = "com.luna.coupon.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String[] chks;
	
	@Override
	public List<CouponDTO> getAllList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getAllList");
	}

	@Override
	public boolean insertCoupon(CouponDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"insertCoupon",dto)>0?true:false;
	}

	@Override
	public CouponDTO getCoupon(int cseq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getCoupon",cseq);
	}

	@Override
	public boolean deleteCoupon(int cseq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"deleteCoupon", cseq)>0?true:false;
	}

	@Override
	public boolean updateCoupon(CouponDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateCoupon", dto)>0?true:false;
	}

	@Override
	public boolean mulDel(String[] chk) {
		// TODO Auto-generated method stub
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}

}
