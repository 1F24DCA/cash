package kr.co.gdu.cash.rest.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdu.cash.rest.mapper.ChartMapper;

@Service
public class ChartService {
	@Autowired ChartMapper chartMapper;
	
	public List<Map<String, Object>> getChart1() {
		return chartMapper.selectChart1();
	}
	public List<Map<String, Object>> getChart2() {
		return chartMapper.selectChart2();
	}
	public List<Map<String, Object>> getChart3() {
		return chartMapper.selectChart3();
	}
	public List<Map<String, Object>> getChart4() {
		return chartMapper.selectChart4();
	}
	public List<Map<String, Object>> getChart5() {
		return chartMapper.selectChart5();
	}
	public List<Map<String, Object>> getChart6() {
		return chartMapper.selectChart6();
	}
	public List<Map<String, Object>> getChart7() {
		return chartMapper.selectChart7();
	}
	public List<Map<String, Object>> getChart8() {
		return chartMapper.selectChart8();
	}
	public List<Map<String, Object>> getChart9() {
		return chartMapper.selectChart9();
	}
	public List<Map<String, Object>> getChart10() {
		return chartMapper.selectChart10();
	}
}
