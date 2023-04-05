package com.indy8.petplanner.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MapperConfig {

    @Bean
    public PetMapper petMapper() {
        return new PetMapper();
    }

    @Bean
    public AppointmentMapper appointmentMapper() {
        return new AppointmentMapper();
    }

    @Bean
    public ClientMapper clientMapper() {
        return new ClientMapper();
    }
}