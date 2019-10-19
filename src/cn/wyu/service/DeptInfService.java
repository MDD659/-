package cn.wyu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.wyu.pojo.DeptInf;

@Service
public interface DeptInfService {
	
	//注册部门
	public int registerdept(DeptInf depthInf);
	//查询部门列表
	public List<DeptInf> selectDeptByPage();
	//删除部门
	public int deleteDeptById(int id);
	//修改部门
	public int updateDept(DeptInf depthInf);

}
