package com.project.social.dao;

import org.apache.ibatis.annotations.Param;

import com.project.social.vo.User;

public interface UserMapper {
	
	public int insertUser(@Param("User") User vo, @Param("interest") String interest);
	public User findUser(User vo);
	public int updateUser(@Param("User") User vo, @Param("interest") String interest);

}
