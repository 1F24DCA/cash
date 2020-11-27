package kr.co.gdu.cash.rest.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.rest.service.ChartService;

@RestController
public class ChartController {
	@Autowired ChartService chartService;
	
	@GetMapping("/admin/rest/chart1")
	public List<Map<String, Object>> chart1() {
		return chartService.getChart1();
	}

	@GetMapping("/admin/rest/chart2")
	public List<Map<String, Object>> chart2() {
		return chartService.getChart2();
	}

	@GetMapping("/admin/rest/chart3")
	public List<Map<String, Object>> chart3() {
		return chartService.getChart3();
	}

	@GetMapping("/admin/rest/chart4")
	public List<Map<String, Object>> chart4() {
		return chartService.getChart4();
	}

	@GetMapping("/admin/rest/chart5")
	public List<Map<String, Object>> chart5() {
		return chartService.getChart5();
	}

	@GetMapping("/admin/rest/chart6")
	public List<Map<String, Object>> chart6() {
		return chartService.getChart6();
	}

	@GetMapping("/admin/rest/chart7")
	public List<Map<String, Object>> chart7() {
		return chartService.getChart7();
	}

	@GetMapping("/admin/rest/chart8")
	public List<Map<String, Object>> chart8() {
		return chartService.getChart8();
	}

	@GetMapping("/admin/rest/chart9")
	public List<Map<String, Object>> chart9() {
		return chartService.getChart9();
	}

	@GetMapping("/admin/rest/chart10")
	public List<Map<String, Object>> chart10() {
		return chartService.getChart10();
	}
}
