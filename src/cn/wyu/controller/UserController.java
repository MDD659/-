package cn.wyu.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.wyu.pojo.UserInf;
import cn.wyu.service.UserInfService;

@Controller
public class UserController {
	
	@Autowired
	private UserInfService userService;
	
	/**
	 * ��¼����
	 * @param loginname
	 * @param password
	 * @param session
	 * @param model
	 * @return
	 */
    @RequestMapping("/doLogin")
	public String doLogin(String loginname,String password,HttpSession session,Model model){
	System.out.println("loginname=="+loginname);
	System.out.println("password=="+password);
	UserInf userInf = userService.login(loginname);
	String loginInfo = "�û�������Ϊ�գ�";
	
	if(!"".equals(loginname)) {
		
	
	if(userInf!=null) {
		//���ж������Ƿ���ͬ
		if(password.equals(userInf.getPassword())) {
			//��½�ɹ�
			//���û���Ϣ���浽session�У����Թ�����ҳ�����
			session.setAttribute("username", userInf.getUsername());
			return "main";
		}else {
			loginInfo = "�Բ����������";
		}
	}else {
		loginInfo = "�Բ���û������û���";
		
	}
	}
	//����¼��Ϣ������request����
	model.addAttribute("loginInfo", loginInfo);
	//��½ʧ�ܻ��Ƿ��ص�¼����
		return "index";
		
	}
    /**
     * ע�Ṧ��
     * @param user
     * @return
     */

    @RequestMapping("/register")
    @ResponseBody
    public String userRegister(UserInf user) {
    	
    	user.setCreatedate(new Date());
    	System.out.println(user);
    	
    	String data = "";
    	int in = userService.register(user);
    	if(in>0) {
    		System.out.println("��ӳɹ���");
    		data="1";
    	}
    	
    	return data;
    }
    
    /**
     * ��ҳ��ѯ
     */
    @RequestMapping(value="/selectUser",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String selectByPage(int page,int rows) {
    	
    	System.out.println("page=="+page);
    	System.out.println("rows=="+rows);
    	PageHelper.startPage(page,rows);
    	List<UserInf> list = userService.selectUserByPage();
    	PageInfo pageInfo = new PageInfo<>(list);
    	//���list����
    	list.forEach(li->System.out.println(li));
    	//�����ݷ��ص�ǰ�Σ���Ҫ��jsons���ݣ�total���ܼ�¼����list���ϣ����ݣ�
    	int total = (int) pageInfo.getTotal();
    	System.out.println("total=="+total);
    	/**
    	 *     	����json���ݣ�ʲô��json���ݣ���ʵ���ǹ̶���ʽ���ַ���{},[],:
    	 *     һ���ڹ���json����ʱ �����õ��������ߣ��ȽϺ��õĹ��ߣ�����ģ�fastjson
    	 */

    	String jsonlist = JSON.toJSONString(list);
    	jsonlist = JSON.toJSONStringWithDateFormat(list, "yyyy-MM-dd HH:mm:ss");
    	System.out.println("listjson=="+jsonlist);
    	String json = "{\"total\":" + total + ",\"rows\":" + jsonlist +"}";
    	
    	return json;
    	
    }
    
    @RequestMapping(value="/deleteById/{id}",produces = {"html/text;charset=UTF-8"})
    @ResponseBody
    public String deleteById(@PathVariable int id) {
    	System.out.println("id--->"+id);
    	
    	int in = userService.deleteById(id);
    	System.out.println("in=="+in);
    	String info = "ɾ��ʧ�ܣ�";
    	
    	if(in>0) {
    		System.out.println("ɾ���ɹ���");
    		info = "ɾ���ɹ���";
    	}
    	return info;
    }
    
    
    @RequestMapping(value="/updateUser")
    @ResponseBody
    public String updateUser(UserInf userInf) {
    	String data = "";
    	System.out.println("-->"+userInf);
    	int in = userService.updateUser(userInf);
    	if(in>0) {
    		System.out.println("�޸ĳɹ���");  
    		data="1";
    	}
    	
    	
    	return data;
    } 
}
