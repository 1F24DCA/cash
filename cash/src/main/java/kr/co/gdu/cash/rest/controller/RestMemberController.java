package kr.co.gdu.cash.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.rest.service.RestMemberService;

@RestController
public class RestMemberController {
	@Autowired private RestMemberService restMemberService;
	
	@PostMapping("/admin/idCheck")
	public String idCk(@RequestParam(value = "id") String memberId) {
		return restMemberService.getMemberId(memberId);
	}
}
