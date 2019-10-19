package cn.wyu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wyu.mapper.UserInfMapper;
import cn.wyu.pojo.UserInf;
import cn.wyu.pojo.UserInfExample;
import cn.wyu.service.UserInfService;

@Service
public class UserInfImpl implements UserInfService {
	@Autowired
	private UserInfMapper userMapper;

	@Override
	public UserInf login(String loginname) {
		
		UserInfExample example = new UserInfExample();
		//通过example创建Criteria对象，将条件绑定到对象中
		UserInfExample.Criteria criteria = example.createCriteria();
		
		//通过登录名查询数据
		criteria.andLoginnameEqualTo(loginname);
		
		
		List<UserInf> list = userMapper.selectByExample(example);
		
		//判断集合是否为空
		if(list != null&&list.size()>0) {//说明查询到数据了
			return list.get(0);//返回查询到的对象
		}
		//返回null说明没有用户
		return null;
	}
   //2.添加用户
	@Override
	public int register(UserInf user) {
		
		return userMapper.insert(user);//添加数据;
	}
	
	
	//3.分页查询数据
	@Override
	public List<UserInf> selectUserByPage() {
		
		UserInfExample example = new UserInfExample();
		
		return userMapper.selectByExample(example);
	}
	
	
	//删除用户
	@Override
	public int deleteById(int id) {
		
		
		return userMapper.deleteByPrimaryKey(id);
	}
	
	//修改数据
	@Override
	public int updateUser(UserInf userinf) {
	
		
		UserInfExample example = new UserInfExample();
		
		UserInfExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(userinf.getId());
		
		return userMapper.updateByExample(userinf, example);
	}

	

}
