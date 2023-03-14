package com.indy8.petplanner.appointments;

import java.time.LocalDate;

public record AppointmentByIdResponse(String id, LocalDate startDate) {
}
