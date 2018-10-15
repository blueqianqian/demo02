package com.example.demo02.service;

import com.example.demo02.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserService {
    void save(User user);

    User findByUsername(String username);

    User findByUsernameAndPassword(String username,String password);

    List<User> findAll();
}
