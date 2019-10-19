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

import cn.wyu.pojo.NoticeInf;
import cn.wyu.service.NoticeInfService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeInfService noticeService;
	
	
    /**
     * 
     * @param 
     * @return
     */

    @RequestMapping("/AddNoticeServlet")
    @ResponseBody
    public String noticeRegister(NoticeInf noticeInf) {
    	
    	
    	System.out.println(noticeInf);
    	
    	String data = "";
    	int in = noticeService.registernotice(noticeInf);
    	if(in>0) {
    		System.out.println("��ӳɹ���");
    		data="1";
    	}
    	
    	return data;
    }
    
    /**
     * ��ҳ��ѯ
     */
    @RequestMapping(value="/selectNotice",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String selectNoticeByPage(int page,int rows) {
    	System.out.println("page=="+page);
    	System.out.println("rows=="+rows);
    	PageHelper.startPage(page,rows);
    	List<NoticeInf> list = noticeService.selectNoticeByPage();
    	PageInfo<NoticeInf> pageInfo = new PageInfo<>(list);
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
    
    @RequestMapping(value="/deleteNoticeById/{id}",produces = {"html/text;charset=UTF-8"})
    @ResponseBody
    public String deleteNoticeById(@PathVariable int id) {
    	System.out.println("id--->"+id);
    	
    	int in = noticeService.deleteNoticeById(id);
    	System.out.println("in=="+in);
    	String info = "ɾ��ʧ�ܣ�";
    	
    	if(in>0) {
    		System.out.println("ɾ���ɹ���");
    		info = "ɾ���ɹ���";
    	}
    	return info;
    }
    
    
    @RequestMapping(value="/updateNotice")
    @ResponseBody
    public String updateDept(NoticeInf noticeInf) {
    	String data = "";
    	System.out.println("-->"+noticeInf);
    	int in = noticeService.updateNotice(noticeInf);
    	if(in>0) {
    		System.out.println("�޸ĳɹ���");  
    		data="1";
    	}
    	
    	
    	return data;
    }

}
