package com.example.demo02.contorller;

import com.example.demo02.domain.User;
import com.example.demo02.service.UserService;
import com.example.demo02.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RegisterController {

    @Autowired
    private UserServiceImpl userService;

    @GetMapping(value = "/register")
    public String register(Model model){
        model.addAttribute("user",new User());
        return "register";
    }

    @RequestMapping(value = "/doRegister")
    public String doRegister(@ModelAttribute User user){
        if(userService.findByUsername(user.getUsername())!=null){
            return "failed";
        }
        User newUser = new User();
        newUser.setUsername(user.getUsername());
        newUser.setPassword(user.getPassword());
        userService.save(newUser);
        return "login1";
    }

    @GetMapping("/isNameExist")
    @ResponseBody
    public String isNameExist(@RequestParam("username") String username){
        if(userService.findByUsername(username)!=null){
            return "用户名已存在";
        }
        return null;
    }
}
