package com.misha.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.misha.model.SitterRegistration;
import com.misha.service.SitterService;

@Controller
public class AppController {
	
	@Autowired
	private SitterService service;
	
	public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/webapp/images";
	
	@GetMapping(value = {"/","/home"})
	public String homePage() {
		return "welcome";
	}
	
	@GetMapping("/register")
	public String dogSitterRegistration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		 return "registrationPage";
	}
	
	@GetMapping("/search")
	public String searchSitter(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		 return "searchSitter";
	}
	
	@PostMapping("/saveDogSitter")
	public String saveDogSitterReg(@ModelAttribute("dogsitter") SitterRegistration registration, BindingResult bindingResult, @RequestParam("logo") MultipartFile file) {
		
		StringBuilder fileNames = new StringBuilder();
		String filename=registration.getContactname() + file.getOriginalFilename().substring(file.getOriginalFilename().length()-4);
		Path fileNameAndPath =Paths.get(uploadDirectory,filename);
		try{
		Files.write(fileNameAndPath, file.getBytes());
		}catch (IOException e) {
		e.printStackTrace();
		}
		registration.setLogo(filename);
		
		service.saveSitter(registration);
		//request.setAttribute("mode", "MODE_HOME");
		return "welcome";
	}

}
