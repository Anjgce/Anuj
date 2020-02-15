package com.spring.boot.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.boot.model.User;
import com.spring.boot.service.UserService;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@GetMapping("")
	public String hello() {
		return "Hello";
	}
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/saveuser")
	public String saveUser(@RequestParam String username,
							@RequestParam String firstname,
							@RequestParam String lastname,
							@RequestParam int  age,
							@RequestParam String password) {
		
		User user=new User(username,firstname,lastname,age,password);
		userService.saveMyUser(user);
		return "User Saved";
	}

}
