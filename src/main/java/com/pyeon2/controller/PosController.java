package com.pyeon2.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pyeon2.domain.Criteria;
import com.pyeon2.domain.PageMaker;
import com.pyeon2.service.CompanyService;
import com.pyeon2.service.PosService;
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.NoticeReplVO;
import com.pyeon2.vo.NoticeVO;
import com.pyeon2.vo.SelectSearch;
import com.pyeon2.vo.UserVO;

import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;

@Controller
/* @RequestMapping(value="/pos/") */
public class PosController {

	@Autowired
	private PosService posService;

	@Autowired
	private CompanyService companyService;
	/*
	 * @Autowired public UserService userService;
	 */

	@RequestMapping("pos")
	public ModelAndView getCompany(HttpServletRequest request, ItemVO Ivo, MemberVO Mvo) {
		
		ModelAndView mav = new ModelAndView();
		Ivo.setId(request.getParameter("id"));
		
		try {
			
			String area = posService.areaserch(Ivo);
			Mvo.setArea(area);
			
			List<NoticeVO> list = posService.getNoticeList();
			List<ItemVO> list2 = posService.getLessItem(Mvo);
			int count = posService.getLessItemCount(Mvo);
			
			mav.addObject("list", list);
			mav.addObject("list2", list2);
			mav.addObject("count", count);
			
			mav.setViewName(".pos.pos_main");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}


	@RequestMapping(value = "pos/ps_order", method = RequestMethod.GET)
	public ModelAndView orderGET(Model model, String page, String item_code, String item_name, String category, String name) {
		System.out.println("order GET 요청 성공");

		ModelAndView mav = new ModelAndView();

		List<ComItemVO> list;
		List<ItemVO> list2;
		list2 = posService.orderTempCompare();
		int count = 0;
		int pageNum = 1;
		String area = "";
		
		if(page != null && !page.equals("")){
			pageNum = Integer.parseInt(page);
		}
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(7);
			count = posService.getCompanyCount();
			list = posService.getCompanyList(cri);
			
			System.out.println("name : " + name);
			if(name == null){
				area = "";
			}
			else{
				area = posService.getArea(name);
			}
			
			System.out.println("List : " + list);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("item_code", item_code);
			mav.addObject("item_name", item_name);
			mav.addObject("category", category);
			mav.addObject("area", area);
			mav.addObject("list", list2);
			
			mav.setViewName(".pos.pos_order");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_order", method = RequestMethod.POST)
	public ModelAndView orderPOST(ItemVO vo, Model model, String page) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("order POST 요청 성공");
		List<ItemVO> list;
		int compare = 0;
		list = posService.orderTempCompare();
		System.out.println("item_code : " + vo.getItem_code());
		System.out.println("area : " + vo.getArea());
		for(int i = 0; i < list.size(); i++){
			if(list.get(i).getItem_code().equals(vo.getItem_code()) && list.get(i).getArea().equals(vo.getArea())){
				compare = 1;
			}
		}
		
		if(compare == 1){
			posService.updateOrderTemp(vo);
		}
		else{
			posService.insertOrderTemp(vo);
		}
		
		mav.addObject("list", list);
		mav.setViewName("redirect:ps_order");
		
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_order_temp", method = RequestMethod.GET)
	public ModelAndView orderTempGet(ItemVO vo, String page, String item_code, String area){
		ModelAndView mav = new ModelAndView();
		List<ItemVO> list;
		int count = 0;
		int pageNum = 1;
		
		if(page != null && !page.equals("")){
			pageNum = Integer.parseInt(page);
		}
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(7);
			count = posService.orderTempCount();
			list = posService.orderTempList(cri);
			
			System.out.println("List : " + list);
			System.out.println("count : " + count);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("item_code", item_code);
			mav.addObject("area", area);
			
			mav.setViewName(".pos.pos_order_temp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_order_temp", method = RequestMethod.POST)
	public ModelAndView orderTempPost(String page, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<ItemVO> list;
		list = posService.selectAlreadyOrderedList();
		ItemVO vo = new ItemVO();
		int totalPrice = 0;
		int temp = 0;
		
		try{
			for(int i = 0; i < list.size(); i++){
				posService.insertOrder(list.get(i));
				posService.orderInsert(list.get(i));
				//totalPrice = totalPrice + posService.getPrice(list.get(i));
				System.out.println(posService.getPrice(list.get(i)));
				System.out.println(totalPrice);
				temp = 1;
			}
			
			if(temp == 1){
				vo.setTotalPrice(totalPrice);
				vo.setArea(list.get(0).getArea());
				posService.orderSpendTemp(vo);
				posService.orderTempDeleteAll();
			}
			
			mav.setViewName(".pos.pos_order_temp");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_order_temp_delete", method = RequestMethod.GET)
	public ModelAndView orderTempDelete(String page, String item_code, String area){
		ModelAndView mav = new ModelAndView();
		/*List<ItemVO> list;
		int count = 0;
		int pageNum = Integer.parseInt(page);
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(7);
			
			ItemVO vo = new ItemVO();
			vo.setArea(area);
			vo.setItem_code(item_code);
			
			posService.orderTempDelete(vo);
			count = posService.orderTempCount();
			list = posService.orderTempList(cri);
			
			System.out.println("List : " + list);
			System.out.println("count : " + count);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("item_code", item_code);
			mav.addObject("area", area);
			
			mav.setViewName(".pos.pos_order_temp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		String check = "1";
		ItemVO vo = new ItemVO();
		vo.setArea(area);
		vo.setItem_code(item_code);
		
		posService.orderTempDelete(vo);
		
		mav.addObject("check", check);
		mav.setViewName(".pos.pos_order_temp");
		
		return mav;
	}

	@RequestMapping(value = "pos/ps_stock", method = RequestMethod.GET)
	public String posStock() {
		return ".pos.pos_stock";
	}

	@RequestMapping(value = "pos/ps_sales", method = RequestMethod.GET)
	public String posSales() {
		return ".pos.pos_sales";
	}

	@RequestMapping(value = "pos/ps_go_leave", method = RequestMethod.GET)
	public String posGo_leave() {
		return ".pos.pos_go_leave";
	}

	@RequestMapping(value = "pos/ps_calc", method = RequestMethod.GET)
	public String posCalc() {
		return ".pos.pos_calc";
	}


	@RequestMapping(value = "pos/ps_item_delete", method = RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setItem_code(request.getParameter("item_code"));
		vo.setArea(request.getParameter("area"));

		posService.Delete(vo);

		mav.setViewName(".pos.fin");
		return mav;
	}


	@RequestMapping(value = "pos/ps_selectpay", method = RequestMethod.GET)
	public ModelAndView selectalpay(HttpServletRequest request, Model model) {
		ModelAndView mav = new ModelAndView();
		List<UserVO> list;

		UserVO vo = new UserVO();
		vo.setUserid(request.getParameter("id"));

		try {
			list = posService.selectalpayAll(vo);
			mav.addObject("result", list);
			mav.setViewName(".pos.pos_selectpay");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "pos/ps_selectpay", method = RequestMethod.POST)
	public ModelAndView selectalfroms(HttpServletRequest request, Model model) {
		UserVO vo = new UserVO();
		ModelAndView mav = new ModelAndView();
		List<UserVO> list;
		System.out.println("request" + request.getParameter("ids"));
		vo.setUserid(request.getParameter("ids"));
		vo.setYear(request.getParameter("year"));
		vo.setMonth(request.getParameter("month"));

		try {
			list = posService.selectalpay(vo);
			mav.addObject("result", list);
			mav.setViewName(".pos.pos_selectpay");
		} catch (Exception e) {
			// TODO: handle exception
		}

		return mav;
	}

	@RequestMapping(value = "pos/ps_selectpays", method = RequestMethod.GET)
	public ModelAndView selectmanpay(HttpServletRequest request, Model model) {
		ModelAndView mav = new ModelAndView();
		List<UserVO> list;

		UserVO vo = new UserVO();
		vo.setUserid(request.getParameter("id"));

		try {
			list = posService.selectmanpayAll(vo);
			mav.addObject("result", list);
			mav.setViewName(".pos.pos_selectpay");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "pos/ps_selectpays", method = RequestMethod.POST)
	public ModelAndView selectmanfroms(HttpServletRequest request, Model model) {
		UserVO vo = new UserVO();
		ModelAndView mav = new ModelAndView();
		List<UserVO> list;
		System.out.println("request" + request.getParameter("ids"));
		vo.setUserid(request.getParameter("ids"));
		vo.setYear(request.getParameter("year"));
		vo.setMonth(request.getParameter("month"));

		try {
			list = posService.selectmanpay(vo);
			mav.addObject("result", list);
			mav.setViewName(".pos.pos_selectpay");
		} catch (Exception e) {
			// TODO: handle exception
		}

		return mav;
	}

	@RequestMapping("pos/ps_item_selectAll")
	public ModelAndView productList(String page, String id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String area;

		List<ItemVO> list;
		int count = 0;
		int pageNum = 1;
		ItemVO vo = new ItemVO();
		area = posService.getArea(id);

		if (page != null && !page.equals("")) {
			pageNum = Integer.parseInt(page);
		}

		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(10);
			vo.setArea(area);
			vo.setCri(cri);
			count = posService.getCount(vo);
			list = posService.getList(vo);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);

			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			//mav.addObject("area", area);
			mav.addObject("id", id);

			mav.setViewName(".pos.pos_item_selectAll");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "pos/ps_item_delete_now", method = RequestMethod.GET)
	public ModelAndView deleteNow(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		List<ItemVO> list;
		int count = 0;
		int pageNum = 1;
		String page = request.getParameter("page");

		if (page != null && !page.equals("")) {
			pageNum = Integer.parseInt(page);
		}

		vo.setItem_code(request.getParameter("item_code"));
		vo.setArea(request.getParameter("area"));

		posService.Delete(vo);

		pageNum = Integer.parseInt(request.getParameter("page"));

		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(10);
			vo.setCri(cri);
			count = posService.getCount(vo);
			list = posService.getList(vo);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);

			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);

			mav.setViewName(".pos.pos_item_selectAll");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value="pos/ps_item_select_now")
	   public ModelAndView selectName(HttpServletRequest request,Model model){
	      ModelAndView mav = new ModelAndView();
	      ItemVO vo = new ItemVO();
	      
	      String page = request.getParameter("page");
	      String category = request.getParameter("category");
	      String id = request.getParameter("id");
	      String item_name = "";
	      SelectSearch ss = new SelectSearch();

	      System.out.println(id);
	      
	      String area = posService.getArea(id);
	      vo.setArea(area);
	      System.out.println(area);
	      List<ItemVO> list;
	      int count = 0;
	      int pageNum = 1;
	      int perPageNum = 7;
	      
	      if(request.getParameter("item_name") == null){
	         item_name = "";
	      }
	      else{
	         item_name = request.getParameter("item_name");
	      }
	      vo.setCategory(category);
	      
	      
	      if(page != null && !page.equals("")){
	         pageNum = Integer.parseInt(page);
	      }
	      
	      try {
	         Criteria cri = new Criteria();
	         cri.setPage(pageNum);
	         cri.setPerPageNum(perPageNum);
	         
	         ss.setPage(pageNum);
	         ss.setPerPageNum(perPageNum);
	         ss.setItem_name("%"+item_name+"%");
	         ss.setCategory(category);
	         ss.setArea(area);
	         
	         
	         System.out.println("상품명 :" + item_name);
	         System.out.println("카테고리 :" + vo.getCategory());
	         System.out.println("나와랏 :" + ss.getItem_name());
	         
	         if(item_name.equals("")){
	        	 count = posService.getSelectCount2(vo);
	         } else {
	        	 vo.setItem_name("%"+item_name+"%");
		         count = posService.getSelectCount(vo);
	         }
	         
	         
	         System.out.println("count : " + count);
	         list = posService.selectName(ss);
	         
	         PageMaker pageMaker = new PageMaker(); //페이지 선택부분 처리
	         pageMaker.setCri(cri);
	         pageMaker.setTotalCount(count);
	         
	         mav.addObject("result", list);
	         mav.addObject("pageNum", pageNum);
	         mav.addObject("count", count);
	         mav.addObject("pageMaker", pageMaker);
	         mav.addObject("category", category);
	         mav.addObject("item_name", item_name);
	         mav.addObject("area", area);
	         
	         mav.setViewName(".pos.pos_item_select_now");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return mav;
	   }
	
	
	@RequestMapping("pos/ps_user_selectForm")
	public ModelAndView posPersonnelForm(HttpServletRequest request, MemberVO Mvo) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		Mvo.setId(request.getParameter("id"));

		try {
			list = posService.selectUser(Mvo);
			String area = posService.getArea(request.getParameter("id"));

			mav.addObject("list", list);
			mav.addObject("area", area);
			mav.setViewName(".pos.pos_user_select");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping("pos/ps_user_updateForm")
	public ModelAndView posPersonnelUpdateForm(HttpServletRequest request, MemberVO Mvo) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		Mvo.setId(request.getParameter("id"));

		try {
			list = posService.selectUserId(Mvo);

			mav.addObject("list", list);
			mav.setViewName(".pos.pos_user_updateForm");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping("pos/ps_user_update")
	public String posPersonnelUpdate(HttpServletRequest request, MemberVO Mvo) {

		Mvo.setId(request.getParameter("id"));
		String position = request.getParameter("position");
		try {
			if (position.equals("user")) {
				posService.updateUser(Mvo);
			} else if (position.equals("manager")){
				posService.updateManager(Mvo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ".pos.pos_user_update";
	}

	@RequestMapping(value = "pos/ps_user_delete", method = RequestMethod.POST)
	public String comPersonnelDelete(HttpServletRequest request, MemberVO Mvo, UserVO vo) {

		Mvo.setId(request.getParameter("id"));
		vo.setUserid(request.getParameter("id"));

		try {
			posService.deleteUserTime(vo);
			posService.deleteUser(Mvo);
			posService.deleteRole(Mvo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ".pos.pos_user_delete";
	}

	@RequestMapping("pos/ps_user_insertForm")
	public ModelAndView posPersonnelInsertForm(HttpServletRequest request, MemberVO Mvo) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		Mvo.setId(request.getParameter("id"));

		try {
			list = posService.selectUserId(Mvo);

			mav.addObject("list", list);
			mav.setViewName(".pos.pos_user_insertForm");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "pos/ps_user_insert", method = RequestMethod.POST)
	public ModelAndView comPersonnelInsert(HttpServletRequest request, MemberVO Mvo, UserVO vo) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		try {

			posService.insertUser(Mvo);

			String position = Mvo.getPosition();
			String id = Mvo.getId();
			String user = "user";

			// 매니저가 정보를 입력하면서 role 테이블에 포지션에 따라 권한도 주어짐
			if (position.equals(user)) {
				Mvo.setId(request.getParameter("id"));
				Mvo.setRole_name("ROLE_USER");
				posService.insertPosition(Mvo);
				
				// p2_user 테이블에 최초 데이터 저장 (이 후로 시간은 다른 메소드에서 업데이트)
				vo.setUserid(request.getParameter("id"));
				posService.insertUserTime(vo);
			}

			list = posService.selectUser(Mvo);

			mav.addObject("list", list);
			mav.setViewName(".pos.pos_user_insert");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}
	
	@RequestMapping(value="pos/ps_calcform", method = RequestMethod.GET)
	public ModelAndView calcget(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setId(request.getParameter("id"));
		String area = posService.areaserch(vo);
		mav.addObject("area", area);
		mav.setViewName(".pos.pos_calc");

		return mav;
	}
	
	@RequestMapping(value = "pos/ps_calc", method = RequestMethod.POST)
	public ModelAndView calcpost(HttpServletRequest request, Model model) throws Exception{
		
		ItemVO vo = new ItemVO();
		vo.setItem_code(request.getParameter("item_code"));
		vo.setArea(request.getParameter("area"));
		
		/*vo.setPay(Integer.parseInt(request.getParameter("pay")));*/
		ModelAndView mav = new ModelAndView();
		int cal = 0;
		int total = 0;
		/*int pay = vo.getPay();*/
		List<ItemVO> list = posService.calcList();
		for(int i =0 ; i < list.size() ; i++){
			if(vo.getItem_code().equals(list.get(i).getItem_code())&& vo.getArea().equals(list.get(i).getArea())){
				cal = 1;
			}
		}
		
		switch (cal) {
			case 1:
			{
				posService.clacupdate(vo);
				break;
			}
			case 0:
			{
				posService.calcinsert(vo);
				break;
			}
			default:
			{
				break;
			}
		}
		
		list = posService.calcLists(vo);
		total = posService.totalcalc(vo);
		/*pay = pay - total;*/
		
		mav.addObject("result", list);
		mav.addObject("total",total);
		mav.addObject("area", vo.getArea());
		/*mav.addObject("pay",pay);*/
		mav.setViewName(".pos.pos_calc");

		return mav;
	}
	
	@RequestMapping(value = "pos/ps_daycalc", method = RequestMethod.POST)
	public ModelAndView calcpostday(HttpServletRequest request, Model model) throws Exception{
		ItemVO vo = new ItemVO();
		vo.setArea(request.getParameter("area"));
		vo.setPay(Integer.parseInt(request.getParameter("pay")));
		ModelAndView mav = new ModelAndView();
		int total = 0;
		int pay = vo.getPay();
		List<ItemVO> list = posService.calcList();
		mav.addObject("area", vo.getArea());
		total = posService.totalcalc(vo);
		pay = pay - total;
		
		mav.addObject("result", list);
		mav.addObject("total",total);
		mav.addObject("pay",pay);
		
		mav.setViewName(".pos.pos_calc");

		return mav;
	}
	
	@RequestMapping(value = "pos/ps_daycalcfin", method = RequestMethod.POST)
	public ModelAndView calcpostfinday(HttpServletRequest request, Model model) throws Exception{
		ItemVO vo = new ItemVO();
		
		ModelAndView mav = new ModelAndView();
		
		vo.setTotal(Integer.parseInt(request.getParameter("total")));
		vo.setArea(request.getParameter("area"));
		
		///////////////////////////////////////////////////////////
		String code1 = posService.code1();
		int code2 = posService.code2() + 1;
		String billnum = code1 + code2;
		
		vo.setCode1(code1);
		vo.setCode2(code2);
		vo.setBillnum(billnum);

		// 바코드 생성 코드
		Barcode barcode = BarcodeFactory.createCode128B(billnum);

		File file = new File("C:\\Bill\\" + billnum + ".jpg");
		BarcodeImageHandler.saveJPEG(barcode, file);
		///////////////////////////////////////////////////////////
		
		
		posService.salinsert(vo);
		
		List<ItemVO> list = posService.calcList();
		
		for(int i = 0 ; i<list.size() ; i++){
			vo.setItem_code(list.get(i).getItem_code());
			vo.setItem_name(list.get(i).getItem_name());
			vo.setCount(list.get(i).getCount());
			vo.setCategory(list.get(i).getCategory());
			vo.setArea(list.get(i).getArea());
			vo.setPrice(list.get(i).getPrice());
			
			posService.daycalcinser(vo);
			posService.hitupdate(vo);
		}
		mav.addObject("area", vo.getArea());
		posService.calcdelete(vo);
		
		
		mav.setViewName(".pos.pos_calc");

		return mav;
	}
	
	@RequestMapping(value = "pos/ps_calccancle", method = RequestMethod.POST)
	public ModelAndView calccancle(HttpServletRequest request, Model model) throws Exception{

		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		
		vo.setArea(request.getParameter("area"));
		posService.calcdelete(vo);
		mav.addObject("area", vo.getArea());
		mav.setViewName(".pos.pos_calc");
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_orderState", method = RequestMethod.GET)
	public ModelAndView ps_orderStateGET(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		String name = request.getParameter("id");
		String area = posService.getArea(name);
		System.out.println("area : " + area );
		vo.setArea(area);
		
		List<ItemVO> list = posService.getStateList(vo);
		
		mav.addObject("list", list);
		mav.setViewName(".pos.pos_orderState");
		return mav;
	}

	@RequestMapping(value = "pos/ps_orderStates", method = RequestMethod.GET)
	public ModelAndView ps_orderStatePOST(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		
		vo.setItem_code(request.getParameter("item_code"));
		vo.setP2_time(request.getParameter("p2_time"));
		
		posService.deleteOrder(vo);
		
		mav.setViewName(".pos.pos_StateDeleteSuc");
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_notice_list")
	public ModelAndView comnotice(HttpServletRequest request ,Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		NoticeVO nvo = new NoticeVO();
		Criteria cri = new Criteria();
		PageMaker pageMaker = new PageMaker();
		int pageNum = 1;
		int count = 0;
		String title = "";

		if(request.getParameter("page") != null && !request.getParameter("page").equals("")){
			pageNum = Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("title") != null){
			title = request.getParameter("title");
		}
			
		nvo.setTitle("%"+title+"%");
		
		if(companyService.getNoticeCount(nvo) == null){
			count = 0;
		} else{
			count = Integer.parseInt(companyService.getNoticeCount(nvo));
		}
		cri.setPage(pageNum);
		cri.setPerPageNum(10);
		nvo.setCri(cri);

		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		List<NoticeVO> list = companyService.getnoticelist(nvo);
		mav.addObject("result", list);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("page", pageNum);
		mav.addObject("title", title);
		mav.setViewName(".pos.pos_notice_list");
		
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_notice_contant" , method = RequestMethod.GET)
	public ModelAndView comnoticecontant(HttpServletRequest request ,Model model)throws Exception{
		ModelAndView mav = new ModelAndView();
		
		NoticeVO Nvo = new NoticeVO();
		Nvo.setNoticenum(Integer.parseInt(request.getParameter("noticenum")));
		int num = 0;
		List<NoticeVO> list = companyService.getnoticecontant(Nvo);
		num = list.get(0).getNoticenum();
		
		mav.addObject("result",list);
		mav.addObject("num", num);
		mav.setViewName(".pos.pos_notice_contant");
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_daymoney" , method = RequestMethod.GET)
	public ModelAndView daymoney(HttpServletRequest request,Model model) throws Exception{
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setId(request.getParameter("id"));
		String area = posService.areaserch(vo);
		vo.setArea(area);
		
		List<ItemVO> list1 = posService.sallist(vo);
		List<ItemVO> list2 = posService.orderSpendlist(vo);
		
		mav.addObject("result1",list1);
		mav.addObject("result2",list2);
		mav.addObject("area", area);
		mav.setViewName(".pos.pos_daymoney");
		return mav;
	}
	
	@RequestMapping("pos/ps_daymoneyconfirm")
	public ModelAndView daymoneyconfirm(HttpServletRequest request,Model model) throws Exception{
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		String area = request.getParameter("area");
		vo.setArea(area);
		String year = "";
		String month = "";
		//String days = "";
		int pay1 = 0;
		int pay2 = 0;
		int pageNum = 1;
		int count;
		if(request.getParameter("page") != null && !request.getParameter("page").equals(null)){
			pageNum = Integer.parseInt(request.getParameter("page"));
		}
		
		if((request.getParameter("year") == null) && (request.getParameter("month") == null)) {
			year = "";
			month = "";
			//days = "";
		}
		else{
			year = request.getParameter("year");
			month = request.getParameter("month");
			//days = request.getParameter("days");
		}
		
		vo.setYear("%"+year+"%");
		vo.setMonth("%"+month+"%");
		//vo.setDays("%"+days+"%");
		
		Criteria cri = new Criteria();
		cri.setPage(pageNum);
		cri.setPerPageNum(15);
		if(posService.daymoneyCount(vo) == null){
			count = 0;
		}
		else {
			count = Integer.parseInt(posService.daymoneyCount(vo));
		}
		
		vo.setCri(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
				
		List<ItemVO> list1 = posService.sallist(vo);
		for(int i = 0 ; i < list1.size() ; i++){
			vo.setPaynum(list1.get(i).getPaynum());
			vo.setTitle(list1.get(i).getSold());
			vo.setContent("수입");
			vo.setPay(list1.get(i).getPay());
			vo.setP2_time(list1.get(i).getSal_time());
			vo.setBillnum(list1.get(i).getBillnum());              /////////////////////////
			System.out.println("p2_time : " + list1.get(i).getSal_time());
			posService.daymoneyinsert(vo);
		}
		if(posService.daysaltotalpay(vo).get(0) == null){
			pay1 = 0;
		}
		else {
			pay1 = posService.daysaltotalpay(vo).get(0).getPay();
		}
		
		posService.daysaldelete(vo);
		System.out.println("pay1 : " + pay1);
		
		List<ItemVO> list2 = posService.orderSpendlist(vo);
		for(int i = 0 ; i < list2.size() ; i++){
			vo.setPaynum(0);
			vo.setTitle(list2.get(i).getSpend());
			vo.setContent("지출");
			vo.setPay(list2.get(i).getPay());
			vo.setP2_time(list2.get(i).getSpend_date());
			System.out.println("p2_time : " + list2.get(i).getSal_time());
			posService.daymoneyinsert(vo);
		}
		if(posService.daysalspendpay(vo).get(0) == null){
			pay2 = 0;
		}
		else {
			pay2 = posService.daysalspendpay(vo).get(0).getPay();
		}
		
		posService.dayspenddelete(vo);
		System.out.println("pay2 : " + pay2);

		
		int total = pay1 - pay2;
		
		vo.setArea(request.getParameter("area"));
		System.out.println("여긴 오니?!");
		List<ItemVO> list3 = posService.daymoneylist(vo);
		System.out.println("여기는?!?!");
		
		mav.addObject("pay1",pay1);
		mav.addObject("pay2",pay2);
		mav.addObject("total",total);
		mav.addObject("result",list3);
		mav.addObject("area", area);
		mav.addObject("page", pageNum);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.setViewName(".pos.pos_daymoneyconfirm");
		
		return mav;
	}
	
	@RequestMapping("pos/ps_daymoneyconfirmSelect")
	public ModelAndView daymoneyconfirmSelect(HttpServletRequest request,Model model) throws Exception{
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		String area = request.getParameter("area");
		vo.setArea(area);
		String year = "";
		String month = "";
		//String days = "";
		int pay1 = 0;
		int pay2 = 0;
		if((request.getParameter("year") == null) && (request.getParameter("month") == null)) {
			year = "";
			month = "";
			//days = "";
		}
		else{
			year = request.getParameter("year");
			month = request.getParameter("month");
			//days = request.getParameter("days");
		}
		
		System.out.println("area : " + area);
		System.out.println("year : " + year);
		System.out.println("month : " + month);
		vo.setYear("%"+year+"%");
		vo.setMonth("%"+month+"%");
		//vo.setDays("%"+days+"%");
	
		vo.setTitle("판매");
		if(posService.daysaltotalpay(vo).get(0) == null){
			pay1 = 0;
		}
		else {
			pay1 = posService.daysaltotalpay(vo).get(0).getPay();
		}

		vo.setTitle("지출");
		if(posService.daysaltotalpay(vo).get(0) == null){
			pay2 = 0;
		}
		else {
			pay2 = posService.daysalspendpay(vo).get(0).getPay();
		}
		
		System.out.println("pay1 : " + pay1);
		System.out.println("pay2 : " + pay2);
		
		int total = pay1 - pay2;
		
		vo.setArea(request.getParameter("area"));
		List<ItemVO> list3 = posService.daymoneylist(vo);
		
		mav.addObject("pay1",pay1);
		mav.addObject("pay2",pay2);
		mav.addObject("total",total);
		mav.addObject("result",list3);
		mav.addObject("area", area);
		mav.setViewName(".pos.pos_daymoneyconfirm");
		return mav;
	}
	
	@RequestMapping(value = "pop_calcrefurnd" , method = RequestMethod.GET)
	public ModelAndView calcrefurnd(HttpServletRequest request,Model model) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		ItemVO vo = new ItemVO();
		vo.setId(request.getParameter("id"));
		String area = posService.areaserch(vo);
		mav.addObject("area",area);
		mav.setViewName("pop/pop_calcrefurnd");
		return mav;
	}
	
	@RequestMapping(value = "pop_calcrefurndlist" , method = RequestMethod.POST)
	public ModelAndView calcrefurndlist(HttpServletRequest request,Model model) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		ItemVO vo = new ItemVO();
		vo.setBillnum(request.getParameter("billnum"));
		
		vo.setArea(request.getParameter("area"));
		List<ItemVO> list = posService.daycalclist(vo);
		
		int num =  posService.num(vo);
		
		System.out.println("num = " + num);
		mav.addObject("billnum",vo.getBillnum());
		mav.addObject("num",num);
		mav.addObject("area",request.getParameter("area"));
		mav.addObject("result" , list);
		mav.setViewName("pop/pop_calcrefurndlist");
		return mav;
	}
	
	@RequestMapping(value = "pop_calcrefurnd_delete" , method = RequestMethod.GET)
	public ModelAndView calcrefurnddelete(HttpServletRequest request,Model model) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		ItemVO vo = new ItemVO();
		
		vo.setBillnum(request.getParameter("billnum"));
		vo.setPaynum(Integer.parseInt(request.getParameter("num")));
		vo.setArea(request.getParameter("area"));
		
		List<ItemVO> list = posService.sallist(vo);
		for(int i = 0 ; i < list.size() ; i++){
			if(list.get(i).getPaynum()== vo.getPaynum()){
				posService.saldeletenum(vo);
			}
		}
		

		List<ItemVO> list1 = posService.daymoneyselect();
		for(int i = 0 ; i < list1.size() ; i++){
			if(list1.get(i).getNum() == vo.getPaynum()){
				posService.daymoneydeletenum(vo);
			}
		}
		

		List<ItemVO> list2 = posService.daycalclist(vo);
		for(int i = 0 ; i < list2.size() ; i++){
			vo.setItem_code(list2.get(i).getItem_code());
			vo.setCount(list2.get(i).getCount());
			
			posService.itemupdate(vo);
		}

		posService.daycalclistdelete(vo);
		
		mav.setViewName("pop/pop_calcrefurnd_delete");
		return mav;
	}
	
	@RequestMapping("pos/ps_user_information")
	public ModelAndView informManager(HttpServletRequest request, MemberVO Mvo) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;
		
		list = posService.selectUserId(Mvo);
		System.out.println(list);
		
		mav.addObject("list", list);
		mav.setViewName(".pos.pos_user_information");
		
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_notice_repl_write", method=RequestMethod.POST)
	public ResponseEntity<String> noticeReplRegister(@RequestBody NoticeReplVO vo) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			posService.noticeReplWrite(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "pos/ps_notice_repl_list/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<NoticeReplVO>> noticeReplList(@PathVariable("bno")int bno) {
		ResponseEntity<List<NoticeReplVO>> entity = null;
		try {
			entity = new ResponseEntity<>(posService.noticeReplList(bno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "pos/ps_notice_repl_update/{bno}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> noticeReplUpdate(@PathVariable("bno")int bno,
			@RequestBody NoticeReplVO vo) {
		ResponseEntity<String> entity = null;
		
		try {
			vo.setRno(bno);
			posService.noticeReplUpdate(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "pos/ps_notice_repl_delete/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> noticeReplDelete(@PathVariable("rno")int rno){
		ResponseEntity<String> entity = null;
		
		try {
			posService.noticeReplDelete(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
