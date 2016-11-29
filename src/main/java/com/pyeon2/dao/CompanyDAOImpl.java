package com.pyeon2.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.domain.Criteria;
import com.pyeon2.vo.CalendarMemoVO;
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.NoticeVO;

@Repository
public class CompanyDAOImpl implements CompanyDAO{

	@Autowired
	private SqlSession session;
	
	private static String namespace="com.pyeon2.mappers.CompanyMapper";
	
	@Override
	public List<ItemVO> orderList() throws Exception {
		return session.selectList(namespace + ".orderList");
	}

	@Override
	public void updateItemCount(ItemVO vo) throws Exception {
		session.update(namespace + ".updateItemCount", vo);
	}

	@Override
	public void odertDelete(ItemVO vo) throws Exception {
		session.delete(namespace + ".odertDelete", vo);
	}

	@Override
	public List<MemberVO> getAdminMember() throws Exception {
		return session.selectList(namespace + ".getAdminMember");
	}

	@Override
	public List<MemberVO> getPSMember(MemberVO Mvo) throws Exception {
		return session.selectList(namespace + ".getPSMember", Mvo);
	}

	@Override
	public void insertAdminMember(MemberVO Mvo) throws Exception {
		session.insert(namespace + ".insertAdminMember", Mvo);
	}

	@Override
	public void insertPosition(MemberVO Mvo) throws Exception {
		session.insert(namespace + ".insertPosition", Mvo);
	}

	@Override
	public List<ItemVO> areaItemList(ItemVO vo) throws Exception {
		return session.selectList(namespace + ".areaItemList", vo);
	}

	@Override
	public List<MemberVO> getMember(MemberVO Mvo) throws Exception {
		return session.selectList(namespace + ".getMember", Mvo);
	}

	@Override
	public void updateMember(MemberVO Mvo) throws Exception {
		session.update(namespace + ".updateMember", Mvo);
	}

	@Override
	public List<MemberVO> getAllMember() throws Exception {
		return session.selectList(namespace + ".getAllMember");
	}

	@Override
	public void deleteMember(MemberVO Mvo) throws Exception {
		session.delete(namespace + ".deleteMember", Mvo);
	}

	@Override
	public void deleteRole(MemberVO Mvo) throws Exception {
		session.delete(namespace + ".deleteMember", Mvo);
	}
	
	@Override
	public List<ComItemVO> comItemListAll(Criteria cri) throws Exception {
		return session.selectList(namespace + ".comItemListAll", cri);
	}

	@Override
	public List<ComItemVO> comItemList(ComItemVO vo) throws Exception {
		return session.selectList(namespace + ".comItemList", vo);
	}

	@Override
	public void orderUpdate(ItemVO vo) throws Exception {
		session.update(namespace+ ".orderUpdate", vo);
	}

	@Override
	public int getAreaCount(ItemVO vo) throws Exception {
		return session.selectOne(namespace + ".getAreaCount", vo);
	}

	@Override
	public int getComItemCount() throws Exception {
		return session.selectOne(namespace + ".getComItemCount");
	}

	@Override
	public int getComItemCountCategory(String category) throws Exception {
		return session.selectOne(namespace + ".getComItemCountCategory", category);
	}

	@Override
	public void updateOrderState(ItemVO vo) throws Exception {
		session.update(namespace + ".updateOrderState", vo);
	}
	
	@Override
	public List<NoticeVO> getnoticelist(NoticeVO Nvo) throws Exception {
		return session.selectList(namespace+".getnoticelist", Nvo);
	}

	@Override
	public void noticewrite(NoticeVO Nvo) throws Exception {
		session.insert(namespace+".noticewrite", Nvo);
	}

	@Override
	public List<NoticeVO> getnoticecontant(NoticeVO Nvo) throws Exception {
		return session.selectList(namespace+".getnoticecontant",Nvo);
	}

	@Override
	public void noticeupdate(NoticeVO Nvo) throws Exception {
		session.update(namespace+".noticeupdate",Nvo);
	}

	@Override
	public void noticedelete(NoticeVO Nvo) throws Exception {
		session.delete(namespace+".noticedelete",Nvo);
	}
	
	@Override
	public List<NoticeVO> getNotConfirm() throws Exception {
		return session.selectList(namespace + ".getNotConfirm");
	}

	@Override
	public int getNotConfirmCount() throws Exception {
		return session.selectOne(namespace + ".getNotConfirmCount");
	}

	@Override
	public void calendarMemoInsert(CalendarMemoVO vo) throws Exception {
		session.update(namespace + ".calendarMemoInsert", vo);
	}

	@Override
	public List<CalendarMemoVO> calendarMemoList(CalendarMemoVO vo) throws Exception {
		return session.selectList(namespace + ".calendarMemoList", vo);
	}

	@Override
	public List<CalendarMemoVO> calendarMemoSelect(CalendarMemoVO vo) throws Exception {
		return session.selectList(namespace + ".calendarMemoSelect", vo);
	}

	@Override
	public void calendarMemoDelete(CalendarMemoVO vo) throws Exception {
		session.delete(namespace + ".calendarMemoDelete", vo);
	}

	@Override
	public String getNoticeCount(NoticeVO nvo) throws Exception {
		return session.selectOne(namespace + ".getNoticeCount", nvo);
	}
	
	@Override
	public String newproductcode1(ComItemVO cvo) throws Exception {
		return session.selectOne(namespace+".newproductcode1",cvo);
	}

	@Override
	public int newproductcode2(ComItemVO cvo) throws Exception {
		return session.selectOne(namespace+".newproductcode2",cvo);
	}
	
	@Override
	public void newproduct(ComItemVO cvo) throws Exception {
		session.insert(namespace + ".newproduct",cvo);
	}

	@Override
	public List<ItemVO> newproductarea() throws Exception {
		return session.selectList(namespace+".newproductarea");
	}

	@Override
	public void newproductareainsert(ItemVO vo) throws Exception {
		session.insert(namespace+".newproductareainsert" , vo);
	}

}
