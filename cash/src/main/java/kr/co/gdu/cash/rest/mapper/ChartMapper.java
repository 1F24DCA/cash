package kr.co.gdu.cash.rest.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChartMapper {
	List<Map<String, Object>> selectChart1();
	List<Map<String, Object>> selectChart2();
	List<Map<String, Object>> selectChart3();
	List<Map<String, Object>> selectChart4();
	List<Map<String, Object>> selectChart5();
	List<Map<String, Object>> selectChart6();
	List<Map<String, Object>> selectChart7();
	List<Map<String, Object>> selectChart8();
	List<Map<String, Object>> selectChart9();
	List<Map<String, Object>> selectChart10();
}
