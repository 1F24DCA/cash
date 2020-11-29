package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.GuestBook;

@Mapper
public interface GuestBookMapper {
	List<GuestBook> selectGuestBookList(Map<String, Object> map);
	int selectGuestBookCount();
	int insertGuestBook(GuestBook guestBook);
	int deleteGuestBook(int guestBookId);
}
