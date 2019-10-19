package cn.wyu.mapper;

import cn.wyu.pojo.EmployeeInf;
import cn.wyu.pojo.EmployeeInfExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeInfMapper {
    int countByExample(EmployeeInfExample example);

    int deleteByExample(EmployeeInfExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EmployeeInf record);

    int insertSelective(EmployeeInf record);

    List<EmployeeInf> selectByExample(EmployeeInfExample example);

    EmployeeInf selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EmployeeInf record, @Param("example") EmployeeInfExample example);

    int updateByExample(@Param("record") EmployeeInf record, @Param("example") EmployeeInfExample example);

    int updateByPrimaryKeySelective(EmployeeInf record);

    int updateByPrimaryKey(EmployeeInf record);
}