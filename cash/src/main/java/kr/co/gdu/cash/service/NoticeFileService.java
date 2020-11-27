package kr.co.gdu.cash.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.CashApplication;
import kr.co.gdu.cash.mapper.NoticeFileMapper;
import kr.co.gdu.cash.vo.NoticeFile;

@Service
@Transactional
public class NoticeFileService {
	@Autowired private NoticeFileMapper noticeFileMapper;
	
	public void removeNoticeFile(int noticeFileId) {
		NoticeFile noticeFile = noticeFileMapper.selectNoticeFileOne(noticeFileId);
		File file = new File(CashApplication.UPLOAD_PATH+noticeFile.getNoticeFileName());
		if (file.exists()) {
			file.delete();
		}
		
		noticeFileMapper.deleteNoticeFile(noticeFileId);
	}
}
