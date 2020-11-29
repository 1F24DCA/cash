package kr.co.gdu.cash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.GuestBookMapper;
import kr.co.gdu.cash.vo.GuestBook;

@Service
@Transactional
public class GuestBookService {
	@Autowired private GuestBookMapper guestBookMapper;
	
	public Map<String, Object> getGuestBookList(int currentPage) {
		int rowPerPage = 10;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", (currentPage-1)*rowPerPage);
		paramMap.put("rowPerPage", rowPerPage);
		
		int rowCount = guestBookMapper.selectGuestBookCount();
		
		int lastPage = rowCount/rowPerPage;
		if (rowCount%rowPerPage != 0) {
			lastPage += 1;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("guestBookList", guestBookMapper.selectGuestBookList(paramMap));
		map.put("lastPage", lastPage);
		
		return map;
	}
	
	public void addGuestBook(GuestBook guestBook) {
		guestBook.setGuestBookWriter(guestBook.getGuestBookWriter().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
		guestBook.setGuestBookContent(guestBook.getGuestBookContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
		
		guestBookMapper.insertGuestBook(guestBook);
	}
	
	public void removeGuestBook(int guestBookId) {
		guestBookMapper.deleteGuestBook(guestBookId);
	}
}
