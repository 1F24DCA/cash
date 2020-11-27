package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.NoticeFile;

@Mapper
public interface NoticeFileMapper {
	NoticeFile selectNoticeFileOne(int noticeFileId);
	List<NoticeFile> selectNoticeFileByNoticeId(int noticeId);
	int insertNoticeFile(NoticeFile noticeFile);
	int deleteNoticeFile(int noticeFileId);
	int deleteNoticeFileByNoticeId(int noticeId);
}
