package com.indy8.petplanner.dataaccess;

import com.indy8.petplanner.domain.Pet;
import org.springframework.data.repository.CrudRepository;

public interface PetRepository extends CrudRepository<Pet, Integer> {

}
