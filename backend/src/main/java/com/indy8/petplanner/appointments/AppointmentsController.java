package com.indy8.petplanner.appointments;

import com.indy8.petplanner.config.AppointmentMapper;
import com.indy8.petplanner.dataaccess.AppointmentRepository;
import com.indy8.petplanner.domain.Appointment;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;

@RestController
public class AppointmentsController {
    private final AppointmentRepository appointmentRepository;
    private final AppointmentMapper appointmentMapper;

    public AppointmentsController(AppointmentRepository appointmentRepository, AppointmentMapper appointmentMapper) {
        this.appointmentRepository = appointmentRepository;
        this.appointmentMapper = appointmentMapper;
    }

    @GetMapping("/appointment/{id}")
    public AppointmentByIdResponse getAppointmentById(@RequestParam(value = "id") Integer id) {
        var dbResult = appointmentRepository.findById(id);
        if (dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "entity not found"
            );
        }
        return this.appointmentMapper.mapAppointmentToAppointmentByIdResponse(dbResult.get());
    }

    @PostMapping("/appointment")
    public CreateNewAppointmentResponse createNewAppointment(@RequestBody CreateNewAppointmentRequest createNewAppointmentRequest){
        var appointment = this.appointmentMapper.mapCreateNewAppointmentRequestToAppointment(createNewAppointmentRequest);
        appointmentRepository.save(appointment);
        var response = this.appointmentMapper.mapAppointmentToCreateNewAppointmentResponse(appointment);
        return response;
    }

    @PutMapping("/appointment/{id}")
    public UpdateAppointmentResponse updateAppointment(@PathVariable Integer id, @RequestBody UpdateAppointmentRequest updateAppointmentRequest){
        var dbResult = appointmentRepository.findById(id);
        if (dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "entity not found"
            );
        }
        var appointment = dbResult.get();
        updateAppointment(updateAppointmentRequest, appointment);
        appointmentRepository.save(appointment);
        return this.appointmentMapper.mapAppointmentToUpdateAppointmentResponse(appointment);
    }

    private static void updateAppointment(UpdateAppointmentRequest updateAppointmentRequest, Appointment appointment) {
        //appointment.setPetId(updateAppointmentRequest.getPetId());
        appointment.setStartDateTime(updateAppointmentRequest.getStartDateTime());
        appointment.setEndDateTime(updateAppointmentRequest.getEndDateTime());
        appointment.setAppointmentType(updateAppointmentRequest.getAppointmentType());
        appointment.setCostPerUnit(updateAppointmentRequest.getCostPerUnit());
    }
}
