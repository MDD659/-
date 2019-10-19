package cn.wyu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wyu.mapper.NoticeInfMapper;
import cn.wyu.pojo.NoticeInf;
import cn.wyu.pojo.NoticeInfExample;
import cn.wyu.service.NoticeInfService;

@Service
public class NoticeInfImpl implements NoticeInfService{

	@Autowired
	private NoticeInfMapper noticeMapper;
	
	
	@Override
	public int registernotice(NoticeInf noticeInf) {
		return noticeMapper.insert(noticeInf);
	}

	@Override
	public List<NoticeInf> selectNoticeByPage() {

		NoticeInfExample example = new NoticeInfExample();
		
		return noticeMapper.selectByExample(example);
	}

	@Override
	public int deleteNoticeById(int id) {
		return noticeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateNotice(NoticeInf noticeInf) {

		NoticeInfExample example = new NoticeInfExample();
		
		NoticeInfExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(noticeInf.getId());
		
		return noticeMapper.updateByExample(noticeInf, example);
	}

}
