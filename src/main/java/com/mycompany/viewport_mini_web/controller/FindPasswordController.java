package com.mycompany.viewport_mini_web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FindPasswordController {
	
    @Autowired
    private UserService userService;

    // 비밀번호 찾기 모달을 열기 위한 GET 요청 핸들러
    @GetMapping("/forgotPassword")
    public String showForgotPasswordModal() {
        return "forgotPasswordModal";
    }
    	
    
    // 비밀번호 찾기 요청을 처리하는 POST 요청 핸들러
    @PostMapping("/findPw")
    public ResponseEntity<?> findPassword(@RequestBody Users userData) {
        log.info("비밀번호 찾기 실행");
        log.info(userData.getUemail());
        // 서비스를 사용하여 데이터베이스에서 사용자 정보 조회
        Users user = userService.getUserByEmailAndNameAndPhoneNumber(userData.getUemail(), userData.getUname(), userData.getUphonenumber());
        // 위의 조회된 사용자 정보와 전달된 DTO의 데이터를 비교하여 일치 여부 확인
        if (user != null && user.getUemail().equals(userData.getUemail()) &&  user.getUname().equals(userData.getUname()) &&  user.getUphonenumber().equals(userData.getUphonenumber())) {
            String temporaryPassword = userService.generateTemporaryPassword(10); // 임시 비밀번호 생성
            userService.updatePw(user, temporaryPassword); // 임시 비밀번호로 업데이트
            
            // 응답에 임시 비밀번호를 포함하는 JSON 생성
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("temporaryPassword", temporaryPassword);
            return ResponseEntity.ok(response);
        } else { //조건과 맞지 않는 경우 에러문 출력하는 방법 잘 몰랐음. message 활용하는 방법.
        	   Map<String, Object> response = new HashMap<>();
               response.put("success", false);
               response.put("message", "입력하신 정보와 일치하는 사용자를 찾을 수 없습니다. \n올바른 정보를 입력해 주세요.");
               return ResponseEntity.badRequest().body(response);
       /*     return ResponseEntity.badRequest().build();*/  
        }
    }
}

/*   @PostMapping("/findPw")
    public ResponseEntity<?> findPassword(@RequestBody Users userData) {
	
    	 // 서비스를 사용하여 데이터베이스에서 사용자 정보 조회
        Users user = userService.getUser(userData.getUemail());
        // 조회된 사용자 정보와 전달된 DTO의 데이터를 비교하여 일치 여부 확인
        if (user != null && user.getUname().equals(userData.getUname())) {
            String temporaryPassword = userService.generateTemporaryPassword(10); // 임시 비밀번호 생성
            userService.updatePw(user, temporaryPassword); // 임시 비밀번호로 업데이트
            
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("temporaryPassword", temporaryPassword);
            return ResponseEntity.ok(response);
        } else {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            return ResponseEntity.ok(response);
        }
    }*/

