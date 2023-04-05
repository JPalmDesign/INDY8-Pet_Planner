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
        response.setStartTime(appointment.getStartTime());
        response.setEndTime(appointment.getEndTime());
        response.setCostPerUnit(appointment.getCostPerUnit());
        response.setTotalCost(appointment.totalCost());

        return response;
    }
    public CreateNewAppointmentResponse mapAppointmentToCreateNewAppointmentResponse(Appointment appointment) {
        var response = new CreateNewAppointmentResponse();

        response.setId(appointment.getId());
        response.setAppointmentType(appointment.getAppointmentType());
        response.setStartTime(appointment.getStartTime());
        response.setEndTime(appointment.getEndTime());
        response.setCostPerUnit(appointment.getCostPerUnit());
        response.setTotalCost(appointment.totalCost());

        return response;
    }
    public Appointment mapCreateNewAppointmentRequestToAppointment(CreateNewAppointmentRequest request) {
        var appointment = new Appointment();

        appointment.setAppointmentType(request.getAppointmentType());
        appointment.setStartTime(request.getStartTime());
        appointment.setEndTime(request.getEndTime());
        appointment.setCostPerUnit(request.getCostPerUnit());

        return appointment;
    }
}
