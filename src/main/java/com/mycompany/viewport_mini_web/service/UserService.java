package com.mycompany.viewport_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.viewport_mini_web.dao.UserDao;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Users;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService {
	@Resource
	private UserDao userDao;
	
	//회원가입
	public void signup(Users user) {
		log.info("실행");
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		user.setUpassword(passwordEncoder.encode(user.getUpassword()));
		user.setUenabled(true);
		userDao.insert(user);
	}
	
	//이메일 중복체크
	  public int checkDuplicateEmail(String uemail) {
		    int result = userDao.checkDuplicateEmail(uemail);
		    return result;
		  }

	// 임시 비밀번호 발급 메서드
	   public String generateTemporaryPassword(int length) {
	       String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";
	       StringBuilder builder = new StringBuilder();
	       for (int i = 0; i < length; i++) {
	           int randomIndex = (int) (Math.random() * chars.length());
	           builder.append(chars.charAt(randomIndex));
	       }
	       return builder.toString();
	   }
	   
	   
	   
	    // uemail, uname, uphonenumber로 비밀번호 찾기 기능
	    public String findPassword(String uemail, String uname, String uphonenumber) {
	        // 이메일, 이름, 전화번호로 사용자 조회
	        Users user = getUserByEmailAndNameAndPhoneNumber(uemail, uname, uphonenumber);
	        if (user != null) { //사용자가 존재하면
	            // 임시 비밀번호 생성
	            String temporaryPassword = generateTemporaryPassword(10);
	            // 임시 비밀번호로 사용자 비밀번호 업데이트
	            updatePw(user, temporaryPassword);
	            return temporaryPassword;
	        } else { // 사용자가 없으면 null 반환
	            return null; 
	        }
	    }

		
	    // 이메일, 이름 및 전화번호로 사용자 조회
	    public Users getUserByEmailAndNameAndPhoneNumber(String uemail, String uname, String uphonenumber) {
	        return userDao.selectByEmailAndNameAndPhoneNumber(uemail, uname, uphonenumber);
	    }
	   
	    
	   // 임시 비밀번호를 암호화해서 DB에 업데이트
		public void updatePw(Users user, String temporaryPassword) {
			//암호화
		    PasswordEncoder passwordEncoder =  PasswordEncoderFactories.createDelegatingPasswordEncoder();
		    String encodedPassword = passwordEncoder.encode(temporaryPassword);
		        user.setUpassword(encodedPassword);
		        userDao.updatePw(user);
		    }


	 /* --------------------------------------------------*/
	  
	  
	public Users getUser(String uemail) {
		Users user = userDao.selectByUemail(uemail);
		return user;
	}

	
	public void createUser(Users user) {
		int rowNum = userDao.insert(user);
		log.info("rowNum: " + rowNum + ", bno: " + user.getUname());
	}

	public List<Users> getUserList(Pager pager) {
		List<Users> userList = userDao.selectByPage(pager);
		return userList;
	}

	public int getTotalUserRows() {
		int totalRows = userDao.count();
		return totalRows;
	}


	public List<Users> getUserList() {
		List<Users> users = userDao.selectuserAll();
		return users;
	}

	public void updateUserData(Users user) {
		int rowNum = userDao.update(user);

	}

	public void removeUser(int usid) {
		int rowNum = userDao.deleteByUsid(usid);

	}



	public void updateMyPageData(Users user) {
		int rowNum = userDao.updateByUemail(user);

	}

	public void changePassword(String uemail, String upassword) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		upassword = passwordEncoder.encode(upassword);
		int rowNum = userDao.updatePasswordByUemail(uemail, upassword);
	}

	public boolean checkPassword(String rawPassword, String encodedPassword) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return passwordEncoder.matches(rawPassword, encodedPassword);
	}

	public void removeUser(String uemail) {
		int rowNum = userDao.deleteByUemail(uemail);

	}

	public String getUserByUserId(int quserid) {
		String uemail = userDao.selectByUsid(quserid);
		return uemail;
	}

	public int getUserCount() {
		int userCount = userDao.getUserCount();
		return userCount;
	}

	public String getUserByStuserId(int stuserid) {
		String uemail = userDao.selectByUsid(stuserid);
		return uemail;
	}

}



