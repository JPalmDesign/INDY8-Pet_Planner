package com.indy8.petplanner.feedings;

import com.indy8.petplanner.pets.PetByIdResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.concurrent.atomic.AtomicLong;

public class FeedingsController {
    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/pet")
    public FeedingByIdResponse getFeedingById(@RequestParam(value = "id") String id) {
        return new FeedingByIdResponse("UUID");
    }
}
