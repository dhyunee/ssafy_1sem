package com.mycom.myhouse.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.myhouse.user.UserService;
import com.mycom.myhouse.user.dto.UserDto;


@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String home() {
		return "index.html";
	}
	
	@PostMapping(value = "/login")
	public ResponseEntity<Map<String, String>> login(UserDto dto, HttpSession session) {
		
		UserDto userDto = userService.loginUser(dto);
		Map<String, String> map = new HashMap<>();
		
		if (userDto != null) { // 로그인 성공
			// session에 userDto를 저장
			// client에게 성공 결과를 json으로 전달
			session.setAttribute("userDto", userDto);
			map.put("result", "success");
			
			//html로 client 를 구헝하므로 html에서 server sessioni에 접근X
			//로그인 성공 직후에 client에게 client가 필요로 하는 사용자 정보를 내려주어야 한다.
			map.put("useName", userDto.getUserName());
	
			return new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
		}
		// 로그인 실패
		map.put("result", "fail");
		return new ResponseEntity<Map<String, String>>(map, HttpStatus.NOT_FOUND);
	}
	
	
	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
		return "redirect:/";
	}
	
	
}
