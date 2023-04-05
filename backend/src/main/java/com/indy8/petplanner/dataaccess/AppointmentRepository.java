package com.indy8.petplanner.dataaccess;

import com.indy8.petplanner.domain.Appointment;
import org.springframework.data.repository.CrudRepository;

public interface AppointmentRepository extends CrudRepository<Appointment, Integer> {

}
