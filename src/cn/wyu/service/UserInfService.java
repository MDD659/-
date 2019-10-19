package cn.wyu.service;

import java.util.List;

import cn.wyu.pojo.UserInf;

public interface UserInfService {
	//1.用户登录
	public UserInf login(String loginname);
    //2.添加用户
	public int register(UserInf user);
	//3.分页查询用户
	public List<UserInf> selectUserByPage();
	//4.通过id删除用户
	public int deleteById(int id);
	//5.修改数据
	public int updateUser(UserInf userinf);
}
