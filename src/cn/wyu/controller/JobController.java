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

import cn.wyu.pojo.JobInf;
import cn.wyu.service.JobInfService;

@Controller
public class JobController {
	
	@Autowired
	private JobInfService jobService;
	
	
    /**
     * 
     * @param 
     * @return
     */

    @RequestMapping("/AddJobServlet")
    @ResponseBody
    public String jobRegister(JobInf jobInf) {
    	
    	
    	System.out.println(jobInf);
    	
    	String data = "";
    	int in = jobService.registerjob(jobInf);
    	if(in>0) {
    		System.out.println("��ӳɹ���");
    		data="1";
    	}
    	
    	return data;
    }
    
    /**
     * 查询
     */
    @RequestMapping(value="/selectJob",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String selectJobByPage(int page,int rows) {
    	System.out.println("page=="+page);
    	System.out.println("rows=="+rows);
    	PageHelper.startPage(page,rows);
    	List<JobInf> list = jobService.selectJobByPage();
    	PageInfo<JobInf> pageInfo = new PageInfo<>(list);
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
    
    @RequestMapping(value="/deleteJobById/{id}",produces = {"html/text;charset=UTF-8"})
    @ResponseBody
    public String deleteJobById(@PathVariable int id) {
    	System.out.println("id--->"+id);
    	
    	int in = jobService.deleteJobById(id);
    	System.out.println("in=="+in);
    	String info = "ɾ��ʧ�ܣ�";
    	
    	if(in>0) {
    		System.out.println("ɾ���ɹ���");
    		info = "ɾ���ɹ���";
    	}
    	return info;
    }
    
    
    @RequestMapping(value="/updateJob")
    @ResponseBody
    public String updateJob(JobInf jobInf) {
    	String data = "";
    	System.out.println("-->"+jobInf);
    	int in = jobService.updateJob(jobInf);
    	if(in>0) {
    		System.out.println("�޸ĳɹ���");  
    		data="1";
    	}
    	
    	
    	return data;
    }

}
