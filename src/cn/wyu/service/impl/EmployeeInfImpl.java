package cn.wyu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wyu.mapper.EmployeeInfMapper;
import cn.wyu.pojo.EmployeeInf;
import cn.wyu.pojo.EmployeeInfExample;
import cn.wyu.service.EmployeeInfService;

@Service
public class EmployeeInfImpl implements EmployeeInfService{

	@Autowired
	private EmployeeInfMapper employeeMapper;
	
	/**
	 * 注册员工
	 */
	@Override
	public int registerEmployee(EmployeeInf employeeInf) {
		
		return employeeMapper.insert(employeeInf);
	}

	/**
	 * 查询员工列表
	 */
	@Override
	public List<EmployeeInf> selectEmployeeByPage() {

		EmployeeInfExample example = new EmployeeInfExample();
		
		return employeeMapper.selectByExample(example);
	}

	/**
	 * 删除
	 */
	@Override
	public int deleteEmployeeById(int id) {
		
		return employeeMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 修改员工信息
	 */
	@Override
	public int updateEmployee(EmployeeInf employeeInf) {
		
		EmployeeInfExample example = new EmployeeInfExample();
		
		EmployeeInfExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(employeeInf.getId());
		
		return employeeMapper.updateByExample(employeeInf, example);
	}

}
