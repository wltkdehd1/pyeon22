package com.pyeon2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.dao.PosDAO;
import com.pyeon2.domain.Criteria;
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.NoticeVO;
import com.pyeon2.vo.SelectSearch;
import com.pyeon2.vo.UserVO;

@Repository
public class PosServiceImpl implements PosService {

	@Autowired
	private PosDAO posDao;

	@Override
	public void insertOrderTemp(ItemVO vo) throws Exception {
		posDao.insertOrderTemp(vo);
	}

	@Override
	public void insertOrder(ItemVO vo) throws Exception {
		posDao.insertOrder(vo);
	}

	@Override
	public List<ItemVO> getList(ItemVO vo) throws Exception {
		return posDao.getList(vo);
	}

	@Override
	public List<ItemVO> selectName(SelectSearch ss) throws Exception {
		return posDao.selectName(ss);
	}

	@Override
	public void Delete(ItemVO vo) throws Exception {
		posDao.Delete(vo);
	}

	@Override
	public List<UserVO> selectalpayAll(UserVO vo) throws Exception {
		return posDao.selectalpayAll(vo);
	}

	@Override
	public List<UserVO> selectalpay(UserVO vo) throws Exception {
		return posDao.selectalpay(vo);
	}

	@Override
	public List<UserVO> selectmanpayAll(UserVO vo) throws Exception {
		return posDao.selectmanpayAll(vo);
	}

	@Override
	public List<UserVO> selectmanpay(UserVO vo) throws Exception {
		return posDao.selectmanpay(vo);
	}

	@Override
	public int getCount(ItemVO vo) {
		return posDao.getCount(vo);
	}

	@Override
	public int getSelectCount(ItemVO vo) {
		return posDao.getSelectCount(vo);
	}

	@Override
	public List<MemberVO> selectUser(MemberVO Mvo) throws Exception {
		return posDao.selectUser(Mvo);
	}

	@Override
	public List<MemberVO> selectUserId(MemberVO Mvo) throws Exception {
		return posDao.selectUserId(Mvo);
	}

	@Override
	public void updateUser(MemberVO Mvo) throws Exception {
		posDao.updateUser(Mvo);
	}

	@Override
	public void deleteUser(MemberVO Mvo) throws Exception {
		posDao.deleteUser(Mvo);
	}

	@Override
	public void deleteRole(MemberVO Mvo) throws Exception {
		posDao.deleteRole(Mvo);
	}

	@Override
	public void deleteUserTime(UserVO vo) throws Exception {
		posDao.deleteUserTime(vo);
	}

	@Override
	public void insertUser(MemberVO Mvo) throws Exception {
		posDao.insertUser(Mvo);
	}

	@Override
	public void insertPosition(MemberVO Mvo) throws Exception {
		posDao.insertPosition(Mvo);
	}

	@Override
	public void insertUserTime(UserVO vo) throws Exception {
		posDao.insertUserTime(vo);
	}

	@Override
	public List<ItemVO> calcList() throws Exception {
		return posDao.calcList();
	}

	@Override
	public List<ItemVO> calcLists(ItemVO vo) throws Exception {
		// TODO Auto-generated method stub
		return posDao.calcLists(vo);
	}

	@Override
	public void calcinsert(ItemVO vo) throws Exception {
		posDao.calcinsert(vo);
	}

	@Override
	public void clacupdate(ItemVO vo) throws Exception {
		posDao.clacupdate(vo);
	}

	@Override
	public int totalcalc(ItemVO vo) throws Exception {
		return posDao.totalcalc(vo);
	}

	@Override
	public void salinsert(ItemVO vo) throws Exception {
		posDao.salinsert(vo);

	}

	@Override
	public void daycalcinser(ItemVO vo) throws Exception {
		posDao.daycalcinser(vo);
	}

	@Override
	public void calcdelete(ItemVO vo) throws Exception {
		posDao.calcdelete(vo);
	}

	@Override
	public void hitupdate(ItemVO vo) throws Exception {
		posDao.hitupdate(vo);
	}

	@Override
	public String areaserch(ItemVO vo) throws Exception {
		return posDao.areaserch(vo);
	}

	@Override
	public List<ComItemVO> getCompanyList(Criteria cri) {
		return posDao.getCompanyList(cri);
	}

	@Override
	public int getCompanyCount() {
		return posDao.getCompanyCount();
	}

	// 2016-11-15
	@Override
	public String getArea(String name) {
		return posDao.getArea(name);
	}

	@Override
	public int getSelectCount2(ItemVO vo) {
		return posDao.getSelectCount2(vo);
	}

	@Override
	public List<ItemVO> orderTempList(Criteria cri) {
		return posDao.orderTempList(cri);
	}

	@Override
	public int orderTempCount() {
		return posDao.orderTempCount();
	}

	@Override
	public void updateOrderTemp(ItemVO vo) throws Exception {
		posDao.updateOrderTemp(vo);
	}

	@Override
	public List<ItemVO> orderTempCompare() {
		return posDao.orderTempCompare();
	}

	@Override
	public void orderTempDelete(ItemVO vo) {
		posDao.orderTempDelete(vo);
	}

	@Override
	public void orderTempDeleteAll() {
		posDao.orderTempDeleteAll();
	}

	@Override
	public List<ItemVO> selectAlreadyOrderedList() {
		return posDao.selectAlreadyOrderedList();
	}

	@Override
	public void orderSpend(ItemVO vo) {
		posDao.orderSpend(vo);
	}

	@Override
	public void orderInsert(ItemVO vo) throws Exception {
		posDao.orderInsert(vo);
	}

	@Override
	public List<ItemVO> getStateList(ItemVO vo) throws Exception {
		return posDao.getStateList(vo);
	}

	@Override
	public void deleteOrder(ItemVO vo) throws Exception {
		posDao.deleteOrder(vo);
	}
	
	public int getPrice(ItemVO vo) {
		return posDao.getPrice(vo);
	}

	@Override
	public int getSpendSequence(ItemVO vo) {
		return posDao.getSpendSequence(vo);
	}

	@Override
	public void orderSpendTemp(ItemVO vo) {
		posDao.orderSpendTemp(vo);
	}

	@Override
	public List<ItemVO> sallist(ItemVO vo) throws Exception {
		return posDao.sallist(vo);
	}

	@Override
	public List<ItemVO> orderSpendlist(ItemVO vo) throws Exception {
		// TODO Auto-generated method stub
		return posDao.orderSpendlist(vo);
	}

	@Override
	public void daymoneyinsert(ItemVO vo) throws Exception {
		posDao.daymoneyinsert(vo);
	}

	@Override
	public List<ItemVO> daymoneylist(ItemVO vo) throws Exception {
		return posDao.daymoneylist(vo);
	}

	@Override
	public void daysaldelete(ItemVO vo) throws Exception {
		posDao.daysaldelete(vo);
	}

	@Override
	public void dayspenddelete(ItemVO vo) throws Exception {
		posDao.dayspenddelete(vo);
	}

	@Override
	public List<ItemVO> daysaltotalpay(ItemVO vo) throws Exception {
		return posDao.daysaltotalpay(vo);
	}

	@Override
	public List<ItemVO> daysalspendpay(ItemVO vo) throws Exception {
		return posDao.daysalspendpay(vo);
	}

	@Override
	public String daymoneyCount(ItemVO vo) throws Exception {
		return posDao.daymoneyCount(vo);
	}
	
	@Override
	public List<NoticeVO> getNoticeList() throws Exception {
		return posDao.getNoticeList();
	}

	@Override
	public List<ItemVO> getLessItem(MemberVO Mvo) throws Exception {
		return posDao.getLessItem(Mvo);
	}

	@Override
	public int getLessItemCount(MemberVO Mvo) throws Exception {
		return posDao.getLessItemCount(Mvo);
	}
	
	@Override
	public List<ItemVO> daycalclist(ItemVO vo) throws Exception {
		return posDao.daycalclist(vo);
	}

	@Override
	public void daycalclistdelete(ItemVO vo) throws Exception {
		posDao.daycalclistdelete(vo);
	}

	@Override
	public List<ItemVO> daymoneyselect() throws Exception {
		return posDao.daymoneyselect();
	}

	@Override
	public void saldeletenum(ItemVO vo) throws Exception {
		posDao.saldeletenum(vo);
	}

	@Override
	public void daymoneydeletenum(ItemVO vo) throws Exception {
		posDao.daymoneydeletenum(vo);
	}

	@Override
	public void itemupdate(ItemVO vo) throws Exception {
		posDao.itemupdate(vo);
	}

	@Override
	public void updateManager(MemberVO Mvo) throws Exception {
		posDao.updateManager(Mvo);
	}
}
