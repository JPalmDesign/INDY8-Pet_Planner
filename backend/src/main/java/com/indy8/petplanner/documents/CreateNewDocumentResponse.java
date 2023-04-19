package com.indy8.petplanner.documents;

import java.time.LocalDateTime;

public class CreateNewDocumentResponse {
    private int id;
    private String recordType;
    private LocalDateTime uploadDateTime;
    private String name;  //Are not able to implement the scan feature in time

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRecordType() {
        return recordType;
    }

    public void setRecordType(String recordType) {
        this.recordType = recordType;
    }

    public LocalDateTime getUploadDateTime() {
        return uploadDateTime;
    }

    public void setUploadDateTime(LocalDateTime uploadDateTime) {
        this.uploadDateTime = uploadDateTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
