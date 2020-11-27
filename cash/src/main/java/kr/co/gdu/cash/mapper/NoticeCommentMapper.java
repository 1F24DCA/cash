package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.NoticeComment;

@Mapper
public interface NoticeCommentMapper {
	int insertNoticeComment(NoticeComment noticeComment);
	int deleteNoticeComment(int noticeCommentId);
	int deleteNoticeCommentByNoticeId(int noticeId);
}
