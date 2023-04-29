package com.indy8.petplanner.config;

import com.indy8.petplanner.documents.DocumentByIdResponse;
import com.indy8.petplanner.documents.CreateNewDocumentRequest;
import com.indy8.petplanner.documents.CreateNewDocumentResponse;
import com.indy8.petplanner.domain.Document;

public class DocumentMapper {
    public DocumentByIdResponse mapDocumentToDocumentByIdResponse(Document document) {
        var response = new DocumentByIdResponse();

        response.setId(document.getId());
        response.setRecordType(document.getRecordType());
        response.setUploadDateTime(document.getUploadDateTime());
        response.setName(document.getName());

        return response;
    }
    public CreateNewDocumentResponse mapDocumentToCreateNewDocumentResponse(Document document) {
        var response = new CreateNewDocumentResponse();

        response.setId(document.getId());
        response.setRecordType(document.getRecordType());
        response.setUploadDateTime(document.getUploadDateTime());
        response.setName(document.getName());

        return response;
    }
    public Document mapCreateNewDocumentRequestToDocument(CreateNewDocumentRequest request) {
        var document = new Document();

        document.setRecordType(request.getRecordType());
        document.setUploadDateTime(request.getUploadDateTime());
        document.setName(request.getName());

        return document;
    }
}
