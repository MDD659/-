package cn.wyu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.wyu.pojo.DeptInf;
import cn.wyu.service.DeptInfService;

@Controller
public class DeptController {
	
	@Autowired
	private DeptInfService deptService;
	
	
    /**
     * 
     * @param 
     * @return
     */

    @RequestMapping("/AddDeptServlet")
    @ResponseBody
    public String deptRegister(DeptInf deptInf) {
    	
    	
    	System.out.println(deptInf);
    	
    	String data = "";
    	int in = deptService.registerdept(deptInf);
    	if(in>0) {
    		System.out.println("��ӳɹ���");
    		data="1";
    	}
    	
    	return data;
    }
    
    /**
     * ��ҳ��ѯ
     */
    @RequestMapping(value="/selectDept",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String selectDeptByPage(int page,int rows) {
    	System.out.println("page=="+page);
    	System.out.println("rows=="+rows);
    	PageHelper.startPage(page,rows);
    	List<DeptInf> list = deptService.selectDeptByPage();
    	PageInfo<DeptInf> pageInfo = new PageInfo<>(list);
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
    
    @RequestMapping(value="/deleteDeptById/{id}",produces = {"html/text;charset=UTF-8"})
    @ResponseBody
    public String deleteDeptById(@PathVariable int id) {
    	System.out.println("id--->"+id);
    	
    	int in = deptService.deleteDeptById(id);
    	System.out.println("in=="+in);
    	String info = "ɾ��ʧ�ܣ�";
    	
    	if(in>0) {
    		System.out.println("ɾ���ɹ���");
    		info = "ɾ���ɹ���";
    	}
    	return info;
    }
    
    
    @RequestMapping(value="/updateDept")
    @ResponseBody
    public String updateDept(DeptInf deptInf) {
    	String data = "";
    	System.out.println("-->"+deptInf);
    	int in = deptService.updateDept(deptInf);
    	if(in>0) {
    		System.out.println("�޸ĳɹ���");  
    		data="1";
    	}
    	
    	
    	return data;
    }

}
