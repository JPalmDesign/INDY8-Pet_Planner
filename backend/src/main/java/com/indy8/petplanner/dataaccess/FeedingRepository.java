package com.indy8.petplanner.dataaccess;

import com.indy8.petplanner.domain.Feeding;
import org.springframework.data.repository.CrudRepository;

public interface FeedingRepository extends CrudRepository<Feeding, Integer> {

}
