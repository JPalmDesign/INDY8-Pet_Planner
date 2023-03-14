package com.indy8.petplanner.users;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.concurrent.atomic.AtomicLong;

public class UsersController {
    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/pet")
    public UserByIdResponse getUserById(@RequestParam(value = "id") String id) {
        return new UserByIdResponse("UUID", "Rory");
    }
}
