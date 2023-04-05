package com.indy8.petplanner.dataaccess;

import com.indy8.petplanner.domain.Client;
import org.springframework.data.repository.CrudRepository;

public interface ClientRepository extends CrudRepository<Client, Integer> {
}
