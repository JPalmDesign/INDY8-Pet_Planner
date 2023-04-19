package com.indy8.petplanner.config;

import com.indy8.petplanner.appointments.AppointmentByIdResponse;
import com.indy8.petplanner.appointments.CreateNewAppointmentRequest;
import com.indy8.petplanner.appointments.CreateNewAppointmentResponse;
import com.indy8.petplanner.domain.Appointment;

public class AppointmentMapper {
    public AppointmentByIdResponse mapAppointmentToAppointmentByIdResponse(Appointment appointment) {
        var response = new AppointmentByIdResponse();

        response.setId(appointment.getId());
        response.setAppointmentType(appointment.getAppointmentType());
        response.setStartTime(appointment.getStartDateTime());
        response.setEndTime(appointment.getEndDateTime());
        response.setCostPerUnit(appointment.getCostPerUnit());
        response.setTotalCost(appointment.totalCost());

        return response;
    }
    public CreateNewAppointmentResponse mapAppointmentToCreateNewAppointmentResponse(Appointment appointment) {
        var response = new CreateNewAppointmentResponse();

        response.setId(appointment.getId());
        response.setAppointmentType(appointment.getAppointmentType());
        response.setStartTime(appointment.getStartDateTime());
        response.setEndTime(appointment.getEndDateTime());
        response.setCostPerUnit(appointment.getCostPerUnit());
        response.setTotalCost(appointment.totalCost());

        return response;
    }
    public Appointment mapCreateNewAppointmentRequestToAppointment(CreateNewAppointmentRequest request) {
        var appointment = new Appointment();

        appointment.setAppointmentType(request.getAppointmentType());
        appointment.setStartDateTime(request.getStartTime());
        appointment.setEndDateTime(request.getEndTime());
        appointment.setCostPerUnit(request.getCostPerUnit());

        return appointment;
    }
}
