package com.rentlist.web.controller;


import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rentlist.web.model.User;
import com.rentlist.web.service.userService;

import jakarta.servlet.http.HttpSession;

@Controller
public class loginController {
	
	@Autowired
	private userService us;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
//	@PostMapping("/login")
//	public String processLogin(@ModelAttribute("login") User u, Model model,HttpSession session) {
//        String uname = u.getUsername();
//        String password = u.getPassword();
//
//            User obj = us.getByUname(uname);
//            if (obj != null && obj.getPassword().equals(password)) {
//            	 session.setAttribute("loggedInUser", obj.getName());
//                return "redirect:/";
//            }
//		return "redirect:/signup";
//       }
	
	@PostMapping("/login")
	public String login(@ModelAttribute("log") User u, Model m, HttpSession s) {
		String uname = u.getUsername();
		String pass = u.getPassword();
		User uobj = us.login(uname, pass);
		if(uobj == null) {
			m.addAttribute("msg", "Invalid Creditials");
			return "login";
		}
		else if(uobj.getUsername().equals(uname) && uobj.getPassword().equals(pass)) {
			s.setAttribute("currentUser", uobj);
			return "redirect:/";
		} 
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession s) {
		s.removeAttribute("currentUser");
		return "redirect:/";
	}
}
