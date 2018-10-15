package com.example.demo02.contorller;


import com.example.demo02.domain.User;
import com.example.demo02.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    UserServiceImpl userService;

    @RequestMapping("/login")
    public String login(){
        return "login1";
    }

    @GetMapping("/doLogin")
    public String doLogin(@ModelAttribute User user){
        if(userService.findByUsernameAndPassword(user.getUsername(),user.getPassword())==null)
            return "failed";
        return "success";
    }

    @GetMapping("/isRight")
    @ResponseBody
    public  String isUsernameAndPassword(@RequestParam("username") String username,@RequestParam("password") String password){
        if(userService.findByUsernameAndPassword(username,password)!=null){
            return "登录成功";
        }
        return "登录失败";
    }

}
