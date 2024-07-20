package com.mycompany.viewport_mini_web.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Users;

@Mapper
public interface UserDao {
	
  public int insert(Users user);
  
  public int checkDuplicateEmail(String uemail);

  public void updatePw(Users user);

  public Users selectByEmailAndNameAndPhoneNumber(@Param("uemail")String uemail, @Param("uname")String uname, @Param("uphonenumber")String uphonenumber);
  
  /*  public String findPassword(String uemail, String uname, String uphonenumber);
   */
  
  public List<Users> selectByPage(Pager pager);

  public int count();

  public Users selectByUemail(String uemail);

  public List<Users> selectuserAll();

  public int update(Users user);

  public int deleteByUsid(int usid);

  public int updateByUemail(Users user);

  public int updatePasswordByUemail(@Param("uemail") String uemail,@Param("upassword") String upassword);

  public int deleteByUemail(String uemail);

  public String selectByUsid(int usid);

  public int getUserCount();



}
