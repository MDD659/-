package cn.wyu.service;

import java.util.List;

import cn.wyu.pojo.UserInf;

public interface UserInfService {
	//1.�û���¼
	public UserInf login(String loginname);
    //2.����û�
	public int register(UserInf user);
	//3.��ҳ��ѯ�û�
	public List<UserInf> selectUserByPage();
	//4.ͨ��idɾ���û�
	public int deleteById(int id);
	//5.�޸�����
	public int updateUser(UserInf userinf);
}
