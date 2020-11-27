package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.NoticeCommentService;
import kr.co.gdu.cash.vo.NoticeComment;

@Controller
public class NoticeCommentController {
	@Autowired private NoticeCommentService noticeCommentService;
	
	@PostMapping("/admin/addNoticeComment")
	public String addNoticeComment(NoticeComment noticeComment) {
		noticeCommentService.addNoticeComment(noticeComment);
		
		return "redirect:/admin/noticeOne/"+noticeComment.getNoticeId();
	}
	
	@GetMapping("/admin/removeNoticeComment/{noticeId}/{noticeCommentId}")
	public String removeNoticeComment(@PathVariable(value="noticeId") int noticeId, @PathVariable(value="noticeCommentId") int noticeCommentId) {
		noticeCommentService.removeNoticeComment(noticeCommentId);
		
		return "redirect:/admin/noticeOne/"+noticeId;
	}
}
