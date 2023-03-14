package com.indy8.petplanner.documents;

import com.indy8.petplanner.pets.PetByIdResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.concurrent.atomic.AtomicLong;

public class DocumentsController {
    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/pet")
    public DocumentByIdResponse getDocumentById(@RequestParam(value = "id") String id) {
        return new DocumentByIdResponse("UUID");
    }
}
