package com.pyeon2.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.domain.Criteria;
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.NoticeReplVO;
import com.pyeon2.vo.NoticeVO;
import com.pyeon2.vo.SelectSearch;
import com.pyeon2.vo.UserVO;

@Repository
public class PosDAOImpl implements PosDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.pyeon2.mappers.PosMapper";

	@Override
	public void insertOrderTemp(ItemVO vo) throws Exception {
		session.insert(namespace + ".insertOrderTemp", vo);
	}

	@Override
	public void insertOrder(ItemVO vo) throws Exception {
		session.update(namespace + ".insertOrder", vo);
	}

	@Override
	public List<ItemVO> getList(ItemVO vo) throws Exception {
		return session.selectList(namespace + ".getList", vo);
	}

	@Override
	public List<ItemVO> selectName(SelectSearch ss) throws Exception {
		return session.selectList(namespace + ".selectName", ss);
	}

	@Override
	public void Delete(ItemVO vo) throws Exception {
		session.delete(namespace + ".Delete", vo);
	}

	@Override
	public List<UserVO> selectalpayAll(UserVO vo) throws Exception {
		return session.selectList(namespace + ".selectalpayAll", vo);
	}

	@Override
	public List<UserVO> selectalpay(UserVO vo) throws Exception {
		return session.selectList(namespace + ".selectalpay", vo);
	}

	@Override
	public List<UserVO> selectmanpayAll(UserVO vo) throws Exception {
		return session.selectList(namespace + ".selectmanpayAll", vo);
	}

	@Override
	public List<UserVO> selectmanpay(UserVO vo) throws Exception {
		return session.selectList(namespace + ".selectmanpay", vo);
	}

	@Override
	public int getCount(ItemVO vo) {
		return session.selectOne(namespace + ".getCount", vo);
	}

	@Override
	public int getSelectCount(ItemVO vo) {
		return session.selectOne(namespace + ".getSelectCount", vo);
	}

	@Override
	public List<MemberVO> selectUser(MemberVO Mvo) throws Exception {
		return session.selectList(namespace + ".selectUser", Mvo);
	}

	@Override
	public List<MemberVO> selectUserId(MemberVO Mvo) throws Exception {
		return session.selectList(namespace + ".selectUserId", Mvo);
	}

	@Override
	public void updateUser(MemberVO Mvo) throws Exception {
		session.update(namespace + ".updateUser", Mvo);
	}

	@Override
	public void deleteUser(MemberVO Mvo) throws Exception {
		session.delete(namespace + ".deleteUser", Mvo);
	}

	@Override
	public void deleteRole(MemberVO Mvo) throws Exception {
		session.delete(namespace + ".deleteRole", Mvo);
	}

	@Override
	public void deleteUserTime(UserVO vo) throws Exception {
		session.delete(namespace + ".deleteUserTime", vo);
	}

	@Override
	public void insertUser(MemberVO Mvo) throws Exception {
		session.insert(namespace + ".insertUser", Mvo);
	}

	@Override
	public void insertPosition(MemberVO Mvo) throws Exception {
		session.insert(namespace + ".insertPosition", Mvo);
	}

	@Override
	public void insertUserTime(UserVO vo) throws Exception {
		session.insert(namespace + ".insertUserTime", vo);
	}

	@Override
	public List<ItemVO> calcList() throws Exception {
		return session.selectList(namespace + ".calcList");
	}

	@Override
	public List<ItemVO> calcLists(ItemVO vo) throws Exception {
		return session.selectList(namespace + ".calcLists", vo);
	}

	@Override
	public void calcinsert(ItemVO vo) throws Exception {
		session.insert(namespace + ".calcinsert", vo);
	}

	@Override
	public void clacupdate(ItemVO vo) throws Exception {
		session.insert(namespace + ".clacupdate", vo);
	}

	@Override
	public int totalcalc(ItemVO vo) throws Exception {
		return session.selectOne(namespace + ".totalcalc", vo);
	}

	@Override
	public void salinsert(ItemVO vo) throws Exception {
		session.insert(namespace + ".salinsert", vo);
	}

	@Override
	public void daycalcinser(ItemVO vo) throws Exception {
		session.insert(namespace + ".daycalcinser", vo);
	}

	@Override
	public void calcdelete(ItemVO vo) throws Exception {
		session.delete(namespace + ".calcdelete", vo);
	}

	@Override
	public void hitupdate(ItemVO vo) throws Exception {
		session.delete(namespace + ".hitupdate", vo);
	}

	@Override
	public String areaserch(ItemVO vo) throws Exception {
		return session.selectOne(namespace + ".areaserch", vo);
	}

	@Override
	public List<ComItemVO> getCompanyList(Criteria cri) {
		return session.selectList(namespace + ".getCompanyList", cri);
	}

	@Override
	public int getCompanyCount() {
		return session.selectOne(namespace + ".getCompanyCount");
	}

	// 2016-11-15
	@Override
	public String getArea(String name) {
		return session.selectOne(namespace + ".getArea", name);
	}

	@Override
	public List<ItemVO> orderTempList(Criteria cri) {
		return session.selectList(namespace + ".orderTempList", cri);
	}

	@Override
	public int orderTempCount() {
		return session.selectOne(namespace + ".orderTempCount");
	}

	@Override
	public int getSelectCount2(ItemVO vo) {
		return session.selectOne(namespace + ".getSelectCount2", vo);
	}

	@Override
	public void updateOrderTemp(ItemVO vo) throws Exception {
		session.update(namespace + ".updateOrderTemp", vo);
	}

	@Override
	public List<ItemVO> orderTempCompare() {
		return session.selectList(namespace + ".orderTempCompare");
	}

	@Override
	public void orderTempDelete(ItemVO vo) {
		session.delete(namespace + ".orderTempDelete", vo);
	}

	@Override
	public void orderTempDeleteAll() {
		session.delete(namespace + ".orderTempDeleteAll");
	}

	@Override
	public List<ItemVO> selectAlreadyOrderedList() {
		return session.selectList(namespace + ".selectAlreadyOrderedList");
	}

	@Override
	public void orderSpend(ItemVO vo) {
		session.update(namespace + ".orderSpend", vo);
	}

	@Override
	public void orderInsert(ItemVO vo) throws Exception {
		session.insert(namespace + ".orderInsert", vo);
	}

	@Override
	public List<ItemVO> getStateList(ItemVO vo) throws Exception {
		return session.selectList(namespace + ".getStateList", vo);
	}

	@Override
	public void deleteOrder(ItemVO vo) throws Exception {
		session.delete(namespace + ".deleteOrder", vo);
	}

	public int getPrice(ItemVO vo) {
		return session.selectOne(namespace + ".getPrice", vo);
	}

	@Override
	public int getSpendSequence(ItemVO vo) {
		return session.selectOne(namespace + ".getSpendSequence", vo);
	}

	@Override
	public void orderSpendTemp(ItemVO vo) {
		session.insert(namespace + ".orderSpendTemp", vo);
	}

	@Override
	public List<ItemVO> sallist(ItemVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".sallist", vo);
	}

	@Override
	public List<ItemVO> orderSpendlist(ItemVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".orderSpendlist", vo);
	}

	@Override
	public void daymoneyinsert(ItemVO vo) throws Exception {
		session.insert(namespace + ".daymoneyinsert", vo);
	}

	@Override
	public List<ItemVO> daymoneylist(ItemVO vo) throws Exception {
		return session.selectList(namespace + ".daymoneylist", vo);
	}

	@Override
	public void daysaldelete(ItemVO vo) throws Exception {
		session.delete(namespace + ".daysaldelete", vo);
	}

	@Override
	public void dayspenddelete(ItemVO vo) throws Exception {
		session.delete(namespace + ".dayspenddelete", vo);
	}

	@Override
	public List<ItemVO> daysaltotalpay(ItemVO vo) throws Exception {
		return session.selectList(namespace + ".daysaltotalpay", vo);
	}

	@Override
	public List<ItemVO> daysalspendpay(ItemVO vo) throws Exception {
		return session.selectList(namespace + ".daysalspendpay", vo);
	}

	@Override
	public String daymoneyCount(ItemVO vo) throws Exception {
		return session.selectOne(namespace + ".daymoneyCount", vo);
	}

	@Override
	public List<NoticeVO> getNoticeList() throws Exception {
		return session.selectList(namespace + ".getNoticeList");
	}

	@Override
	public List<ItemVO> getLessItem(MemberVO Mvo) throws Exception {
		return session.selectList(namespace + ".getLessItem", Mvo);
	}

	@Override
	public int getLessItemCount(MemberVO Mvo) throws Exception {
		return session.selectOne(namespace + ".getLessItemCount", Mvo);
	}

	@Override
	public List<ItemVO> daycalclist(ItemVO vo) throws Exception {
		return session.selectList(namespace + ".daycalclist", vo);
	}

	@Override
	public void daycalclistdelete(ItemVO vo) throws Exception {
		session.delete(namespace + ".daycalclistdelete", vo);
	}

	@Override
	public List<ItemVO> daymoneyselect() throws Exception {
		return session.selectList(namespace + ".daymoneyselect");
	}

	@Override
	public void saldeletenum(ItemVO vo) throws Exception {
		session.delete(namespace + ".saldeletenum", vo);
	}

	@Override
	public void daymoneydeletenum(ItemVO vo) throws Exception {
		session.delete(namespace + ".daymoneydeletenum", vo);
	}

	@Override
	public void itemupdate(ItemVO vo) throws Exception {
		session.update(namespace + ".itemupdate", vo);
	}

	@Override
	public void updateManager(MemberVO Mvo) throws Exception {
		session.update(namespace + ".updateManager", Mvo);
	}

	@Override
	public List<NoticeReplVO> noticeReplList(int bno) throws Exception {
		return session.selectList(namespace + ".noticeReplList", bno);
	}

	@Override
	public void noticeReplWrite(NoticeReplVO vo) throws Exception {
		session.insert(namespace + ".noticeReplWrite", vo);
	}

	@Override
	public void noticeReplUpdate(NoticeReplVO vo) throws Exception {
		session.update(namespace + ".noticeReplUpdate", vo);
	}

	@Override
		public void noticeReplDelete(NoticeReplVO vo) throws Exception {
			session.delete(namespace + ".noticeReplDelete", vo);
	}

	@Override
	public String code1() throws Exception {
		return session.selectOne(namespace+".code1");
	}

	@Override
	public int code2() throws Exception {
		return session.selectOne(namespace+".code2");
	}

	@Override
	public int num(ItemVO vo) throws Exception {
		return session.selectOne(namespace+".num",vo);
	}
}
