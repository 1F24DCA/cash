package kr.co.gdu.cash.rest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.rest.mapper.RestMemberMapper;

@Service
@Transactional
public class RestMemberService {
	@Autowired private RestMemberMapper restMemberMapper;
	
	public String getMemberId(String memberId) {
		String returnId = restMemberMapper.selectMemberId(memberId);
		if (returnId == null) {
			return "yes";
		} else {
			return "no";
		}
	}
}
