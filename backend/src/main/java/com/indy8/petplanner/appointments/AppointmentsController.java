package com.indy8.petplanner.appointments;

import com.indy8.petplanner.pets.PetByIdResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.concurrent.atomic.AtomicLong;

public class AppointmentsController {
    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/pet")
    public AppointmentByIdResponse getAppointmentById(@RequestParam(value = "id") String id) {
        return new AppointmentByIdResponse("UUID", LocalDate.of(2023,3,15));
    }
}
