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

import cn.wyu.pojo.EmployeeInf;
import cn.wyu.service.EmployeeInfService;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeInfService employeeService;
	
    /**
     * 
     * @param 
     * @return
     */

    @RequestMapping("/AddEmployeeServlet")
    @ResponseBody
    public String employeeRegister(EmployeeInf employeeInf) {
    	
    	
    	System.out.println(employeeInf);
    	
    	String data = "";
    	int in = employeeService.registerEmployee(employeeInf);
    	
    	if(in>0) {
    		System.out.println("添加成功");
    		data="1";
    	}
    	
    	return data;
    }
    
    /**
     * 查询
     */
    @RequestMapping(value="/selectEmployee",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String selectEmployeeByPage(int page,int rows) {
    	System.out.println("page=="+page);
    	System.out.println("rows=="+rows);
    	PageHelper.startPage(page,rows);
    	List<EmployeeInf> list = employeeService.selectEmployeeByPage();
    	PageInfo<EmployeeInf> pageInfo = new PageInfo<>(list);
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
    
    @RequestMapping(value="/deleteEmployeeById/{id}",produces = {"html/text;charset=UTF-8"})
    @ResponseBody
    public String deleteEmployeeById(@PathVariable int id) {
    	System.out.println("id--->"+id);
    	
    	int in = employeeService.deleteEmployeeById(id);
    	System.out.println("in=="+in);
    	String info = "ɾ��ʧ�ܣ�";
    	
    	if(in>0) {
    		System.out.println("删除");
    		info = "删除成功";
    	}
    	return info;
    }
    
    @RequestMapping(value="/updateEmployee")
    @ResponseBody
    public String updateDept(EmployeeInf employeeInf) {
    	String data = "";
    	System.out.println("-->"+employeeInf);
    	int in = employeeService.updateEmployee(employeeInf);
    	if(in>0) {
    		System.out.println("�޸ĳɹ���");  
    		data="1";
    	}
    	
    	
    	return data;
    }

}
