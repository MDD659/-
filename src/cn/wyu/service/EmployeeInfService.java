package cn.wyu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.wyu.pojo.EmployeeInf;

@Service
public interface EmployeeInfService {
	
	
		//注册员工
		public int registerEmployee(EmployeeInf employeeInf);
		//查询员工列表
		public List<EmployeeInf> selectEmployeeByPage();
		//删除员工
		public int deleteEmployeeById(int id);
		//修改员工
		public int updateEmployee(EmployeeInf employeeInf);


}
