package com.indy8.petplanner.documents;

import com.indy8.petplanner.config.DocumentMapper;
import com.indy8.petplanner.dataaccess.DocumentRepository;
import com.indy8.petplanner.dataaccess.PetRepository;
import com.indy8.petplanner.dataaccess.ClientRepository;
import com.indy8.petplanner.dataaccess.AppointmentRepository;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class DocumentsController {
    private final DocumentRepository documentRepository;
    private final PetRepository petRepository;
    private final ClientRepository clientRepository;
    private final AppointmentRepository appointmentRepository;
    private final DocumentMapper documentMapper;

    public DocumentsController(DocumentRepository documentRepository, PetRepository petRepository,
                               ClientRepository clientRepository, AppointmentRepository appointmentRepository,
                               DocumentMapper documentMapper) {
        this.documentRepository = documentRepository;
        this.petRepository = petRepository;
        this.clientRepository = clientRepository;
        this.appointmentRepository = appointmentRepository;
        this.documentMapper = documentMapper;
    }

    @GetMapping("/document/{id}")
    public DocumentByIdResponse getDocumentById(@RequestParam(value = "id") Integer id) {
        var dbResult = documentRepository.findById(id);
        if (dbResult.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "entity not found"
            );
        }
        return this.documentMapper.mapDocumentToDocumentByIdResponse(dbResult.get());
    }

    @PostMapping("/document")
    public CreateNewDocumentResponse createNewDocument(@RequestBody CreateNewDocumentRequest createNewDocumentRequest){
        var document = this.documentMapper.mapCreateNewDocumentRequestToDocument(createNewDocumentRequest);

        switch (createNewDocumentRequest.getRecordType()) {
            case "Vaccination(s)":
                return createNewPetDocument(createNewDocumentRequest);
            case "Driver's License":
                return createNewClientDocument(createNewDocumentRequest);
            case "Invoice":
                return createNewAppointmentDocument(createNewDocumentRequest);
            default:
                throw new ResponseStatusException(
                        HttpStatus.BAD_REQUEST, "invalid document type"
                );
        }
    }

    public CreateNewDocumentResponse createNewPetDocument(CreateNewDocumentRequest createNewDocumentRequest) {
        var document = this.documentMapper.mapCreateNewDocumentRequestToDocument(createNewDocumentRequest);
        if(createNewDocumentRequest.getPetId() == null) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Pet ID is required"
            );
        }
        var pet = petRepository.findById(createNewDocumentRequest.getPetId());
        if (pet.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Pet does not exist"
            );
        }
        document.setPet(pet.get());
        documentRepository.save(document);
        return this.documentMapper.mapDocumentToCreateNewDocumentResponse(document);
    }

    public CreateNewDocumentResponse createNewClientDocument(CreateNewDocumentRequest createNewDocumentRequest) {
        var document = this.documentMapper.mapCreateNewDocumentRequestToDocument(createNewDocumentRequest);
        if(createNewDocumentRequest.getClientId() == null) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Client ID is required"
            );
        }
        var client = clientRepository.findById(createNewDocumentRequest.getClientId());
        if (client.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Client does not exist"
            );
        }
        document.setClient(client.get());
        documentRepository.save(document);
        return this.documentMapper.mapDocumentToCreateNewDocumentResponse(document);
    }

    public CreateNewDocumentResponse createNewAppointmentDocument(CreateNewDocumentRequest createNewDocumentRequest) {
        var document = this.documentMapper.mapCreateNewDocumentRequestToDocument(createNewDocumentRequest);
        if(createNewDocumentRequest.getAppointmentId() == null) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Appointment ID is required"
            );
        }
        var appointment = appointmentRepository.findById(createNewDocumentRequest.getAppointmentId());
        if (appointment.isEmpty()) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "Appointment does not exist"
            );
        }
        document.setAppointment(appointment.get());
        documentRepository.save(document);
        return this.documentMapper.mapDocumentToCreateNewDocumentResponse(document);
    }
}
