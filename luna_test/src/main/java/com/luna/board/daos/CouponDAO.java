package com.luna.board.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luna.board.dtos.CartDTO;
import com.luna.board.dtos.CouponDTO;

@Repository
public class CouponDAO implements ICouponDAO {
	private String namespace = "com.luna.coupon.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String[] chks;
	
	@Override
	public List<CouponDTO> getAllList(CouponDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getAllList", dto);
	}

//	@Override
//	public boolean insertCoupon(CouponDTO dto) {
//		// TODO Auto-generated method stub
//		return sqlSession.insert(namespace+"insertCoupon",dto)>0?true:false;
//	}
	
	@Override
	public boolean insertCoupon(List<CouponDTO> list) {
		boolean isS =false;
		for(int i=0;i<list.size();i++) {
			CouponDTO dto = list.get(i);
			isS =sqlSession.insert(namespace+"insertCoupon",dto)>0?true:false;
		}
		return isS;
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
	public boolean hitCoupon(CouponDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"hitCoupon", dto)>0?true:false;
	}

	@Override
	public boolean mulDel(String[] chks) {
		// TODO Auto-generated method stub
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("chks", chks);
		return sqlSession.delete(namespace+"mulDel",map)>0?true:false;
	}

	@Override
	public CouponDTO ringCoupon(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"ringCoupon",id);
	}

	@Override
	public boolean insertAllCoup(CouponDTO dto) {
		return sqlSession.insert(namespace+"insertAllCoup",dto)>0?true:false;
	}

	@Override
	public boolean insertEveryCoup(String [] chk) {
		return sqlSession.insert("com.luna.member.insertEveryCoup",chk)>0?true:false;
	}



//	@Override
//	public List<CouponDTO> getAllList(String id) {
//		// TODO Auto-generated method stub
//		return null;
//	}

//	@Override
//	public boolean insertCoupon(String[] id) {
//		// TODO Auto-generated method stub
//		return false;
//	}

//	@Override
//	public boolean insertCoupon(Object dto) {
//		// TODO Auto-generated method stub
//		return false;
//	}

//	@Override
//	public boolean insertEveryCoup(CouponDTO dto) {
//		// TODO Auto-generated method stub
//		return false;
//	}

//	@Override
//	public boolean insertCoupon(String[] id) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean insertCoupon(Object dto) {
//		// TODO Auto-generated method stub
//		return false;
//	}
	
	
	
	
//	@Override
//	public List<CouponDTO> getAllList(String id) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
