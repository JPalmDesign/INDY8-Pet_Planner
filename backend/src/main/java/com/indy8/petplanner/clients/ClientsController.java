package com.indy8.petplanner.clients;

import com.indy8.petplanner.pets.PetByIdResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.concurrent.atomic.AtomicLong;

public class ClientsController {
    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/client")
    public ClientByIdResponse getClientById(@RequestParam(value = "id") String id) {
        return new ClientByIdResponse("UUID", "Rory", "Palmer");
    }
}
