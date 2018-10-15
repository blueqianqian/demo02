package com.example.demo02.repository;

import com.example.demo02.domain.User;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<User, ObjectId> {
    User findByUsername(String username);
    User findByUsernameAndPassword(String username,String password);
}
