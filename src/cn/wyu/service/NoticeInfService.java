package cn.wyu.service;

import java.util.List;

import cn.wyu.pojo.NoticeInf;

public interface NoticeInfService {
	
		//添加公告
		public int registernotice(NoticeInf noticeInf);
		//查询公告列表
		public List<NoticeInf> selectNoticeByPage();
		//删除公告
		public int deleteNoticeById(int id);
		//修改公告
		public int updateNotice(NoticeInf noticeInf);

}
