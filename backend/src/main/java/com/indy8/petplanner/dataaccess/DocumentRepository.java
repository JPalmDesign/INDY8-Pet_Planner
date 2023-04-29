package com.indy8.petplanner.dataaccess;

import com.indy8.petplanner.domain.Document;
import org.springframework.data.repository.CrudRepository;

public interface DocumentRepository extends CrudRepository<Document, Integer> {

}
