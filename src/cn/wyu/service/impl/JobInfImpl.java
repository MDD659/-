package cn.wyu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wyu.mapper.JobInfMapper;
import cn.wyu.pojo.JobInf;
import cn.wyu.pojo.JobInfExample;
import cn.wyu.service.JobInfService;

@Service
public class JobInfImpl implements JobInfService{

	@Autowired
	private JobInfMapper jobMapper;
	
	
	/**
	 * 添加
	 */
	@Override
	public int registerjob(JobInf jobInf) {
		return jobMapper.insert(jobInf);
	}

	/**
	 * 查询
	 */
	@Override
	public List<JobInf> selectJobByPage() {

		JobInfExample example = new JobInfExample();
		
		return jobMapper.selectByExample(example);
	}

	/**
	 * 删除
	 */
	@Override
	public int deleteJobById(int id) {
		return jobMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 修改
	 */
	@Override
	public int updateJob(JobInf jobInf) {

		JobInfExample example = new JobInfExample();
		
		JobInfExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(jobInf.getId());
		
		return jobMapper.updateByExample(jobInf, example);
	}

}
