package com.theharmm.mapper;

import org.apache.ibatis.annotations.Select;

public interface TestMapper {

	@Select("SELECT * FROM EMP")
	public String getTime();
}