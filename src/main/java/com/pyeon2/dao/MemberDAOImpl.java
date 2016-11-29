package com.pyeon2.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.UserVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.pyeon2.mappers.MemberMapper";

	@Override
	public MemberVO getMember(String id) throws Exception {

		MemberDAO memberDAO = session.getMapper(MemberDAO.class);
		return memberDAO.getMember(id);
	}

	@Override
	public void userstart(UserVO vo) throws Exception {
		session.update(namespace + ".userstart", vo);
	}

	@Override
	public void userfinsh(UserVO vo) throws Exception {
		session.update(namespace + ".userfinsh", vo);
	}

	@Override
	public void userinsertmoney(MemberVO Mvo) throws Exception {
		session.insert(namespace+".userinsertmoney",Mvo);
	}

	@Override
	public MemberVO checkId(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".checkId", vo);
	}
	
	@Override
	public List<MemberVO> getname(MemberVO Mvo) throws Exception {
		return session.selectList(namespace+".getname",Mvo);
	}

}
