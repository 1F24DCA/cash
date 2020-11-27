package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.NoticeCommentMapper;
import kr.co.gdu.cash.vo.NoticeComment;

@Service
@Transactional
public class NoticeCommentService {
	@Autowired private NoticeCommentMapper noticeCommentMapper;
	
	public void addNoticeComment(NoticeComment noticeComment) {
		noticeCommentMapper.insertNoticeComment(noticeComment);
	}
	
	public void removeNoticeComment(int noticeCommentId) {
		noticeCommentMapper.deleteNoticeComment(noticeCommentId);
	}
}
