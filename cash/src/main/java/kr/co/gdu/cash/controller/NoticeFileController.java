package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import kr.co.gdu.cash.service.NoticeFileService;

@Controller
public class NoticeFileController {
	@Autowired private NoticeFileService noticeFileService;
	
	@GetMapping("/admin/removeNoticeFile/{noticeId}/{noticeFileId}")
	public String removeNoticeFile(@PathVariable(value="noticeId") int noticeId, @PathVariable(value="noticeFileId") int noticeFileId) {
		noticeFileService.removeNoticeFile(noticeFileId);
		
		return "redirect:/admin/modifyNotice/"+noticeId;
	}
}
