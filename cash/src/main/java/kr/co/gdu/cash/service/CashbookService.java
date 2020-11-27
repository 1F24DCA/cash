package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashBookMapper;
	
	public List<Cashbook> getCashbookListAll() {
		return cashBookMapper.selectCashbookListAll();
	}
	
	public List<Cashbook> getCashbookListByPage(int currentPage, int rowPerPage) {
		int beginRow = (currentPage-1)*rowPerPage;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		return cashBookMapper.selectCashbookListByPage(map);
	}

	public int removeCashbook(int cashbookId) {
		return cashBookMapper.deleteCashbook(cashbookId);
	}
	
	public int modifyCashbook(Cashbook cashbook) {
		return cashBookMapper.updateCashbook(cashbook);
	}
	
	public int addCashbook(Cashbook cashbook) {
		return cashBookMapper.insertCashbook(cashbook);
	}
	
	public Cashbook getCashbook(int cashbookId) {
		return cashBookMapper.selectCashbook(cashbookId);
	}
	
	public List<Cashbook> getCashbookListByDay(int currentYear, int currentMonth, int currentDay) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay", currentDay);
		return cashBookMapper.selectCashBookListByDay(map);
	}
	
	public List<Map<String, Object>> getCashListByMonth(int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		return cashBookMapper.selectCashListByMonth(map);
	}
	
	public int getSumCashbookPriceByInOut(String cashbookKind, int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		Integer sum = cashBookMapper.selectSumCashbookPriceByInOut(map);
		return sum;
	}
}














