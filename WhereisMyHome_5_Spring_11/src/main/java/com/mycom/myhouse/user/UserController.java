package com.mycom.myhouse.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.myhouse.user.dto.UserDto;
import com.mycom.myhouse.user.dto.UserResultDto;

@RestController
public class UserController {
	
	@Autowired
	UserService userService;
	
	private final int SUCCESS = 1;
	
	@PostMapping("users")
	public ResponseEntity<Map<String, String>> insertUser(UserDto userDto) {
		UserResultDto userResultDto = userService.insertUser(userDto);
		Map<String, String> map = new HashMap<>();
		
		if (userResultDto.getResult() == SUCCESS) {
			map.put("result", "success");
			return new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
		} else {
			map.put("result", "fail");
			return new ResponseEntity<Map<String, String>>(map, HttpStatus.NOT_FOUND);
		}
	}
	
	@PutMapping("users/{userEmail}")
	private ResponseEntity<UserResultDto> updateUser(UserDto userDto) {
		UserResultDto userResultDto = userService.updateUser(userDto);
		
		if (userResultDto.getResult() == SUCCESS) {
			return new ResponseEntity<UserResultDto>(userResultDto, HttpStatus.OK);
		} else {
			return new ResponseEntity<UserResultDto>(userResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@DeleteMapping("users/{userEmail}")
	private ResponseEntity<UserResultDto> boardDelete(@PathVariable String userEmail) {
		
		// 서비스 호출
		UserResultDto userResultDto = userService.deleteUser(userEmail);
		
		if (userResultDto.getResult() == SUCCESS) {
			return new ResponseEntity<UserResultDto>(userResultDto, HttpStatus.OK);
		} else {
			return new ResponseEntity<UserResultDto>(userResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("users/{userEmail}")
	private UserDto getUser(@PathVariable String userEmail) {
		return userService.getUser(userEmail);
	}
	
}
