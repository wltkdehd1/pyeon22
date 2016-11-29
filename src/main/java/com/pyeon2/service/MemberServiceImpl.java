package com.pyeon2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.dao.MemberDAO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.UserVO;

@Repository
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memDao;

	@Override
	public MemberVO getMember(String id) throws Exception {
		return memDao.getMember(id);
	}

	@Override
	public void userstart(UserVO vo) throws Exception {
		memDao.userstart(vo);
	}

	@Override
	public void userfinsh(UserVO vo) throws Exception {
		memDao.userfinsh(vo);
	}

	@Override
	public void userinsertmoney(MemberVO Mvo) throws Exception {
		memDao.userinsertmoney(Mvo);
	}

	@Override
	public MemberVO checkId(UserVO vo) throws Exception {
		return memDao.checkId(vo);
	}
	
	@Override
	public List<MemberVO> getname(MemberVO Mvo) throws Exception {
		return  memDao.getname(Mvo);
	}

}
