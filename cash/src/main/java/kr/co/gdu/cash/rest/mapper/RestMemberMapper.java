package kr.co.gdu.cash.rest.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RestMemberMapper {
	String selectMemberId(String memberId);
}
