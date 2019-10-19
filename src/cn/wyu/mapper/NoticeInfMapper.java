package cn.wyu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.wyu.pojo.NoticeInf;
import cn.wyu.pojo.NoticeInfExample;
import cn.wyu.pojo.UserInfExample;

public interface NoticeInfMapper {
	
	 
		int countByExample(NoticeInfExample example);

	    int deleteByExample(NoticeInfExample example);

	    int deleteByPrimaryKey(Integer id);

	    int insert(NoticeInf record);
	    
	    int insertSelective(NoticeInf record);

	    List<NoticeInf> selectByExample(NoticeInfExample example);

	    NoticeInf selectByPrimaryKey(Integer id);

	    int updateByExampleSelective(@Param("record") NoticeInf record, @Param("example") NoticeInfExample example);

	    int updateByExample(@Param("record") NoticeInf record, @Param("example") NoticeInfExample example);

	    int updateByPrimaryKeySelective(NoticeInf record);

	    int updateByPrimaryKey(NoticeInf record);

		int updateByExample(NoticeInf depthInf, UserInfExample example);

}
