package com.indy8.petplanner.pets;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PetsController {

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/pet")
    public PetByIdResponse getPetById(@RequestParam(value = "id") String id) {
        return new PetByIdResponse("UUID", "Rory");
    }
}
