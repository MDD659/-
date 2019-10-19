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
		//ͨ��example����Criteria���󣬽������󶨵�������
		UserInfExample.Criteria criteria = example.createCriteria();
		
		//ͨ����¼����ѯ����
		criteria.andLoginnameEqualTo(loginname);
		
		
		List<UserInf> list = userMapper.selectByExample(example);
		
		//�жϼ����Ƿ�Ϊ��
		if(list != null&&list.size()>0) {//˵����ѯ��������
			return list.get(0);//���ز�ѯ���Ķ���
		}
		//����null˵��û���û�
		return null;
	}
   //2.����û�
	@Override
	public int register(UserInf user) {
		
		return userMapper.insert(user);//�������;
	}
	
	
	//3.��ҳ��ѯ����
	@Override
	public List<UserInf> selectUserByPage() {
		
		UserInfExample example = new UserInfExample();
		
		return userMapper.selectByExample(example);
	}
	
	
	//ɾ���û�
	@Override
	public int deleteById(int id) {
		
		
		return userMapper.deleteByPrimaryKey(id);
	}
	
	//�޸�����
	@Override
	public int updateUser(UserInf userinf) {
	
		
		UserInfExample example = new UserInfExample();
		
		UserInfExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(userinf.getId());
		
		return userMapper.updateByExample(userinf, example);
	}

	

}
