package cn.wyu.mapper;

import cn.wyu.pojo.DeptInf;
import cn.wyu.pojo.DeptInfExample;
import cn.wyu.pojo.UserInfExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeptInfMapper {
    int countByExample(DeptInfExample example);

    int deleteByExample(DeptInfExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(DeptInf record);
    
    int insertSelective(DeptInf record);

    List<DeptInf> selectByExample(DeptInfExample example);

    DeptInf selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") DeptInf record, @Param("example") DeptInfExample example);

    int updateByExample(@Param("record") DeptInf record, @Param("example") DeptInfExample example);

    int updateByPrimaryKeySelective(DeptInf record);

    int updateByPrimaryKey(DeptInf record);

	int updateByExample(DeptInf depthInf, UserInfExample example);

	
}