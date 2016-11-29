package com.pyeon2.dao;

import java.util.List;

import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.UserVO;

public interface MemberDAO {

	// 로그인 메소드
	public MemberVO getMember(String id) throws Exception;

	// 로그인 시 출근처리(알바만) 메소드
	public void userstart(UserVO vo) throws Exception;

	// 로그아웃 시 퇴근처리(알바만) 메소드
	public void userfinsh(UserVO vo) throws Exception;

	// 로그아웃 시 출/퇴근 시간 계산하여 일급 계산 메소드
	public void userinsertmoney(MemberVO Mvo) throws Exception;
	
	// 로그아웃 시 일급 계산 저장 시 지점을 찾아주는 메소드
	public MemberVO checkId(UserVO vo) throws Exception;
	
	// 글쓰기시 글쓴이 이름 , position 가졍오는 메소드
	public List<MemberVO> getname(MemberVO Mvo) throws Exception;
}
