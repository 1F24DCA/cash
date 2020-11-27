package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

// @Conpoment
// @Controller, @Service, @Mapper, @Repository : 스테레오타입
@Mapper
public interface CashbookMapper {
	// 캐시북 리스트 전체를 날것으로 가져옴(엑셀 파일 생성을 위한 쿼리)
	List<Cashbook> selectCashbookListAll();
	// 캐시북 리스트 전체를 페이지별로 표시(인수에 rowPerPage, beginRow가 들어감)
	List<Cashbook> selectCashbookListByPage(Map<String, Object> map);
	int deleteCashbook(int cashbookId);
	int updateCashbook(Cashbook cashbook);
	int insertCashbook(Cashbook cashbook);
	Cashbook selectCashbook(int cashbookId);
	List<Map<String, Object>> selectCashInOutList();
	Integer selectSumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	List<Cashbook> selectCashBookListByDay(Map<String, Object> map);
}
