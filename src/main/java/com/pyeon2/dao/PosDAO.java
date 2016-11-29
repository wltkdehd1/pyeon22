package com.pyeon2.dao;

import java.util.List;

import com.pyeon2.domain.Criteria;
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.NoticeVO;
import com.pyeon2.vo.SelectSearch;
import com.pyeon2.vo.UserVO;

public interface PosDAO {
	// 발주 신청 임시 저장 메소드
	public void insertOrderTemp(ItemVO vo) throws Exception;

	// 발주 신청 메소드
	public void insertOrder(ItemVO vo) throws Exception;

	// 발주 신청 개수 변경
	public void updateOrderTemp(ItemVO vo) throws Exception;

	// 물품(재고) 전체 리스트 출력 메소드
	public List<ItemVO> getList(ItemVO vo) throws Exception;

	// 물품(재고) 이름으로 검색하여 리스트 출력 메소드
	public List<ItemVO> selectName(SelectSearch ss) throws Exception;

	// 물품(재고) 제거 메소드
	public void Delete(ItemVO vo) throws Exception;

	// 알바 일했던시급
	public List<UserVO> selectalpayAll(UserVO vo) throws Exception;

	// 알바 날짜 선택 시급
	public List<UserVO> selectalpay(UserVO vo) throws Exception;

	// 알바 일했던시급
	public List<UserVO> selectmanpayAll(UserVO vo) throws Exception;

	// 알바 날짜 선택 시급
	public List<UserVO> selectmanpay(UserVO vo) throws Exception;

	// 물품(재고) 몰룍 수
	public int getCount(ItemVO vo);

	// 물품(재고) 선택된 물품 수
	public int getSelectCount(ItemVO vo);

	// 물품(재고) 선택된 물품 수 상품명 null일 경우
	public int getSelectCount2(ItemVO vo);

	// 아르바이트 리스트 불러오기
	public List<MemberVO> selectUser(MemberVO Mvo) throws Exception;

	// 아르바이트 리스트 불러오기 (id만 받아와서)
	public List<MemberVO> selectUserId(MemberVO Mvo) throws Exception;

	// 아르바이트생 정보 수정하기
	public void updateUser(MemberVO Mvo) throws Exception;

	// 아르바이트생 정보 삭제하기
	public void deleteUser(MemberVO Mvo) throws Exception;

	// 아르바이트생 권한 삭제하기
	public void deleteRole(MemberVO Mvo) throws Exception;

	// 아르바이트생 p2_user 테이블 정보 삭제
	public void deleteUserTime(UserVO vo) throws Exception;

	// 아르바이트생 정보 입력
	public void insertUser(MemberVO Mvo) throws Exception;

	// 입력된 정보를 바탕으로 권한 자동으로 주기
	public void insertPosition(MemberVO Mvo) throws Exception;

	// 아르바이트생 등록 시 월급 계산을 위해 p2_user 테이블에 처음 등록하기
	public void insertUserTime(UserVO vo) throws Exception;

	// 계산 리스트
	public List<ItemVO> calcList() throws Exception;

	// 계산 리스트 뿌리기
	public List<ItemVO> calcLists(ItemVO vo) throws Exception;

	// 계산 insert
	public void calcinsert(ItemVO vo) throws Exception;

	// count 추가 & price 올리기
	public void clacupdate(ItemVO vo) throws Exception;

	// 찍힌 price 총합
	public int totalcalc(ItemVO vo) throws Exception;

	// sal테이블에 시간,가격,계산 번호 입력
	public void salinsert(ItemVO vo) throws Exception;

	// 계산된 리스트를 저장(계산번호 추가)
	public void daycalcinser(ItemVO vo) throws Exception;

	// 계산된 리스트 삭제
	public void calcdelete(ItemVO vo) throws Exception;

	// 계산된 count만큼 item테이블에서 hit올라감
	public void hitupdate(ItemVO vo) throws Exception;

	// area 가져오기
	public String areaserch(ItemVO vo) throws Exception;

	// 본사 재고 리스트
	public List<ComItemVO> getCompanyList(Criteria cri);

	// 본사 재고 물품 수
	public int getCompanyCount();

	// 2016-11-15
	// 지접장의 지점
	public String getArea(String name);

	// 발주 신청 임시저장 리스트
	public List<ItemVO> orderTempList(Criteria cri);

	// 발주 신청 리스트 개수
	public int orderTempCount();

	// 발주 신청 임시저장 리스트에서 item_code, area 리스트
	public List<ItemVO> orderTempCompare();

	// 발주 신청 임시저장 리스트 삭제
	public void orderTempDelete(ItemVO vo);

	// 발주 신청 임시저장 리스트 전체 삭제
	public void orderTempDeleteAll();

	// 이미 발주 신청된 리스트
	public List<ItemVO> selectAlreadyOrderedList();

	// 발주 비용
	public void orderSpend(ItemVO vo);

	// 발주 신청 리스트 입력
	public void orderInsert(ItemVO vo) throws Exception;

	// 발주 현황 리스트
	public List<ItemVO> getStateList(ItemVO vo) throws Exception;
	

	// 발주 현황 삭제
	public void deleteOrder(ItemVO vo) throws Exception;

	//아이템별 가격
	public int getPrice(ItemVO vo);
	
	//orderSpend sequence 추출
	public int getSpendSequence(ItemVO vo);
	
	// 발주 비용 계산전 임시로 컬럼 생성
	public void orderSpendTemp(ItemVO vo);

	// 일일 수익 가져오기
	public List<ItemVO> sallist(ItemVO vo) throws Exception;

	// 일일 지출 가져오기
	public List<ItemVO> orderSpendlist(ItemVO vo) throws Exception;

	// 일일 정산 입력
	public void daymoneyinsert(ItemVO vo) throws Exception;

	// 일일 정산 리스트 가져오기
	public List<ItemVO> daymoneylist(ItemVO vo) throws Exception;

	// sal 삭제
	public void daysaldelete(ItemVO vo) throws Exception;

	// orderSpend 삭제
	public void dayspenddelete(ItemVO vo) throws Exception;

	// sal 총액
	public List<ItemVO> daysaltotalpay(ItemVO vo) throws Exception;

	// spend 총액
	public List<ItemVO> daysalspendpay(ItemVO vo) throws Exception;
	
	//daymoney의 총 컬럼 수
	public String daymoneyCount(ItemVO vo) throws Exception;
	
	// 메인 페이지에 공지사항 최근 5개글 띄우기
	public List<NoticeVO> getNoticeList() throws Exception;
	
	// 재고 10개 미만인 물건 불러오기
	public List<ItemVO> getLessItem(MemberVO Mvo) throws Exception;
	
	// 재고 10개 미만인 물건 카운트
	public int getLessItemCount(MemberVO Mvo) throws Exception;
	
	//영수증 넘버와 비교
	public List<ItemVO> daycalclist(ItemVO vo) throws Exception;
	
	//환불 목록 삭제
	public void daycalclistdelete(ItemVO vo) throws Exception;
	
	//daymoney 리스트 가져와 비교 
	public List<ItemVO> daymoneyselect() throws Exception;
	
	//sal 번호로 지우기
	public void saldeletenum(ItemVO vo) throws Exception;

	//daymoney 번호로 지우기
	public void daymoneydeletenum(ItemVO vo) throws Exception;
	
	//p2_item hit&count업데이트
	public void itemupdate(ItemVO vo) throws Exception;
	
	// 지점장 본인 정보 수정하기
	public void updateManager(MemberVO Mvo) throws Exception;
}
