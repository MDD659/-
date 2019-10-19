package cn.wyu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.wyu.pojo.JobInf;

@Service
public interface JobInfService {
	
		//注册职位
		public int registerjob(JobInf jobInf);
		//查询职位列表
		public List<JobInf> selectJobByPage();
		//删除职位
		public int deleteJobById(int id);
		//修改职位
		public int updateJob(JobInf jobInf);

}
