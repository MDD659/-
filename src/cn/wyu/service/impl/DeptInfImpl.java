package cn.wyu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wyu.mapper.DeptInfMapper;
import cn.wyu.pojo.DeptInf;
import cn.wyu.pojo.DeptInfExample;
import cn.wyu.service.DeptInfService;


@Service
public class DeptInfImpl implements DeptInfService{
	
	@Autowired
	private DeptInfMapper deptMapper;

	@Override
	public int registerdept(DeptInf depthInf) {
		return deptMapper.insert(depthInf);
	}

	@Override
	public List<DeptInf> selectDeptByPage() {

		DeptInfExample example = new DeptInfExample();
		
		return deptMapper.selectByExample(example);
	}

	@Override
	public int deleteDeptById(int id) {
		return deptMapper.deleteByPrimaryKey(id);
	}

	
	
	@Override
	public int updateDept(DeptInf depthInf) {

		DeptInfExample example = new DeptInfExample();
		
		DeptInfExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(depthInf.getId());
		
		return deptMapper.updateByExample(depthInf, example);
	}

}
