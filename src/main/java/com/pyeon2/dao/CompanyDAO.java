package com.pyeon2.dao;

import java.util.List;

import com.pyeon2.domain.Criteria;
import com.pyeon2.vo.CalendarMemoVO;
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.NoticeVO;

public interface CompanyDAO {
	// 발주 목록 확인 메소드
	public List<ItemVO> orderList() throws Exception;

	// 발주 승인 시 해당 지점의 재고 갯수 추가해주는 메소드
	public void updateItemCount(ItemVO vo) throws Exception;

	// 발주 승인 후 발주신청 목록 제거 메소드
	public void odertDelete(ItemVO vo) throws Exception;

	// 발주 승인 시 본사 재고 수량 변경
	public void orderUpdate(ItemVO vo) throws Exception;

	// 본사에서 회원 검색했을 때 관리자(admin)와 지점장(manager)만 출력
	public List<MemberVO> getAdminMember() throws Exception;

	// 관리자/지점장 sorting 해서 리스트 출력
	public List<MemberVO> getPSMember(MemberVO Mvo) throws Exception;

	// 관리자/지점장 정보 입력
	public void insertAdminMember(MemberVO Mvo) throws Exception;

	// 입력된 정보를 바탕으로 권한 자동으로 주기
	public void insertPosition(MemberVO Mvo) throws Exception;

	// 지점별 재고 현황(물품) 불러오는 리스트
	public List<ItemVO> areaItemList(ItemVO vo) throws Exception;

	// 아이디별 멤버 정보 불러오는 리스트 (수정하기위함)
	public List<MemberVO> getMember(MemberVO Mvo) throws Exception;

	// 아이디별 멤버 수정
	public void updateMember(MemberVO Mvo) throws Exception;

	// 모든 멤버 리스트 출력
	public List<MemberVO> getAllMember() throws Exception;

	// 멤버 정보 삭제
	public void deleteMember(MemberVO Mvo) throws Exception;

	// 멤버 권한 삭제
	public void deleteRole(MemberVO Mvo) throws Exception;

	// 본사 전체 재고 확인
	public List<ComItemVO> comItemListAll(Criteria cri) throws Exception;

	// 본사 전체 재고 카테고리별 리스트
	public List<ComItemVO> comItemList(ComItemVO vo) throws Exception;

	// 지점별 재고 수
	public int getAreaCount(ItemVO vo) throws Exception;

	// 본사 재고 수
	public int getComItemCount() throws Exception;

	// 카테고리별 본사 재고 수
	public int getComItemCountCategory(String category) throws Exception;

	// 발주 승인,미승인 수정 메소드
	public void updateOrderState(ItemVO vo) throws Exception;
	
	//공지사항 리스트 가져오기
	public List<NoticeVO> getnoticelist(NoticeVO Nvo) throws Exception; 
		
	//동지사항 글쓰기
	public void noticewrite(NoticeVO Nvo) throws Exception;
		
	//공지사항 가져오기
	public List<NoticeVO> getnoticecontant(NoticeVO Nvo) throws Exception;
		
	//공지사항 업데이트
	public void noticeupdate(NoticeVO Nvo) throws Exception;
		
	//공지사항 삭제
	public void noticedelete(NoticeVO Nvo) throws Exception;

	// 메인 페이지에 공지사항 최근 5개글 띄우기
	public List<NoticeVO> getNotConfirm() throws Exception;
	
	// 미승인 건 카운트
	public int getNotConfirmCount() throws Exception;
	
	// 달렵 메모 입력 / 업데이트
	public void calendarMemoInsert(CalendarMemoVO vo) throws Exception;
	
	// 달력 메모 출력
	public List<CalendarMemoVO> calendarMemoList(CalendarMemoVO vo) throws Exception;
	
	// 달력 메모 WriteForm에 띄우기
	public List<CalendarMemoVO> calendarMemoSelect(CalendarMemoVO vo) throws Exception;
	
	// 달력 메모 삭제하기
	public void calendarMemoDelete(CalendarMemoVO vo) throws Exception;
	
	//공지사항 컬럼 수
	public String getNoticeCount(NoticeVO nvo) throws Exception;
	
	//재품 code1 가져오기
	public String newproductcode1(ComItemVO cvo) throws Exception;
		
	//재품 code2 가져오기
	public int newproductcode2(ComItemVO cvo) throws Exception;
	
	//재품 추가
	public void newproduct(ComItemVO cvo) throws Exception;
		
	//지점 검색 해오기
	public List<ItemVO> newproductarea() throws Exception;
		
	//각각지점에 신제품 입력
	public void newproductareainsert(ItemVO vo) throws Exception;
}
